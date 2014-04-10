import java.io.*;
import java.net.*;
import java.nio.*;
import java.nio.channels.*;
//import java.util.*;

public class Chat_Client {
	private Socket socket;
	private BufferedReader localBR, socketBR;
//	private InputStreamReader localIn, socketIn;
	private CharBuffer localBuf, socketBuf;
	Selector selector = null;
	SocketChannel channel = null;
	int readyChannels = 0;
	
	 
	
	
	public Chat_Client( Boolean v, String server, int port, String name ) {
		try {
			socket  = new Socket( server, port );
			/* Help from wikipedia on stdin
			 * http://en.wikipedia.org/wiki/Standard_streams
			 * serverBR adapted from LightLab in cs232 @ Calvin College 
			 */
//			localBR = new BufferedReader( new InputStreamReader(System.in) );
//			socketBR = new BufferedReader( new InputStreamReader(socket.getInputStream()) );
			
			localBuf = CharBuffer.allocate(512); //allow 512 characters at a time
			socketBuf = CharBuffer.allocate(512);
			
			
			
			
		} catch (UnknownHostException e) {
			throw new RuntimeException( "Unknown host: " + server );
		} catch (IOException e) {
			throw new RuntimeException( "Unable to connect!" );
		}
		
		/* Listen to stdin and the socket, and print accordingly */
		/* If only java implemented the select() system call...
		 */

		try {	
			channel = SocketChannel.open();
			channel.connect( new InetSocketAddress(port) );
			channel.configureBlocking(false);
			selector = Selector.open();
			SelectionKey key = channel.register(selector, SelectionKey.OP_READ);
		} catch (IOException e) {
			throw new RuntimeException( "Unable to create channel!" );
		}

		
		while ( true )
		{
			try {
				readyChannels = selector.select();
			} catch (IOException e) {
				throw new RuntimeException("cannot get selector!");
			}
			
			if ( readyChannels == 0 ) continue;	//If both buffers are empty...
			
			Set<SelectionKey> selectedKeys = 
			
			/* http://unixhelp.ed.ac.uk/CGI/man-cgi?select+2 
			 * http://www.gnu.org/software/libc/manual/html_node/Waiting-for-I_002fO.html
			 * http://tutorials.jenkov.com/java-nio/selectors.html
			 */
			/*
			
			
			SelectionKey key = channel.register(selector, SelectionKey.OP_READ);
			while(true) {
				int readyChannels = selector.select();
				
				if(readyChannels == 0) continue;
				
				Set<SelectionKey> selectedKeys = selector.selectedKeys();
				Iterator<SelectionKey> keyIterator = selectedKeys.iterator();
				while(keyIterator.hasNext()) {
					SelectionKey key = keyIterator.next();
					if(key.isAcceptable()) {
						// a connection was accepted by a ServerSocketChannel.
					} else if (key.isConnectable()) {
						// a connection was established with a remote server.
					} else if (key.isReadable()) {
						// a channel is ready for reading
					} else if (key.isWritable()) {
						// a channel is ready for writing
					}
					keyIterator.remove();
				}
			}
			*/
		
			
			
			
		}
	}
	
	public static void main(String[] args) {
		Boolean v = false;
		String server = "127.0.0.1";
		String name = "theo";
		int port = 12345;
		
		/* Parse the command line arguments using the options below 
		 * -----------------------------------------------------------------------------
		 * -v,	--verbose  	Turn on verbose printing to			False 
		 * 					help debugging 
		 * -----------------------------------------------------------------------------	
		 * -s,	--server	Server name or IP address; the  		127.0.0.1	(i.e.,
		 * 					machine the server is running on 	localhost-this machine)
		 * 	-----------------------------------------------------------------------------
		 * -p,	--port	 	Port number; the TCP port the		12345 
		 * 					server is istening on.	
		 * -----------------------------------------------------------------------------
		 * -n,	--name	 	A string; the name by which you		Your Machine Name
		 * 					are	identified to others.
		 * -----------------------------------------------------------------------------
		 */
		if ( args.length < 0 )
		{
			printHelp();
			System.exit(1);
		}
		for ( int i = 0; i < args.length; i++ )
		{
			if ( args[i].equals("-v") || args[i].equals("--verbose") )
			{
				v = true;
			}
			else if ( args[i].equals("-s") || args[i].equals("--server") )
			{
				i++;
				server = args[i];
			}
			else if ( args[i].equals("-p") || args[i].equals("-port") )
			{
				try 
				{
					i++;
					port = Integer.parseInt(args[i]);
				} catch (NumberFormatException e) {
					System.out.println("not a valid port number");
					System.exit(1);
				}				
			}
			else if ( args[i].equals("-n") || args[i].equals("--name") )
			{
				i++;
				name = args[i];
			}	
			else
			{
				printHelp();
				System.exit(1);
			}
		}	/* parsing loop */
		
		/* connect to the server */
		Chat_Client chat = new Chat_Client( v, server, port, name );
	}
	
	private static void printHelp() {
		System.out.println("How to use the Chat_Client:");
		System.out.println("Chat_Client [-v || --verbose] [-s || --server] [-p || --port] {-n || --name}");
		System.out.println("-v, --verbose turns on verbose mode (default false)");
		System.out.println("-s, --server is the server IP (default 127.0.0.1");
		System.out.println("-p. --port is the port number the client is running on (default 12345)");
		System.out.println("-n, --name is th localhosts name (default \"theo\")");
	}
	
}
