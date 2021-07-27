//v 1.3
import javax.swing.*;          
import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class WordButton extends JButton {
	Word    word;     // the word this button is linked to
	LinkSet linkset;  // currently active linkset

	public WordButton() {
		super();
		init();
	}

	public Dimension getMinimumSize() {
		return new Dimension(80, 40);
	}
	public Dimension getPreferredSize() {
		return new Dimension(80, 40);
	}

	public void reset(Word w, LinkSet l) {
		word = w;
		linkset = l;
		
		if (w == null) {
			setText("");
		}			
		else {
			setText(w.getLabel());
			if (w.linkset == linkset)
				setBorderPainted(true);
			else setBorderPainted(false);
		}
	}
	
    private void init() {
		setBorder(BorderFactory.createEmptyBorder());
		setBorder(BorderFactory.createEtchedBorder());
		setBorderPainted(false);
		setFocusPainted(false);
		setHorizontalTextPosition(CENTER);
		setAlignmentX((float) 0.5);
		setAlignmentY((float) 0.5);
		
		addActionListener(new ActionListener() {
				public void actionPerformed (ActionEvent e) {
					if (word != null) {
						if (isBorderPainted()) {
							// de-select
							linkset.removeWord(word);
							setBorderPainted(false);
						}
						else if (word.linkset == null) {
							// newly selected
							linkset.addWord(word);
							setBorderPainted(true);
						}
						else if (linkset.is_empty()){
							// previously selected, current linkset is empty
							linkset.replace(word.linkset);
						}
						else {
							// have to merge linkset with the linkset of this word
						}
					}
				}
			});
	}
}
