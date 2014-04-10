import java.io.*;
import java.net.*;
import java.util.*;

/**
 * 
 * @author		Charles Blum and Prof. Norman
 * For:			cs332 - lab1
 * Created on:	2014-02-24
 */
public class LightSystem extends Thread
{
	public static final int DEFAULT_PORT = 9223;
	public static final String HIGH = "H";
	public static final String LOW = "L";

	private static Random random = new Random();

	/**
	 * Get a random number to ID the LightPanel
	 * @return
	 */
	public static Random getRandom()
	{
		return random;
	}

	private Set outs = new HashSet();
	private boolean isHigh = false;
	private int port;

	/**
	 * default constructor, using port 9223
	 */
	public LightSystem()
	{
		this(DEFAULT_PORT);
	}

	/**
	 * explicit constructor, using provided port
	 * @param port
	 */
	public LightSystem(int port)
	{
		this.port = port;
		start();
	}

	/**
	 * opens a new socket and prints out info to user
	 */
	public void run()
	{
		try {
			ServerSocket serverSocket = new ServerSocket(port);
			/*
			 * this loop repeats for each instance of LightDisplay
			 * that is created.
			 */
			while (true) {
				Socket clientSocket = serverSocket.accept();

				//prints out the socket information
				System.out.println(clientSocket + " connected");

				PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
				outs.add(out);
				BufferedReader in =
						new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
				LightSystemThread thread = new LightSystemThread(this, in);
				thread.start();
				//send out signal that a socket has been opened.
				notifyClient(out);
			}
		}
		catch (BindException e) {
			throw new RuntimeException("LightSystem/other already running on port");
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * change light state to on and notify everyone
	 */
	public void switchOn()
	{
		if (! isHigh) {
			isHigh = true;
			notifyClients();
		}
	}

	/**
	 * change light state to off and notify everyone
	 */
	public void switchOff()
	{
		if (isHigh) {
			isHigh = false;
			notifyClients();
		}
	}

	/**
	 * send notification to everyone in "outs" the state of the lights
	 */
	private void notifyClients()
	{
		Iterator it = outs.iterator();
		while (it.hasNext()) {
			PrintWriter out = (PrintWriter) it.next();
			notifyClient(out);
		}
	}

	/**
	 * send to a specific host "out" the state of the lights
	 * @param out
	 */
	private void notifyClient(PrintWriter out)
	{
		if (isHigh)
			out.println(HIGH);
		else
			out.println(LOW);
	}
}
