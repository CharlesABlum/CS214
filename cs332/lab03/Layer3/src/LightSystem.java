import java.io.*;
import java.net.*;
import java.util.*;

public class LightSystem extends Thread
{
    public static final int DEFAULT_PORT = 9223;
    public static final String HIGH = "H";
    public static final String LOW = "L";

    private static Random random = new Random();

    public static Random getRandom()
    {
	return random;
    }

    private Set outs = new HashSet();
    private boolean isHigh = false;
    private int port;

    public LightSystem()
    {
	this(DEFAULT_PORT);
    }

    public LightSystem(int port)
    {
	this.port = port;
	start();
    }

    public void run()
    {
	try {
	    ServerSocket serverSocket = new ServerSocket(port);
	    while (true) {
		Socket clientSocket = serverSocket.accept();

		System.out.println(clientSocket + " connected");

		PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
		outs.add(out);
		BufferedReader in =
		    new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
		LightSystemThread thread = new LightSystemThread(this, in);
		thread.start();
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

    public void switchOn()
    {
	if (! isHigh) {
	    isHigh = true;
	    notifyClients();
	}
    }

    public void switchOff()
    {
	if (isHigh) {
	    isHigh = false;
	    notifyClients();
	}
    }

    private void notifyClients()
    {
	Iterator it = outs.iterator();
	while (it.hasNext()) {
	    PrintWriter out = (PrintWriter) it.next();
	    notifyClient(out);
	}
    }

    private void notifyClient(PrintWriter out)
    {
	if (isHigh)
	    out.println(HIGH);
	else
	    out.println(LOW);
    }
}