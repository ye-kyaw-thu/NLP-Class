import java.io.*;
import java.util.*;

public class ReadInput{
	private String fname;
	private String enc;
	private FileInputStream   stream ; 
	private InputStreamReader reader ;
	private BufferedReader    bReader;

	public ReadInput(String f, String e) throws IOException, UnsupportedEncodingException {
		fname = f;
		enc   = e;
		openFile();
	}
	
	public void openFile() throws IOException, UnsupportedEncodingException {
		stream  = new FileInputStream(fname);
		reader  = new InputStreamReader(stream, enc);
		bReader = new BufferedReader(reader);
	}
	
	public void closeFile() throws IOException {
		stream.close();
	}

	// returns a vector of String tokens in one line of the file
	// delimited by space; returns null if eof
	public Vector split() throws IOException{
		int ch;
		StringBuffer buff = null;
		Vector toks = new Vector();

		while ((ch=bReader.read()) != -1) {
			if ((char)ch == '\n') {
				if (buff != null) 
					toks.addElement(buff.toString());
				return toks;
			}
			else if (((char)ch != ' ') && ((char)ch != '\t')) {
				if (buff == null)
					buff = new StringBuffer();
				buff.append((char)ch);
			}
			else if (buff != null) {
				toks.addElement(buff.toString());
				buff = null;
			}
		}
		// end of file
		if (toks.size()>0)
			return toks;
		else return null;
	}

	
	public Sentence readSent(boolean bEng) throws IOException {
		Sentence s = new Sentence(bEng);
		int ch;
		StringBuffer word = null;
		
		while ((ch=bReader.read()) != -1) {
			if ((char)ch == '\n') {
				if (word != null) 
					s.addWord(word.toString());
				return s;
			}
			else if (((char)ch != ' ') && ((char)ch != '\t')) {
				if (word == null)
					word = new StringBuffer();
				word.append((char)ch);
			}
			else if (word != null) {  // ch == delimiter and we have been building a word
				s.addWord(word.toString());
				word = null;  // done with the word
			}
		}
		// end of file
		closeFile();
		return null;
	}

	public void readLinkSets(Pair p, Bitext b, Vector lsv) throws IOException{
		Vector   v;
		
		while ((v = split())!=null) {
			Vector   w = new Vector();
			LinkSet ls = new LinkSet(b);

			int i=0;
			while (i+3<v.size()) {
				// String se = (String)v.elementAt(i);
				// String sc = (String)v.elementAt(i+1);
				int ie = Integer.parseInt(((String)v.elementAt(i)));
				int ic = Integer.parseInt(((String)v.elementAt(i+1)));
				Word we = p.getEngSent().getWordAt(ie);
				Word wc = p.getChSent().getWordAt(ic);
				if (ls.eConnect.indexOf(we) == -1) 
					ls.addWord(we);
				if (ls.cConnect.indexOf(wc) == -1) 
					ls.addWord(wc);
				i+=4;
			}
			p.addLinkSet(ls, lsv);
		}		
		//		System.out.println ("-----------------------");
	}

	// reads from file and put into a vector called flsv, whose
	// elements should be of FauxLS type
	public void readFLS(Pair p, Bitext b, Vector flsv) throws IOException{
		Vector   v;
		
		while ((v = split())!=null) {
			Vector    w = new Vector();
			FauxLS  fls = new FauxLS(b);
			
			int i=0;
			while (i+3<v.size()) {
				// String se = (String)v.elementAt(i);
				// String sc = (String)v.elementAt(i+1);
				int ie = Integer.parseInt(((String)v.elementAt(i)));
				int ic = Integer.parseInt(((String)v.elementAt(i+1)));
				Word we = p.getEngSent().getWordAt(ie);
				Word wc = p.getChSent().getWordAt(ic);
				if (fls.eConnect.indexOf(we) == -1) 
					fls.addWord(we);
				if (fls.cConnect.indexOf(wc) == -1) 
					fls.addWord(wc);
				i+=4;
			}
			p.addFauxLS(fls, flsv);
		}		
		//		System.out.println ("-----------------------");
	}

}
