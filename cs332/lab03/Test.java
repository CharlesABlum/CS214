public class Test
{
    final static int LAN1PORT = LightSystem.DEFAULT_PORT;
    final static int LAN2PORT = LightSystem.DEFAULT_PORT + 1;
    final static int LAN3PORT = LightSystem.DEFAULT_PORT + 2;
    final static int LAN4PORT = LightSystem.DEFAULT_PORT + 3;

    
    public static void main(String[] args)
    {
	// testSwitch();

	testLayer3();
    }

    public static void testLayer3()
    {
	new LightSystem();
	// 1 is the mac address
	Layer2Endpoint le1 = new Layer2Endpoint("localhost", LAN1PORT, 1);
	// 1 is the network part.  thus the address is 1.1.
	new L3Display(new L3Handler(le1, 1));			    

	// L3 endpoint with address 1.2
	Layer2Endpoint le2 = new Layer2Endpoint("localhost", LAN1PORT, 2);
	new L3Display(new L3Handler(le2, 1));

	Layer2Endpoint le3 = new Layer2Endpoint("localhost", LAN1PORT, 3);
	new L3Display(new L3Handler(le3, 1));
	
    }

    public static void testSwitch()
    {
	new LightSystem();
	//	new LightDisplay(new LightPanel("LAN 1"));

	new LightSystem(LAN2PORT);
	//	new LightDisplay(new LightPanel("LAN 2", "localhost", LAN2PORT));

	new LightSystem(LAN3PORT);
	//	new LightDisplay(new LightPanel("LAN 3", "localhost", LAN3PORT));
	
	new LightSystem(LAN4PORT);
	//	new LightDisplay(new LightPanel("LAN 4", "localhost", LAN4PORT));

	Switch sw = new Switch(8);	// 8 port switch
	new SwitchDisplay(sw);

	// A switch port connected to LightSystem sys1 (DEFAULT_PORT) on the switch's
	// port 0.
	sw.attachPort(new SwitchPort(0),
		      new SwitchLightPanel("LAN 1", "localhost", LAN1PORT));

	// A host on LightSystem 1.
	new Layer2Display(new Layer2Endpoint(17));
	
	// Create a 2nd switch port, connected to the 2nd Light System, and attached
	// to our switch's port 1.
	sw.attachPort(new SwitchPort("localhost", LAN2PORT, 1),
		      new SwitchLightPanel("LAN 2", "localhost", LAN2PORT));

	// 2 Hosts on light system 2.
	new Layer2Display(new Layer2Endpoint("localhost", LAN2PORT, 18));
	new Layer2Display(new Layer2Endpoint("localhost", LAN2PORT, 19));
	
	// Create a 3rd switch port, connected to the 3rd Light System, and attached
	// to our switch's port 2.
	sw.attachPort(new SwitchPort("localhost", LAN3PORT, 2),
		      new SwitchLightPanel("LAN 3", "localhost", LAN3PORT));

	// 2 Hosts on light system 3.
	new Layer2Display(new Layer2Endpoint("localhost", LAN3PORT, 20));
	new Layer2Display(new Layer2Endpoint("localhost", LAN3PORT, 21));

	// Create a 4th switch port, connected to the 4th Light System, and attached
	// to our switch's port 3.
	sw.attachPort(new SwitchPort("localhost", LAN4PORT, 3),
		      new SwitchLightPanel("LAN 4", "localhost", LAN4PORT));

	// 2 Hosts on light system 4.
	new Layer2Display(new Layer2Endpoint("localhost", LAN4PORT, 22));
	new Layer2Display(new Layer2Endpoint("localhost", LAN4PORT, 23));

    }
}