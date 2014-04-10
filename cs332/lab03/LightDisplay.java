import java.awt.event.*;
import javax.swing.*;

public class LightDisplay extends Thread implements ActionListener
{
    private LightPanel panel;
    private ImageIcon lightOffIcon;
    private ImageIcon lightOnIcon;
    private JLabel lightLabel;

    public LightDisplay(LightPanel panel)
    {
	this.panel = panel;

	JFrame frame = new JFrame();
	frame.setTitle(panel.toString());

	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(),
						       BoxLayout.LINE_AXIS));

	lightOffIcon = new ImageIcon("lightoff.gif");
	lightOnIcon = new ImageIcon("lighton.gif");

	lightLabel = new JLabel(lightOffIcon);
	lightLabel.setBorder(BorderFactory.createEtchedBorder());
	frame.getContentPane().add(lightLabel);

	JButton onButton = new JButton("ON");
	onButton.setMnemonic(KeyEvent.VK_N);
	onButton.setActionCommand("on");
	onButton.addActionListener(this);
	frame.getContentPane().add(onButton);

	JButton offButton = new JButton("OFF");
	offButton.setMnemonic(KeyEvent.VK_F);
	offButton.setActionCommand("off");
	offButton.addActionListener(this);
	frame.getContentPane().add(offButton);

	frame.pack();
	frame.setVisible(true);

	start();
    }

    public void actionPerformed(ActionEvent e)
    {
	if (e.getActionCommand().equals("on"))
	    panel.switchOn();
	else
	    panel.switchOff();
    }

    /**
     * Every 1 millisecond, check the LightPanel to see if the voltage is
     * on or off.  If on, display the "on" light bulb icon.  Similar for
     * if off.
     */
    public void run()
    {
	while (true) {
	    if (panel.isOn())
		lightLabel.setIcon(lightOnIcon);
	    else
		lightLabel.setIcon(lightOffIcon);
	    try {
		Thread.sleep(1);
	    } catch (InterruptedException e) {
	    }
	}
    }
}