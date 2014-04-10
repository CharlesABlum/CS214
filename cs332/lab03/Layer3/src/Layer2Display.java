import java.awt.event.*;
import javax.swing.*;

/**
 * This class displays a GUI from which you can send and receive Layer 2
 * frames.
 */
public class Layer2Display implements ActionListener, Layer2Listener
{
    private Layer2Endpoint handler;
    private JTextField displayField;
    private JTextField addressField;
    private JTextField payloadField;
    private JTextField vlanField;

    public Layer2Display(Layer2Endpoint handler)
    {
	this.handler = handler;
	handler.setListener(this);

	JFrame frame = new JFrame("MAC: " + handler.toString());
	frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.PAGE_AXIS));

	displayField = new JTextField(20);
	displayField.setEditable(false);
	frame.getContentPane().add(displayField);

	frame.getContentPane().add(new JLabel("Dest (int):"));

	addressField = new JTextField(20);
	addressField.addActionListener(this);
	frame.getContentPane().add(addressField);

	frame.getContentPane().add(new JLabel("VLAN (int): "));
	
	vlanField = new JTextField(20);
	vlanField.addActionListener(this);
	vlanField.setText("0");
	frame.getContentPane().add(vlanField);
	
	frame.getContentPane().add(new JLabel("Payload (bit str):"));

	payloadField = new JTextField(20);
	payloadField.addActionListener(this);
	frame.getContentPane().add(payloadField);

	frame.pack();
	frame.setVisible(true);
    }

    /**
     * Called when the user hits enter in the GUI field, indicating that
     * a Layer2 Frame should be created and sent.
     */
    public void actionPerformed(ActionEvent e)
    {
	displayField.setText("Sending...");
	new Thread()
	{
	    public void run()
	    {
		int destAddress = Integer.parseInt(addressField.getText());
		String payload = payloadField.getText();
		int vlan = Integer.parseInt(vlanField.getText());

		handler.send(new Layer2Frame(destAddress, handler.getMacAddr(), vlan, payload));
		displayField.setText("");
	    }
	}.start();
    }

    /**
     * Called when a frame is received in the handler from the layer below it.
     * This function prints out info about the received frame in the displayField.
     */
    public void frameReceived(Layer2Handler handler, Layer2Frame frame)
    {
	displayField.setText("From " + frame.getSrcAddr() + ", VLAN " + frame.getVlanId() + ", Payld " + frame.getPayload());
    }
}