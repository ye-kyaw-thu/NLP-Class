import java.lang.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;

import javax.swing.*;

public class AlignFrame extends JFrame{
	public AlignFrame(Bitext b, String enc) {
		super("Alignment UI");
		setSize(1000, 900);

		AlignMainContent main_pane = new AlignMainContent(b, enc);
		getContentPane().add(main_pane.createComponents());

		// Exit the application when the window is closed.
		setDefaultCloseOperation(AlignFrame.EXIT_ON_CLOSE);
		pack();
		setVisible(true);
	}

	public static void main(String argv[]) throws IOException, ClassNotFoundException {

		if (argv.length < 2 ) {
		    System.out.println("usage -- java -jar align_ui.jar <enfile> <frfile> [encoding] [sentence no.]");
		    System.exit(0);
		}

		Sentence es, cs;
		String encoding;

		// get the encoding if provided otherwise use UTF-8 as the default encoding
		if (argv.length == 3) {
			encoding = argv[2];
		}
		else {
			encoding = "UTF-8";
		}

		// data structure for holding parallel sentences
		Bitext b = new Bitext(encoding);

		// get the starting setence number
		if (argv.length == 4)
			b.setSentID(Integer.parseInt(argv[3]));


		// read all the sentences into the Bitext (parallel vectors) structure
		ReadInput ef = new ReadInput(argv[0], "UTF-8");
		ReadInput cf = new ReadInput(argv[1], encoding);

		while (((es = ef.readSent(true))!=null) &&
			   ((cs = cf.readSent(false))!=null)) {
			b.add_sent_pair(es, cs);
		}

		new AlignFrame(b, encoding);
	}
}


