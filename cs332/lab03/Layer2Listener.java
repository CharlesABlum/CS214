public interface Layer2Listener
{
    void frameReceived(Layer2Handler handler, Layer2Frame frame);
}