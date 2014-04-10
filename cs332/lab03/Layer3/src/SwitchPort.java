import java.util.concurrent.ArrayBlockingQueue;
import java.util.Queue;

/**
 * This is just like a Layer2Handler, but has no MAC Address. Instead, it
 * represents a port on a switch.  It has a portNum representing which port
 * this is on its switch, and it keeps a queue of frames to be sent out when
 * the layer 1 below is ready to receive them.
 * The constructor creates a thread that blocks on the queue, waiting for
 * frames to be added.  When a frame is added, the thread wakes up,
 * dequeues the frame and sends it.  Frames are added to the queue by the
 * Switch object calling addToOutQ().
 */
public class SwitchPort extends Layer2Handler implements BitListener
{
    private int portNum;   // the port # this port is identified as in a Switch
    private final static int QUEUE_LEN = 5;	// 5 message can be pending
						// to send on the port.
    /**
     * The outgoing queue of frames to be sent on this port.
     */
    private ArrayBlockingQueue<Layer2Frame> outQ =
	new ArrayBlockingQueue<Layer2Frame>(SwitchPort.QUEUE_LEN);

    /**
     * @param switchPortNum the port number of this switch port on a Switch.
     */
    public SwitchPort(int switchPortNum)
    {
	this("localhost", LightSystem.DEFAULT_PORT, switchPortNum);
    }

    /**
     * @param lightSysHost the hostname of the machine on which the
     * LightSystem is executing.
     * @param lightSysPort the port the LightSystem is listening on.
     * @param switchPortNum the port number of this switch port on a Switch.
     * This method creates a SwitchPort object, identified by the given
     * switchPortNum.  This method creates and executes a thread that waits
     * on the outQ queue for a frame to be inserted.  When this happens,
     * the thread dequeues the frame and sends its via the super class's
     * send() method.
     */
    public SwitchPort(String lightSysHost, int lightSysPort, int switchPortNum)
    {
	super(lightSysHost, lightSysPort);
	this.portNum = switchPortNum;
	new Thread()
	{
	    public void run()
	    {
		while (true) {
		    try {
			Layer2Frame fr = outQ.take();	// blocks until frame is available.
			System.out.println("SwitchPort " + portNum + ": sending frame from outQ");
			send(fr);  // implemented in Layer2Handler.
		    } catch (InterruptedException e) {
			System.err.println("SwitchPort thread interrupted!");
		    }
		}
	    }
	}.start();
    }

    public String toString()
    {
	return Integer.toString(portNum);
    }

    public int getPortNum()
    {
	return portNum;
    }

    // No need to override the default bitsReceived() or dropReceivedFrame().
    // We will receive every frame we get from the LightSystem.

    /**
     * A caller (a Switch object) can to add a frame to the outgoing
     * queue on this SwitchPort.
     */
    public void addToOutQ(Layer2Frame fr)
    {
	if (! outQ.offer(fr)) {	  // false return value means queue was full.
	    System.out.println("addToOutQ[" + portNum + "]: dropped frame to " + fr.getDestAddr() +
			       " due to full queue.");
	    return;
	}
	System.out.println("addToOutQ[" + portNum + "]: frame to " + fr.getDestAddr() +
			       " enqueued.");
    }
}
