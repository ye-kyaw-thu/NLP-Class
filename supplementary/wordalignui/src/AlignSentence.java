//v 1.3
import javax.swing.*;          
import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class AlignSentence extends JTextArea implements Observer {
	Bitext bitext;
	ChFontHandle chfonthandle;
	private boolean bEng;

	public AlignSentence(boolean bEnc) {
		super("");
		bEng = bEnc;  // is the string in English?
		setEditable(false);
		setLineWrap(true);
		setWrapStyleWord(true);
	}

	public Dimension getMinimumSize() {return new Dimension(100,100);}
	public Dimension getPreferredSize() {return new Dimension(100,100);}

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
		if (bEng){
			if (bitext!=null) setText(bitext.getEngStr());
		}
		else {
			if (chfonthandle != null)  setFont(new Font(chfonthandle.getCurFontName(), Font.PLAIN, 16));
			if (bitext != null)        setText(bitext.getChStr());
		}
	}
}
