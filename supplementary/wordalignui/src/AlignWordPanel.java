import javax.swing.*;          
import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class AlignWordPanel extends JPanel implements Observer {
	private boolean  bEng;

	ChFontHandle chfonthandle;
	Bitext  bitext;
	WordButton wb[] = new WordButton [Sentence.max_slen];

	public AlignWordPanel(boolean b) {
		bEng     = b;
		
		setLayout(new GridLayout(1,0));
		for (int i=0; i<Sentence.max_slen; i++) {
			wb[i] = new WordButton();
			add(wb[i]);
		}
	}
	
	public void attachObservable (Bitext b, ChFontHandle cfh) {
		if (b != bitext) {
			if (bitext != null) {bitext.deleteObserver(this);}
			bitext = b;
			bitext.addObserver(this);
			bitext.changed();
		}
		if (cfh != chfonthandle) {
			if (chfonthandle != null) {chfonthandle.deleteObserver(this);}
			chfonthandle = cfh;
			chfonthandle.addObserver(this);
			chfonthandle.changed();
		}
	}
	
	public void update(Observable o, Object x) {
		if ((o == chfonthandle) && (!bEng)) {
			for (int i=0; i<Sentence.max_slen; i++)
				wb[i].setFont(new Font(chfonthandle.getCurFontName(), Font.PLAIN, 16));
		}
		else if (o == bitext) {
			Sentence cur_sent;
			if (bEng)
				cur_sent = bitext.getEngSent();
			else cur_sent = bitext.getChSent();

			int i;
			for (i=0; i<cur_sent.getSize(); i++) {
				wb[i].reset(cur_sent.getWordAt(i), bitext.active_linkset);
			}
			for (;i<cur_sent.max_slen;i++) {
				wb[i].reset(null, null);
			}
		}
	}
}
