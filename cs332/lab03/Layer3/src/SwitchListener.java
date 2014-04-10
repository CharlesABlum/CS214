
public interface SwitchListener {
    void portAttached(Switch sw, SwitchPort pt, SwitchLightPanel panel);
    void macTableChanged(Switch sw);
}