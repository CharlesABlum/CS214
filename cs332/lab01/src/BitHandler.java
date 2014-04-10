/**
 * This class handles the bits that come in
 * @author 		Charles Blum and Prof. Norman
 * For:			cs332 - lab1
 * created on:	2014-02-24
 */
public class BitHandler extends Thread
{
	public static final int HALFPERIOD = 25;

	private static final String SILENCE = "SILENCE";
	private static final String EXPECT_ZERO = "EXPECT_ZERO";
	private static final String EXPECT_ONE = "EXPECT_ONE";
	private static final String HALF_ZERO = "HALF_ZERO";
	private static final String HALF_ONE = "HALF_ONE";
	private static final String GARBAGE = "GARBAGE";

	private LightPanel panel;
	private BitListener listener;
	private String state = SILENCE;

	/**
	 * default constructor
	 */
	public BitHandler()
	{
		this("localhost", LightSystem.DEFAULT_PORT);
	}

	/**
	 * explicit constructor
	 * @param host, the hostname
	 * @param port, the port number
	 */
	public BitHandler(String host, int port)
	{
		panel = new LightPanel(host, port);
		start();
	}
	
	/**
	 * sleep the thread for a given length of time
	 * @param milliseconds
	 */
	public static void pause(int milliseconds)
	{
		try {
			Thread.sleep(milliseconds);
		} catch(InterruptedException e) {
			// should never get here, but
			// let's print something just in case
			e.printStackTrace();
		}
	}

	/**
	 * Turn the light system on (if it isn't already), then wait half
	 * a period.  Then turn the light off, for half a period.
	 * @throws CollisionException 
	 */
	public void broadcastZero() throws CollisionException
	{
		if ( !panel.isOn() )
			panel.switchOn();
		pause(HALFPERIOD);
		if ( !panel.isOn() ) throw new CollisionException();
		panel.switchOff();
		pause(HALFPERIOD);
		if ( panel.isOn() ) throw new CollisionException();
	}

	/**
	 * Turn the light system off (if it isn't already), then wait half
	 * a period.  Then turn the light on, for half a period.
	 * @throws CollisionException, throws exception if there is a collision 
	 */
	public void broadcastOne() throws CollisionException
	{
		if ( panel.isOn() )
			panel.switchOff();
		pause(HALFPERIOD);
		if ( panel.isOn() ) throw new CollisionException();
		panel.switchOn();
		pause(HALFPERIOD);
		if ( !panel.isOn() ) throw new CollisionException();
	}

	/**
	 * Given a string of bits (0s and 1s), send each bit using broadcastOne/Zero().
	 * Build up a string of successfully sent bits (called "broadcasted").
	 * Switch the light off when done.
	 * @throws CollisionException, throws exception if there is a collision
	 */
	public void broadcast(String bits) throws CollisionException
	{
		char bit;
		for (int i = 0; i < bits.length(); i++ )
		{
			bit = bits.charAt(i);
			if ( bit == '0' )
				this.broadcastZero();
			else
				this.broadcastOne();
		}
		panel.switchOff();
	}

	/**
	 * return the socket ID as a String
	 * @return socket ID 
	 */
	public String toString()
	{
		return panel.toString();
	}

	/**
	 * Repeatedly (and as fast as possible), check if the panel's light has changed from on to off
	 * or vice versa.  When it does, check how much time passed between transitions.  Based on this
	 * time and which direction the transition was made, determine if a 0 or 1 bit was received.
	 * Send the result off to the registered Listener.
	 */
	public void run()
	{
		long lastTransition = System.currentTimeMillis();
		String bits = "";
		boolean wasOn = false;
		while (true) {
			long time = System.currentTimeMillis();
			String lastState = state;

			if (panel.isOn() != wasOn) {    // a transition was made: on to off or vice versa
				if (time - lastTransition > HALFPERIOD * 1.5) {
					// full delay
					if (state.equals(SILENCE)) {
						/* all broadcasts start with a 0, after silence for a while */
						state = EXPECT_ZERO;
					} else if (state.equals(EXPECT_ZERO)) {
						bits = "";
						state = SILENCE;
					} else if (state.equals(EXPECT_ONE)) {
						state = EXPECT_ZERO;
						notifyReceived(bits);
						bits = "";
					} else if (state.equals(HALF_ZERO)) {
						bits += "0";
						state = HALF_ONE;
					} else if (state.equals(HALF_ONE)) {
						bits += "1";
						state = HALF_ZERO;
					} else if (state.equals(GARBAGE))
						state = HALF_ZERO;
				} else {
					// half delay
					if (state.equals(SILENCE))
						state = EXPECT_ZERO;
					else if (state.equals(EXPECT_ZERO))
						state = HALF_ZERO;
					else if (state.equals(EXPECT_ONE))
						state = HALF_ONE;
					else if (state.equals(HALF_ZERO)) {
						bits += "0";
						state = EXPECT_ZERO;
					} else if (state.equals(HALF_ONE)) {
						bits += "1";
						state = EXPECT_ONE;
					} else if (state.equals(GARBAGE))
						state = HALF_ZERO;
				}
				lastTransition = time;
				wasOn = !wasOn;
			}
			else if (time - lastTransition > 3 * HALFPERIOD) {
				//timeout

//				 System.out.println(this + ":  timeout");

				if (state.equals(SILENCE)) {
					//no transition
				} else if (state.equals(EXPECT_ZERO)) {
					bits = "";
					state = GARBAGE;
				}

				if (state.equals(EXPECT_ONE)) {
					state = SILENCE;
					notifyReceived(bits);
					bits = "";
				} else if (state.equals(HALF_ZERO)) {
					state = SILENCE;
					notifyReceived(bits + "0");
					bits = "";
				} else if (state.equals(HALF_ONE)) {
					bits = "";
					state = GARBAGE;
				} else if (state.equals(GARBAGE)) {
					//no transition
				}
			}

			//System.out.println(getID() + " is alive");

			pause(1);
		}
	}

	/**
	 * listens to see if there is a message being sent
	 * @param l, a bitListener
	 */
	public void setListener(BitListener l)
	{
		listener = l;
	}

	/**
	 * Is there any data coming in? If yes then false, otherwise true
	 * @return boolean 
	 */
	public boolean isSilent()
	{
		return state.equals(SILENCE);
	}

	/**
	 * return the socket ID
	 * @return int, ID of the socket
	 */
	public int getID()
	{
		return panel.getID();
	}

	/**
	 * send a 
	 * @param bits
	 */
	private void notifyReceived(final String bits)
	{
		if (listener == null)
			return;
		new Thread()
		{
			public void run()
			{
				listener.bitsReceived(BitHandler.this, bits);
			}
		}.start();
		System.out.println(this + " received bits:  " + bits);
	}
}