import java.io.*;
import java.util.*;

public class Word {
	private  String   label;     // actual word label
	private  int      position;  // position in the Sentence vector
	private  boolean  bEng;      // is this an english word?

	LinkSet  linkset;  // the link-set that this word participates in
	int      iLinks;   // number of words this word is linked to
	
	public Word(String s, int i, boolean b) {
		label    = s;
		position = i;
		bEng     = b;
		iLinks   = 0;
		linkset  = null;  // initially, not involved in any linkset
	}
	
	public String getLabel() {
		return label;
	}
	
	public int getPosition() {
		return position;
	}
	
	public boolean isEnglish() {
		return bEng;
	}

	public void setLinkSet(LinkSet l) {
		linkset = l;
	}
}
