import java.awt.event.*;
import javax.swing.*;

public class Layer2Display implements ActionListener, Layer2Listener
{
    private Layer2Handler handler;
    private JTextField displayField;
    private JTextField addressField;
    private JTextField payloadField;

    public Layer2Display(Layer2Handler handler)
    {
	this.handler = handler;
	handler.setListener(this);

	JFrame frame = new JFrame(handler.toString());
	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(),
						       BoxLayout.PAGE_AXIS));

	displayField = new JTextField(20);
	displayField.setEditable(false);
	frame.getContentPane().add(displayField);

	frame.getContentPane().add(new JLabel("Address:"));

	addressField = new JTextField(20);
	addressField.addActionListener(this);
	frame.getContentPane().add(addressField);

	frame.getContentPane().add(new JLabel("Payload:"));

	payloadField = new JTextField(20);
	payloadField.addActionListener(this);
	frame.getContentPane().add(payloadField);

	frame.pack();
	frame.setVisible(true);
    }

    public void actionPerformed(ActionEvent e)
    {
	displayField.setText("Sending...");
	new Thread()
	{
	    public void run()
	    {
		/* SEND LAYER2 FRAME HERE */
	    }
	}.start();
    }

}