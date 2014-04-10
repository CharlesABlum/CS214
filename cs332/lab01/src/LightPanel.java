import java.io.*;
import java.net.*;
import java.util.*;

/**
 * 
 * @author		Charles Blum and Prof. Norman
 * For:			cs332 - lab1
 * Created on:	2014-02-24
 */
public class LightPanel extends Thread
{
	private static Set idsUsed = new HashSet();

	private int id;
	private Socket socket;
	private PrintWriter out;
	private BufferedReader in;
	private boolean isHigh = false;

	/**
	 * default constructor
	 */
	public LightPanel()
	{
		this("localhost", LightSystem.DEFAULT_PORT);
	}

	/**
	 * explicit constructor
	 * @param host, hostname
	 * @param port, port number
	 */
	public LightPanel(String host, int port)
	{
		do {
			id = LightSystem.getRandom().nextInt(15) + 1;
		} while (!idsUsed.add(new Integer(id)));

		try {
			socket = new Socket(host, port);
			out = new PrintWriter(socket.getOutputStream(), true);
			in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			start();
		}
		catch (UnknownHostException e) {
			throw new RuntimeException("Invalid host:  " + host);
		}
		catch (IOException e) {
			throw new RuntimeException("Unable to connect to LightSystem");
		}
	}

	/**
	 * place an H on the output stream to be sent
	 */
	public void switchOn()
	{
		out.println(LightSystem.HIGH);
	}

	/**
	 * place a L on the output stream to be sent
	 */
	public void switchOff()
	{
		out.println(LightSystem.LOW);
	}

	/**
	 * shutdown the LightPanel
	 */
	public void close()
	{
		try {
			out.close();
			in.close();
			socket.close();
		}
		catch(Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * when a line comes in, read it and change light state accordingly
	 */
	public void run()
	{
		try {
			String line = in.readLine();
			while (line != null) {
				if (line.equals(LightSystem.HIGH))
					isHigh = true;
				else if (line.equals(LightSystem.LOW))
					isHigh = false;
				line = in.readLine();
			}
		}
		catch (Exception e) {
			System.out.println("LightPanel disconnected");
			throw new RuntimeException(e);
		}
	}

	/**
	 * returns the state of the lights
	 * @return boolean isHigh
	 */
	public boolean isOn()
	{
		return isHigh;
	}

	/**
	 * returns the ID of the socket as a String
	 * @return String, "#<id>"
	 */
	public String toString()
	{
		return "#" + id;
	}

	/**
	 * get the numeric value of the socket ID
	 * @return int id
	 */
	public int getID()
	{
		return id;
	}
}