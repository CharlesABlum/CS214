import java.awt.event.*;
import java.awt.Font;
import javax.swing.*;

/**
 * This class creates a GUI to represent the ports on a switch and the
 * state of the MAC <--> port table.  It launches a thread for each port,
 * which monitors the "wire" for that port using a SwitchLightPanel object,
 * updating the icons to show if the port is actively receiving/sending
 * bits.
 */
public class SwitchDisplay implements SwitchListener
{
    private ImageIcon lightOffIcon;
    private ImageIcon lightOnIcon;
    private JLabel lightLabel;
    private JLabel[] portLabels;
    private JTextArea tableArea;

    private Switch sw; 

    /**
     * Create the GUI.
     */
    public SwitchDisplay(Switch sw)
    {
	this.sw = sw;
	portLabels = new JLabel[sw.getNumPorts()];
	
	JFrame frame = new JFrame("Switch");	// TODO get better name?

	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(),
						       BoxLayout.LINE_AXIS));

	JPanel portsPanel = new JPanel();
	portsPanel.setLayout(new BoxLayout(portsPanel, BoxLayout.PAGE_AXIS));
	frame.getContentPane().add(portsPanel);

	// Create a little panel for each port, containing a light and a number of
	// the port.
	lightOffIcon = new ImageIcon("lightoff.png");
	lightOnIcon = new ImageIcon("lighton.png");

	for (int i = 0; i < sw.getNumPorts(); i++) {
	    JPanel portPan = new JPanel();
	    portPan.setLayout(new BoxLayout(portPan, BoxLayout.LINE_AXIS));

	    // Create the lightbulb.
	    lightLabel = new JLabel(lightOffIcon);
	    lightLabel.setBorder(BorderFactory.createEtchedBorder());
	    portPan.add(lightLabel);
	    portLabels[i] = lightLabel;

	    // Create the port number.
	    portPan.add(new JLabel("" + i));

	    portsPanel.add(portPan);
	}

	tableArea = new JTextArea("MAC | Port", 8, 10);
	Font font = new Font("Courier", 0, 14);
	tableArea.setLineWrap(false);
	tableArea.setFont(font);
	frame.getContentPane().add(tableArea);

	frame.pack();
	frame.setVisible(true);

	sw.setListener(this);
    }

    /**
     * Launch a thread that, every millisecond, checks the state of the
     * "wire" on this port to see if it is "high" or "low".  Set the icon
     * accordingly in the GUI.
     */
    public void launchThreadToUpdateLights(final int ptNum, final SwitchLightPanel panel)
    {
	new Thread()
	{
	    public void run() {
		while (true) {
		    if (panel.isOn()) {
			portLabels[ptNum].setIcon(lightOnIcon);
		    } else {
			portLabels[ptNum].setIcon(lightOffIcon);
		    }
		    try {
			Thread.sleep(1);
		    } catch (InterruptedException e) {
		    }
		}
	    }
	}.start();
    }

    /**
     * When a port is attached, launch a thread to monitor the state of the
     * wire this port is connectd to.
     */
    public void portAttached(Switch sw, SwitchPort pt, SwitchLightPanel panel)
    {
	System.out.println("portAttached called");
	int ptNum = pt.getPortNum();
	launchThreadToUpdateLights(ptNum, panel);
    }

    /**
     * This callback is called whenever the underlying Switch object
     * changes its mac<-->port table.
     */
    public void macTableChanged(Switch sw)
    {
	String s = "MAC  |  Port\n" + sw.macAddrTableString();
	tableArea.setText(s);
    }
}
