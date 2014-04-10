import java.io.*;
import java.net.*;
import java.util.*;

/**
 * This class is similar to a LightPanel.  It connects to a LightSystem
 * using a socket, and receives the High and Low signals going by.  It sets
 * its own local variable "isHigh" according to the state of the
 * LightSystem "voltages".  All this is done by a thread that is launched
 * by the class constructor.
 * Other classes, like a SwitchDisplay, can monitor this class's isHigh
 * variable to see the state of the "wire".
 */
public class SwitchLightPanel extends Thread
{
    private Socket socket;
    private BufferedReader in;
    private boolean isHigh = false;
    private String lanName = "";

    /**
     * This is almost identical to a LightPanel, except we won't be
     * writing out anything to the socket.  We'll just be listening in
     * so that we can update the SwitchDisplay's little flashing lights.
     */
    public SwitchLightPanel(String name, String host, int port)
    {
	this.lanName = name;
	try {
	    socket = new Socket(host, port);
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
     * Read the socket from the LightSystem and turn isHigh to true or false
     * depending on what values you get from the LightSystem.
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

    public boolean isOn()
    {
	return isHigh;
    }
}
