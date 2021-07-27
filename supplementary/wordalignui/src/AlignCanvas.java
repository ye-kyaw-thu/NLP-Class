//v 1.3
import java.io.*;
import java.util.*;

import javax.swing.*;          
import java.awt.*;
import java.awt.event.*;


public class AlignCanvas extends JComponent implements Observer {
	Bitext  bitext;
	Pair    cur_pair;

	private final int tic = 5;

	public AlignCanvas() {
		super();
	}
	//	public Dimension getMinimumSize() {return new Dimension(150, 100);}
	//  public Dimension getPreferredSize() {return new Dimension(150, 100);}

	public void attachObservable (Bitext b) {
		if (b != bitext) {
			if (bitext != null) {bitext.deleteObserver(this);}
			bitext = b;
			bitext.addObserver(this);
			bitext.changed();
		}
	}

	private void draw_alignments(Graphics g, Vector links) {
		Dimension d = getSize();		
		int winc = d.width/Sentence.max_slen;
		int offset = winc/2;

		for (Iterator iLink = links.iterator(); iLink.hasNext();) {
			Link curlink = ((Link)iLink.next());
			int src = curlink.getEWordPos();
			int dst = curlink.getCWordPos();
			
			int xSrc = winc*src + offset;
			int xDst = winc*dst + offset;
			g.drawLine(xSrc, tic, xDst, d.height-tic);
		}
	}

	public void paint(Graphics g) {
		Sentence esent = cur_pair.getEngSent();
		Sentence csent = cur_pair.getChSent();

		g.setColor(Color.black);
		Dimension d = getSize();
		int winc = d.width/Sentence.max_slen;
		int offset = winc/2;

		// english side
		int xSrc = offset;
		for (int i=0; i<esent.getSize();i++) {
			g.drawLine(xSrc, 0, xSrc, tic);
			xSrc += winc;
		}
		// chinese side
		int xDst = offset;
		for (int i=0; i<csent.getSize();i++) {
			g.drawLine(xDst, d.height-tic, xDst, d.height);
			xDst += winc;
		}
		
		// draw saved alignments
		for (Iterator i=cur_pair.alignment.iterator(); i.hasNext();) {
			draw_alignments(g,  ((LinkSet)i.next()).getLinks());
		}
		
		g.setColor(Color.blue);
		// draw alignments from user1
		for (Iterator i=cur_pair.user1.iterator(); i.hasNext();) {
			draw_alignments(g,  ((FauxLS)i.next()).getLinks());
		}

		g.setColor(Color.green);
		// draw alignments from user2
		for (Iterator i=cur_pair.user2.iterator(); i.hasNext();) {
			draw_alignments(g,  ((FauxLS)i.next()).getLinks());
		}

		g.setColor(Color.yellow);
		// draw alignments from user3
		for (Iterator i=cur_pair.user3.iterator(); i.hasNext();) {
			draw_alignments(g,  ((FauxLS)i.next()).getLinks());
		}

		// draw potential alignments
		g.setColor(Color.red);
		draw_alignments(g, bitext.active_linkset.getLinks());
		g.setColor(Color.black);
	}
	
	public void update(Observable o, Object x) {
		cur_pair  = bitext.getPair();
		repaint();
	}
}







