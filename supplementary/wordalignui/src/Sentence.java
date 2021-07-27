import java.io.*;
import java.util.*;

public class Sentence {
	static final   int    max_slen = 80;  

	private String  sent;
	private boolean bEng;
	private int     num_words;
	private Vector  words = new Vector();
	
	public Sentence(boolean b) {
		num_words = 0;		
		bEng = b;
	}
	
	public void addWord(String w) {
		if (num_words < max_slen) {
			words.addElement(new Word(w, num_words++, bEng));
			if (num_words == 1) 
				sent = w;
			else sent = sent + " " + w;
		}
		else {
			System.out.println("Error in Sentence.java: too many words:"+sent);
			System.exit(0);
		}
	}

	public String getStr() {
		return sent;
	}
	
	public int getSize() {
		return num_words;
	}
	
	public Word getWordAt(int i) {
		return (Word)words.elementAt(i);
	}
	
	public String getWordLabelAt(int i) {
		return  getWordAt(i).getLabel();
	}
}
