/**
 * A Layer2Endpoint represents a Layer 2 entity that has a MAC address
 * hard-wired for it.  Thus, it represents a host or device on the network
 * that can generate and receive layer 2 frames.  It is not used for a
 * switch, e.g., where the interfaces do not have MAC addresses.
 *
 * The class is a subclass of Layer2Handler, overriding only the
 * dropReceivedFrame(), to drop frames with destination that isn't bcast or
 * this endpoint's mac address.
 */
public class Layer2Endpoint extends Layer2Handler implements BitListener
{
    private int macAddr;
    private int vlanId = 0;

    /**
     * Constructor: store the macAddr that identifies this endpoint, and
     * use the super class to create a layer 2 object that we use to
     * send/receive frames.  Use the default "localhost" and DEFAULT_PORT
     * to identify the LightSystem to connect to.
     */
    public Layer2Endpoint(int macAddr)
    {
	this("localhost", LightSystem.DEFAULT_PORT, macAddr);
    }

    /**
     * Constructor: store the macAddr that identifies this endpoint, and
     * use the super class to create a layer 2 object that we use to
     * send/receive frames.  Takes a host and TCP port to identify the
     * LightSystem to connect to. 
     */
    public Layer2Endpoint(String host, int port, int macAddr)
    {
	super(host, port);
	this.macAddr = macAddr;
    }

    /**
     * A string representation of this object -- the mac address.
     */
    public String toString()
    {
	return Integer.toString(getMacAddr());
    }

    /** return the mac address of this endpoint. */
    public int getMacAddr() { return macAddr; }
    /** return the vlanId of this endpoint. */
    public int getVlanId() { return vlanId; }

    /**
     * drop received frames that do not have either a bcast destination mac address
     * or this endpoint's destination mac address.
     */
    public boolean dropReceivedFrame(Layer2Frame fr, String bits)
    {
	if (fr.getDestAddr() != Layer2Frame.BCAST_ADDRESS &&
	    fr.getDestAddr() != macAddr) {
	    return true;
	}
	return false;
    }
}
