
public class TestClient {
	public static void main (String [] args ) 
	{		 
		//Nate Kasemen as server
		LightDisplay d1 = new LightDisplay(new LightPanel("153.106.117.97", LightSystem.DEFAULT_PORT)); 
		BitDisplay   b1 = new BitDisplay(new BitHandler("153.106.117.97", LightSystem.DEFAULT_PORT));
	}
}
