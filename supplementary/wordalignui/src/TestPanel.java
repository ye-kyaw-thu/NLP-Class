import java.awt.*;
import javax.swing.*;

public class TestPanel extends JPanel {
	public TestPanel() {
		GridBagLayout gbl = new GridBagLayout();
		setLayout(gbl);
		GridBagConstraints gbc = new GridBagConstraints();
		
		gbc.fill = GridBagConstraints.BOTH;
		gbc.weightx = 1.0;
		gbc.weighty = 1.0;
		placeComponent(0,0,1,2,"A",gbl, gbc);
		placeComponent(1,0,1,1,"B",gbl, gbc);
		placeComponent(0,2,1,3,"C",gbl, gbc);
		placeComponent(1,1,1,4,"D",gbl, gbc);
		placeComponent(2,0,1,1,"E",gbl, gbc);
		placeComponent(2,1,1,1,"F",gbl, gbc);
		placeComponent(2,2,1,1,"G",gbl, gbc);
		placeComponent(2,3,1,1,"H",gbl, gbc);
		placeComponent(2,4,1,1,"I",gbl, gbc);
	}

	public void placeComponent(int x, int y, int w, int h, String s, GridBagLayout l, GridBagConstraints c) {
		c.gridx = x;
		c.gridy = y;
		c.gridwidth = w;
		c.gridheight = h;
		JButton p = new JButton(s);
		l.setConstraints(p,c);
		add(p);
	}
	public static void main(String argv[]) {
		JFrame frame = new JFrame();
		frame.setSize(700, 700);
		TestPanel tp = 	new TestPanel();
		frame.getContentPane().add(tp);

		// Exit the application when the window is closed.		
		frame.setDefaultCloseOperation(AlignFrame.EXIT_ON_CLOSE);
		frame.pack();
		frame.setVisible(true);
	}
}
