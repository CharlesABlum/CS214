
/**
 * This class represents a Layer2 Frame according to our protocol definition.
 * It can be used to create a new Layer2Frame from values, or to parse a string
 * of bits into a Layer2Frame instance.
 */
public class Layer2Frame
{
    public static int BCAST_ADDRESS = 0xff;   // 1 byte of all-ones is the bcast address.

    /* This is the order of the fields in the frame. */
    private int destAddr;
    private int srcAddr;
    private int length;
    private int vlanId;
    private String payload;
    private int parity;

    /**
     * Create a new Layer2Frame, given values for many fields, and deriving
     * the values for the other fields.  This method is used when the code is
     * creating a new frame to be sent.  The other constructor is used for
     * parsing a received Layer2Frame as a string of bits.
     */
    public Layer2Frame(int destAddr, int srcAddr, int vlanId, String payload)
    {
	this.destAddr = destAddr;
	this.srcAddr = srcAddr;
	this.vlanId = vlanId;
	this.payload = payload;
	this.length = payload.length();
	this.parity = 0;
    }

    /**
     * Given a string of bits which should be a legal Layer2Frame, parse it into its
     * component pieces.  Throw an error if there are problems.
     */
    public Layer2Frame(String bits)
    {
	// Must start with a 0
	// System.out.println("charAt(0) = " + bits.charAt(0));
	if (bits.charAt(0) != '0') {
	    throw new IllegalArgumentException();
	}
	bits = bits.substring(1);	// lop off the initial 0.
	// System.out.println("bits now = " + bits);
	String parity = bits.substring(bits.length() - 8);
	// System.out.println("parity is = " + parity);
	// lop off the parity field
	bits = bits.substring(0, bits.length() - 8);
	// System.out.println("bits now = " + bits);
	if (! computeParity(bits, 256).equals(parity)) {
	    System.err.println("bad parity value");
	    throw new IllegalArgumentException();
	}
	destAddr = toDecimal(bits.substring(0, 8));
	srcAddr = toDecimal(bits.substring(8, 16));
	length = toDecimal(bits.substring(16, 32));
	vlanId = toDecimal(bits.substring(32, 40));
	payload = bits.substring(40);
	// System.err.println("Pkt from " + destAddr + " srcAddr " + srcAddr + " length " + length + " vlanId " + vlanId + " payload " + payload);
	// Check that the received payload has same length as that reported in
	// the packet.  This is really just a sanity check.
	if (payload.length() != length) {
	    System.err.println("Bad length");
	    throw new IllegalArgumentException();
	}
			     
    }

    /* All the getters */
    public int    getDestAddr() { return destAddr; }
    public int    getSrcAddr()  { return srcAddr; }
    public int    getLength()   { return length; }
    public int    getVlanId()   { return vlanId; }
    public String getPayload()  { return payload; }
    public int    getParity()   { return parity; }

    /**
     * Convert the integer value val to a string of 0s and 1s of the
     * given length.
     */
    public static String toBinary(int val, int length)
    {
	String ret = Integer.toBinaryString(val);
	if (ret.length() < length) {
	    // pre-pend 0 bits.
	    int num2Add = length - ret.length();
   	    for (int i = 0; i < num2Add; i++) {
		ret = "0" + ret;
	    }
	}
	// System.out.println("toBinary of " + val + " length " + length + " is " + ret);
	return ret;
    }

    /**
     * Compute the parity of the string of bits, by counting the number of 1
     * bits in the string and modding by the modValue.  Return the result as
     * a 0-padded 8-"bit" String.
     */
    public static String computeParity(String bits, int modValue)
    {
	int ones = 0;
	for (int i = 0; i < bits.length(); i++) {
	    if (bits.charAt(i) == '1') {
		ones++;
	    }
	}
	return toBinary(ones % modValue, 8);
    }

    public static int toDecimal(String bits)
    {
	return Integer.parseInt(bits, 2);
    }

    /**
     * Create the String of 0s and 1s representing the whole frame, with the
     * parity field on the end, and the 0 pre-amble field on the front.
     */
    public String toString()
    {
	String res = "0" + toBinary(destAddr, 8) + toBinary(srcAddr, 8) + toBinary(length, 16) +
	    toBinary(vlanId, 8) + payload;
	res += computeParity(res, 256);	// 256 is 2 ^ 8
	return res;
    }
}