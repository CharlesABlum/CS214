
/**
 * This abstract class represents a Layer2 object that can send and receive
 * layer 2 frames.
 */
public abstract class Layer2Handler implements BitListener
{
    private BitHandler handler;
    private Layer2Listener listener;    // we'll inform this listener if we receive a packet
    private String lastSent = "";	// keeps track of the last frame that we sent so that
    					// we can drop it if we get it back (because some other
    					// device copied back to us).

    /**
     * Create an object, using "localhost" and DEFAULT_PORT, for the
     * IP host and TCP port that this object's BitHandler will connect to
     * (i.e., the LightSystem).
     */
    public Layer2Handler()
    {
	this("localhost", LightSystem.DEFAULT_PORT);
    }

    /**
     * Create an object, and create a BitHandler for it to use in the layer
     * below it.  Set this object to receive bitStrings when a bit string
     * is received at the BitHandler below it.
     */
    public Layer2Handler(String host, int port)
    {
	handler = new BitHandler(host, port);
	handler.setListener(this);	// I'm listening to what it receives.
    }

    /**
     * Given a frame, convert it to a string of bits and send it using the
     * BitHandler on layer 1 "below".
     */
    public void send(Layer2Frame frame)
    {
	String bits = frame.toString();
	lastSent = bits;
	System.err.println("Layer2H.send: frame bits = " + bits);
	while (! handler.isSilent()) {
	    BitHandler.pause(BitHandler.HALFPERIOD);
	}
	try {
	    handler.broadcast(bits);
	} catch (CollisionException e) {
	    System.err.println("COLLISION IN SENDING!");
	}
    }

    /**
     * Allow another object (e.g., a Layer 3 object) to register itself to
     * get called when this object receives a good frame.
     */
    public void setListener(Layer2Listener l)
    {
	assert listener == null;
	listener = l;
    }

    /**
     * A default implementation that says we do not drop a received frame.
     * Override in a subclass to specify when it should be dropped.
     * The frame is passed in both cooked and raw formats.
     */
    public boolean dropReceivedFrame(Layer2Frame fr, String bits)
    {
	return false;
    }

    /**
     * Called when the layer below receives bits successfully.  This code
     * drops packets that we sent that were mirrored back to us, parses the
     * bits into a Layer2Frame (making sure they are a legal format), and
     * calls dropReceivedFrame (implemented in subclasses, possibly), to
     * determine if the frame should not be handled here because it isn't
     * for this endpoint.  If the frame is for me, then call the
     * upper-layer listener with the received frame.
     */
    public void bitsReceived(BitHandler handler, String bits)
    {
	try {
	    /*
	     * Drop packet that I sent and came back to me.  (lastSent recorded in super class.)
	     */
	    if (bits.equals(lastSent)) {
		// TODO: do I need to clear the lastSent bits here?  I don't think it is necessary...
		return;
	    }

	    Layer2Frame fr = new Layer2Frame(bits);

	    // Throw away the frame if it is supposed to be filtered out.  A subclass
	    // will often implement this.
	    if (dropReceivedFrame(fr, bits)) {
		return;
	    }
	    if (listener != null) {
		listener.frameReceived(this, fr);
	    }
	} catch (Exception e) {
	    System.err.println("Bad Layer2 packet.  Dropping...");
	}
    }    
}
