public class TestServer {
	public static void main (String [] args ) 
	{
		//Tested with Nate Kasemen
		LightSystem system = new LightSystem(); 
		LightDisplay d1 = new LightDisplay(new LightPanel()); 
		BitDisplay   b1 = new BitDisplay(new BitHandler());
	}
}