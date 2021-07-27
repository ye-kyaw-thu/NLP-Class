//v 1.3
import javax.swing.*;          
import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class CtrlButton extends JButton {
	public CtrlButton(String s) {
		super(s);
	}

	public Dimension getMinimumSize() {
		return new Dimension(200, 50);
	}
	public Dimension getPreferredSize() {
		return new Dimension(200, 50);
	}
}
