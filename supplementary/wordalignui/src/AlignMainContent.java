import java.lang.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class AlignMainContent {
	Bitext  bitext;
	String  enc;

	private static String sent_label_str = "Sentence Number: ";
	private int sentID;
	
	public AlignMainContent(Bitext b, String e) {
		bitext  = b;
		sentID  = b.getSentID();
		enc     = e;
	}
	
	class AlignScroll extends JScrollPane {
		public AlignScroll(Component comp) {
			super(comp);
		}
		public Dimension getMinimumSize() {return new Dimension(200,200);}
		public Dimension getPreferredSize() {return new Dimension(200,200);}
	}

	public void placeComponent(JPanel p, Component comp, int x, int y, int w, int h, GridBagLayout l, GridBagConstraints c) {
		c.gridx = x;
		c.gridy = y;
		c.gridwidth = w;
		c.gridheight = h;
		l.setConstraints(comp,c);
		p.add(comp);
	}
	
	public Component createComponents() {
		JPanel main_pane = new JPanel();  // main pane 
		// main_pane.setLayout(new GridLayout(0,1,10,10));

		GridBagLayout gbl = new GridBagLayout();
		main_pane.setLayout(gbl);
		GridBagConstraints gbc = new GridBagConstraints();
		
		gbc.fill = GridBagConstraints.BOTH;
		gbc.weightx = 1.0;
		gbc.weighty = 1.0;
		
		/********************************************
          pane for radiobuttons to choose chinese font 
         ********************************************/
		ChFontHandle chfont = new ChFontHandle();
		if ((enc.compareTo("GB2312")==0) && (chfont.getNumFonts()>0)) {
			main_pane.add(chfont.createComponent());
			placeComponent(main_pane, chfont.createComponent(), 0, 0, 4, 1, gbl, gbc);
		}

		final JLabel sent_label = new JLabel(sent_label_str + sentID);
		// main_pane.add(sent_label);
		placeComponent(main_pane, sent_label, 0, 1, 4, 1, gbl, gbc);

		/********************************************
          pane for paired sentence display
		 ********************************************/
		AlignSentence etext  = new AlignSentence(true);
		etext.attachObservable(bitext, chfont);

		AlignSentence ctext  = new AlignSentence(false);
		ctext.attachObservable(bitext, chfont);

		// main_pane.add(etext);
		// main_pane.add(ctext);
		
		// placeComponent(main_pane, etext, 0,2,2,2, gbl, gbc);
		// placeComponent(main_pane, ctext, 2,2,2,2, gbl, gbc);

		JPanel sent_pane = new JPanel();  // display the sentences
		sent_pane.setLayout(new GridLayout(1,0,10,10));
		sent_pane.add(new AlignScroll(etext));
		sent_pane.add(new AlignScroll(ctext));
		placeComponent(main_pane, sent_pane, 0, 2, 4, 2, gbl, gbc);

		/***********************************************
          panes for the word buttons and alingment canvas
		 ***********************************************/
		AlignWordPanel en_word_panel = new AlignWordPanel(true);
		en_word_panel.attachObservable(bitext, chfont);

		AlignCanvas canvas = new AlignCanvas();
		canvas.attachObservable(bitext);

		AlignWordPanel ch_word_panel = new AlignWordPanel(false);
		ch_word_panel.attachObservable(bitext, chfont);

		JPanel align_pane = new JPanel();
		// align_pane.add("North", en_word_panel);
		// align_pane.add("Center", canvas);
		// align_pane.add("South", ch_word_panel);

		align_pane.setLayout (new GridLayout(0,1,10,10));
		align_pane.add(en_word_panel);
		align_pane.add(canvas);
		align_pane.add(ch_word_panel);
		
		AlignScroll scroll_pane = new AlignScroll(align_pane);
		// JScrollPane scroll_pane = new JScrollPane(align_pane, 
		// JScrollPane.VERTICAL_SCROLLBAR_NEVER, 
		// JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		
		// main_pane.add(scroll_pane);
	    placeComponent(main_pane, scroll_pane, 0,4,4,5, gbl, gbc);
		
		/**********************************************
          pane for the set of control buttons													   
		***********************************************/
		CtrlButton undo = new CtrlButton("Undo");
		undo.setMnemonic(KeyEvent.VK_U);
		undo.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					bitext.resetLinkSet();
				}
			});
		
		CtrlButton save = new CtrlButton("Record Links") ;
		save.setMnemonic(KeyEvent.VK_R);
		save.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					// write the links to memory and to file
					Pair p = bitext.getPair();
					p.addLinkSet(bitext.active_linkset, p.alignment);
					p.writeToFile();
					bitext.newLinkSet();  
				}
			});

		// set up button to go to the next sentence
        CtrlButton next_button = new CtrlButton("Next");
        next_button.setMnemonic(KeyEvent.VK_N);
        next_button.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Pair p = bitext.getPair();
					p.addLinkSet(bitext.active_linkset, p.alignment);
					p.writeToFile();
					if (sentID < bitext.size()) {
						bitext.newLinkSet(); // flush active linkset
						bitext.setSentID(++sentID);
						sent_label.setText(sent_label_str + sentID);
					}
					else System.out.println("on the last sentence already");
				}
			});
		
        CtrlButton prev_button = new CtrlButton("Prev");
        prev_button.setMnemonic(KeyEvent.VK_P);
        prev_button.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Pair p = bitext.getPair();
					p.addLinkSet(bitext.active_linkset, p.alignment);
					p.writeToFile();
					if (sentID>1) {
						bitext.newLinkSet(); // flush active linkset
						bitext.setSentID(--sentID);
						sent_label.setText(sent_label_str + sentID);
					}
					else System.out.println("on the first sentence already");
				}
			});
		
        JPanel button_pane = new JPanel();
        // button_pane.setBorder(BorderFactory.createEmptyBorder(30,30,10,30));
		button_pane.setLayout(new GridLayout(1,0, 10, 10));

		button_pane.add(undo);
		button_pane.add(save);
		button_pane.add(prev_button);
        button_pane.add(next_button);
		// main_pane.add(button_pane);
		placeComponent(main_pane,button_pane,0,9,4,1,gbl,gbc);
		
		return main_pane;
	}
}
