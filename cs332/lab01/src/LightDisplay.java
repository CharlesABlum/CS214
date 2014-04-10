import java.awt.event.*;
import javax.swing.*;

/**
 * 
 * @author		Charles Blum and Prof. Norman
 * For:			cs332 - lab1
 * Created on:	2014-02-24
 */
public class LightDisplay extends Thread implements ActionListener
{
    private LightPanel panel;
    private ImageIcon lightOffIcon;
    private ImageIcon lightOnIcon;
    private JLabel lightLabel;

    /**
     * Creates the GUI for the lights.
     * @param panel
     */
    public LightDisplay(LightPanel panel)
    {
	this.panel = panel;

	JFrame frame = new JFrame();
	frame.setTitle(panel.toString());

	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.LINE_AXIS));

	lightOffIcon = new ImageIcon("lightoff.gif");
	lightOnIcon = new ImageIcon("lighton.gif");

	lightLabel = new JLabel(lightOffIcon);
	lightLabel.setBorder(BorderFactory.createEtchedBorder());
	frame.getContentPane().add(lightLabel);

	JButton onButton = new JButton("ON");
	onButton.setMnemonic(KeyEvent.VK_N);	//alt key for on
	onButton.setActionCommand("on");
	onButton.addActionListener(this);
	frame.getContentPane().add(onButton);

	JButton offButton = new JButton("OFF");
	offButton.setMnemonic(KeyEvent.VK_F);	//alt key for off
	offButton.setActionCommand("off");
	offButton.addActionListener(this);
	frame.getContentPane().add(offButton);

	frame.pack();
	frame.setVisible(true);

	start();
    }

    /**
     * Event handler for the GUI, tells the LightPanel to pass a H or L accordingly
     * @param ActionEvent e, from the GUI
     */
    public void actionPerformed(ActionEvent e)
    {
	if (e.getActionCommand().equals("on"))
	    panel.switchOn();
	else
	    panel.switchOff();
    }

    /**
     * Changes the state of the lights locally
     * @param  none
     * @return none
     */
    public void run()
    {
	while (true) {
	    if (panel.isOn())
		lightLabel.setIcon(lightOnIcon);
	    else
		lightLabel.setIcon(lightOffIcon);
	    /*
	     * try to sleep the thread, if it doesn't throw exception
	     */
	    try { Thread.sleep(1); } catch (InterruptedException e) {}
	}
    }
}