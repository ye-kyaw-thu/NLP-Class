//v 1.3
import javax.swing.*;          
import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class ChFontHandle extends Observable {
	private int   num_fonts;
	private Vector chFontNames = new Vector();

	JRadioButton font_choices[];
	final ButtonGroup group = new ButtonGroup();
	String curFontName;
	
	public ChFontHandle() {
		// determine what chinese fonts are available

		Font[] allfonts = GraphicsEnvironment.getLocalGraphicsEnvironment().getAllFonts();
		String chinesesample = "\u4e00";
		for (int j = 0; j < allfonts.length; j++) {
			if ((allfonts[j].canDisplayUpTo(chinesesample) == chinesesample.length()) &&
				(allfonts[j].getFontName().startsWith("dialog") == false &&
				 allfonts[j].getFontName().startsWith("monospaced") == false &&
				 allfonts[j].getFontName().startsWith("sansserif") == false &&
				 allfonts[j].getFontName().startsWith("serif") == false)) {
				chFontNames.addElement(allfonts[j].getFontName());
			}
		}
		num_fonts = chFontNames.size();
	}
	public int getNumFonts() {
		return num_fonts;
	}

	public Component createComponent() {
		JPanel pane = new JPanel();
		pane.setLayout(new GridLayout(1,0));		
		font_choices = new JRadioButton [num_fonts];
		RadioListener chfontListener = new RadioListener();
		
		for (int j=0; j < num_fonts; j++) {
			font_choices[j] = new JRadioButton((String)(chFontNames.elementAt(j)));
			font_choices[j].setActionCommand((String)(chFontNames.elementAt(j)));
			font_choices[j].addActionListener(chfontListener);

			if (j == 0) {
				font_choices[j].setSelected(true);
				setCurFontName((String)(chFontNames.firstElement()));
			}

			group.add(font_choices[j]);
			pane.add(font_choices[j]);
		}
		return pane;
	}
	
	class RadioListener implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			setCurFontName(e.getActionCommand());
		}
	}

	public void setCurFontName(String s) {
		curFontName = s;
		changed();
	}

	public String getCurFontName() {
		return curFontName;
	}

	public void changed() {
		setChanged();
		notifyObservers();
	}

}
