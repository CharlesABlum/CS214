import java.util.*;
import java.sql.Date;

/**
 * Switch models a learning switch, with multiple ports, each connected to
 * a bus, on which computers can connect.  This class keeps a table of MAC
 * <--> port bindings, so it can learn where MAC addresses "live".  This
 * class also contains a collection of SwitchPorts and a parallel
 * collection of SwitchLightPanels, each of which monitors the "wire" that
 * the port is connected to.
 */
public class Switch implements Layer2Listener
{
    /**
     * A MacTableEntry is a "row" in a table that maps a macAddr (integer)
     * to a SwitchPort object and timestamp.  This table is used for smart
     * forwarding of frames across the switch.
     */
    class MacTableEntry
    {
	SwitchPort sp;	// the port the mac is associated with
	Long time;	// the time the entry has been last seen/updated.

	MacTableEntry(SwitchPort s)
	{
	    sp = s;
	    updateTime();
	}

	/**
	 * update the timestamp on this entry to the current time.
	 */
	void updateTime()
	{
	    time = new Date(0).getTime() / 1000;	// number of seconds since epoch
	}

	/**
	 * update the switch port for this entry.  If it is different, then
	 * set the time.
	 */
	void updatePort(SwitchPort s)
	{
	    if (s.getPortNum() != sp.getPortNum()) {
		sp = s;
	    }
	    updateTime();
	}

	/**
	 * return true if this entry should be removed because it is more
	 * than 10 minutes old.
	 */
	Boolean timeOut()
	{
	    return (new Date(0).getTime() / 1000 - time > 600);   // 10 minute timeout
	}
    }
    // End of MacTableEntry class definition

    // 
    // Now, back to Switch definition.
    //
    
    /**
     * The list of ports on this switch, ordered by port #.
     */
    private SwitchPort[] ports;
    /**
     * The list of panels on this switch, ordered by port #.
     */
    private SwitchLightPanel[] panels;

    /**
     * This object's portAttached() will be called whenever a SwitchPort
     * attaches to this Switch.  The object can then get a handle on the
     * SwitchLightPanel so it can monitor the line to display if signals
     * are coming across the wire.
     */
    private SwitchListener listener;
    
    /**
     * macAddrTable is a mapping from macAddr (integer) to the MacTableEntry,
     * which holds the switch port the mac was last seen on, and the last time
     * the mac was seen on that port.
     */
    private Map<Integer, MacTableEntry> macAddrTable =
	new HashMap<Integer, MacTableEntry>();
    /**
     * The max number of ports on this switch.
     */
    private int numPorts;

    /**
     * Create a Switch with the given number of ports.  This method creates
     * the internal arrays of SwitchPorts and SwitchLightPanels.
     */
    public Switch(int numports)
    {
	ports = new SwitchPort[numports];
	panels = new SwitchLightPanel[numports];
	this.numPorts = numports;
    }

    /**
     * Add the given SwitchPort/SwitchLightPanel to our collection of
     * ports/panels.  Register this object as a listener of the
     * SwitchPort.  Call a registered SwitchListener object's
     * portAttached() method.
     */
    public void attachPort(SwitchPort pt, SwitchLightPanel panel)
    {
	ports[pt.getPortNum()] = pt;
	/* Add this Switch instance as a listener to this port, so that we receive
	   frames received on the port. */
	pt.setListener(this);

	/* Add this SwitchLightPanel to the list of lightpanels, corresponding
	   to this port's port number. */
	panels[pt.getPortNum()] = panel;

	/* Tell the listener that a new SwitchPort/SwitchLightPanel has
	   been attached. */
	if (listener != null) {
	    listener.portAttached(this, pt, panel);
	}
    }

    /**
     * return the entry for the given mac, or null if no entry exists.
     */
    public MacTableEntry findEntryByMac(int macAddr)
    {
	MacTableEntry e = macAddrTable.get(macAddr);
	if (e == null) {
	    return null;
	} else if (e.timeOut()) {
	    macAddrTable.remove(macAddr);
	    if (listener != null) {
		listener.macTableChanged(this);
	    }
	    return null;
	} else {
	    return e;
	}
    }

    /**
     * used when checking if a source mac is recorded in the macAddr table.
     * If it isn't there, add it.  If it is there, make sure the associated
     * switch port is correct.
     */
    public void addOrUpdateBySrcMac(int macAddr, SwitchPort s)
    {
	MacTableEntry entry = findEntryByMac(macAddr);
	if (entry == null) {
	    // no entry exists: create one.
	    System.out.println("Adding mactable entry: " + macAddr + " <--> " + s.getPortNum());
	    macAddrTable.put(macAddr, new MacTableEntry(s));
	} else {
	    entry.updatePort(s);
	}
	if (listener != null) {
	    listener.macTableChanged(this);
	}
    }

    /**
     * send the given frame on all registered ports, except port2Skip.
     */
    public void enQueueOnAllPortsExceptOne(SwitchPort port2Skip, Layer2Frame fr)
    {
	for (SwitchPort port : ports) {
	    if (port == null) {
		continue;
	    }
	    // don't send out the source port.
	    if (port != port2Skip) {
		port.addToOutQ(fr);
	    }
	}
    }
    

    /**
     * Handle frames received on a switch port.  This is the "main" function of the
     * switch.  Algorithm:
     *  1. Look in the macAddrTable for the srcMac.
     *  1.1. If found, update the entry with the port the frame came in on.
     *  1.2. Else: add an entry.
     *  2. If the destMac is bcast, send to all ports except the incoming one.  Return.
     *  3. Look in the macAddrTable for the destMac.
     *  3.1. If found, send the frame on the associated port.
     *  3.2. Else, send the frame out on all ports, except the port the frame came in on.
     */
    public void frameReceived(Layer2Handler handler, Layer2Frame frame)
    {
	/* The handler is actually a SwitchPort. */
	SwitchPort srcPt = (SwitchPort) handler;
	System.out.println("Got frame on port " + srcPt.getPortNum());

	/* Step 1. in algorithm above is done by this function. */
        addOrUpdateBySrcMac(frame.getSrcAddr(), srcPt);

	/* Step 2. */
	if (frame.getDestAddr() == Layer2Frame.BCAST_ADDRESS) {
	    enQueueOnAllPortsExceptOne(srcPt, frame);
	    return;
	}

	/* Step 3. */
	MacTableEntry e = findEntryByMac(frame.getDestAddr());
	if (e != null) {
	    /* send out using the entry's switchport */
	    e.sp.addToOutQ(frame);
	} else {
	    enQueueOnAllPortsExceptOne(srcPt, frame);
	}
    }

    /** return numPorts value */
    public int getNumPorts()
    {
	return numPorts;
    }

    /** return the ith switch port panel */
    public SwitchLightPanel getPanel(int i)
    {
	return panels[i];
    }

    /**
     * Store an object to receive a callback when a port is attached.
     */
    public void setListener(SwitchListener l)
    {
	assert listener == null;
	listener = l;
    }

    /**
     * return the MacAddrTable as a long string, one entry per line.
     * Each line shows the MAC address and portnumber, in a nice format.
     */
    public String macAddrTableString()
    {
	String res = "";
	for (Map.Entry<Integer, MacTableEntry> entry : macAddrTable.entrySet()) {
	    res += entry.getKey() + "   |  " + entry.getValue().sp.getPortNum() + "\n";
	}
	return res;
    }

}