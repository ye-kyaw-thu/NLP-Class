import java.io.*;
import java.util.*;

public class Pair {
	private int pair_id;  // sentence id (offset at 1)
	private Sentence esent;
	private Sentence csent;
	Vector  alignment = new Vector();
	Vector  user1 = new Vector();
	Vector  user2 = new Vector();
	Vector  user3 = new Vector();
	ReadInput afile;
	String  enc;

	public Pair(Sentence e, Sentence c, int i, Bitext b) {
		enc   = b.enc;
		esent = e;
		csent = c;
		pair_id = i;
		try {  
			// System.out.println ("reading in user1");
			// get alignments from user1
			afile = new ReadInput("annotator1/aligned."+pair_id, enc);
			afile.readFLS(this, b, user1);

			// get alignments from user2
			afile = new ReadInput("annotator2/aligned."+pair_id, enc);
			afile.readFLS(this, b, user2);

			afile = new ReadInput("gold/aligned."+pair_id, enc);
			afile.readFLS(this, b, user3);

			// move common links between user1 and user2 to alignment
			for (int id1=0; id1<user1.size();) {
				FauxLS fls = (FauxLS)user1.elementAt(id1);
				int id2 = find_fls(fls, user2);
				if (id2 != -1) {
					user1.removeElementAt(id1);
					user2.removeElementAt(id2);
					addLinkSet(fls.toLinkSet(), alignment);
				}
				else id1++;
			}
		}
		catch (IOException ex) {
			//			System.out.println ("failed to read in user files");
			afile = null;
		}
		try{
			afile = new ReadInput("aligned."+pair_id, enc);
			afile.readLinkSets(this, b, alignment);
		}
		catch (IOException ex) {
			afile = null;
		}
		//		System.out.println ("there are "+user1.size()+" elements in user1");
		//		System.out.println ("there are "+user2.size()+" elements in user2");
		//		System.out.println ("there are "+alignment.size()+" elements in alignment");
	}
	
	public Sentence getEngSent() {
		return esent;
	}

	public Sentence getChSent() {
		return csent;
	}

	public int getID() {
		return pair_id;
	}

	private int find_word_in_fls(Word w, Vector v) {
		for (int i=0; i<v.size(); i++) {
			FauxLS fls = (FauxLS)v.elementAt(i);
			if ((fls.eConnect.indexOf(w) != -1) ||
				(fls.cConnect.indexOf(w) != -1))
				return i;
		}
		return -1;
	}

	private int find_fls(FauxLS fls1, Vector v) {
		for (int i=0; i<v.size(); i++) {
			FauxLS fls2 = (FauxLS)v.elementAt(i);
			if (fls1.is_same(fls2))
				return i;
		}
		return -1;
	}

	public void addLinkSet (LinkSet ls, Vector v) {
		// if ls isn't already in v (i.e., alignment),
		// add it to the list
		if ((!ls.is_empty()) && (v.indexOf(ls) == -1))
			v.addElement(ls);

		// need to maintain the user lists:
		// if the words in ls appears in either user1 or user2, remove that element
		for (Iterator i=ls.getLinks().iterator(); i.hasNext();) {
			Link  l = (Link)i.next();
			int id1 = find_word_in_fls(l.eng, user1);
			if (id1 != -1)
				user1.removeElementAt(id1);
			int id2 = find_word_in_fls(l.eng, user2);
			if (id2 != -1)
				user2.removeElementAt(id2);
		}
	}

	public void addFauxLS (FauxLS l, Vector v) {
		// if l isn't already in v: {alignment, user1, user2}
		// add it to the list
		if ((!l.is_empty()) && (v.indexOf(l) == -1))
			v.addElement(l);
	}
	
	public void writeToFile() {
		try{
			FileOutputStream stream   = new FileOutputStream("aligned."+pair_id);
			OutputStreamWriter writer;
			try{
				writer = new OutputStreamWriter(stream, enc);
			}
			catch (UnsupportedEncodingException e) { 
				System.out.println ("encoding not supported");
				writer = new OutputStreamWriter(stream);
			}
			PrintWriter printer       = new PrintWriter(writer);

			int e=0; 
			while (e<alignment.size()) {
				LinkSet linkset = (LinkSet)alignment.elementAt(e);
				if (linkset.is_empty()) {
					alignment.removeElementAt(e);
				}
				else {
					for (Iterator i= linkset.getLinks().iterator(); i.hasNext();) {
						Link l = (Link)i.next();
						printer.print (l.eng.getPosition()+"  "+l.ch.getPosition()+"  (") ;
						printer.print (l.eng.getLabel()+", "+l.ch.getLabel()+")    ");
					}
					printer.println();
					e++;
				}
			}
			printer.close();
		}
		catch(IOException e) {
			System.exit(0);
		}
	}
}
