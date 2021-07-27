import java.util.*;

public class Bitext extends Observable {
	private int num_sents;
	private int cur_sentID;
	private Vector pairs = new Vector();
	String  enc;

	LinkSet active_linkset;

	public Bitext(String e) {
		enc       = e;
		num_sents = 0;
		cur_sentID = 1;  
		active_linkset = new LinkSet(this);  // init 
	}

	public void add_sent_pair(Sentence e, Sentence c) {
		pairs.addElement(new Pair(e, c, ++num_sents, this));
	}
	
	public int size() {
		return num_sents;
	}

	public Pair getPair() {
		return ((Pair)pairs.elementAt(cur_sentID-1));
	}

	public Sentence getEngSent () {
		return getPair().getEngSent();
	}
	
	public Sentence getChSent () {
		return getPair().getChSent();
	}
	
	public String getEngStr () {
		return (getEngSent().getStr());
	}

	public String getChStr () {
		return (getChSent().getStr());
	}

	public int getSentID() {
		return cur_sentID;
	}
	
	public void setSentID(int i) {
		cur_sentID = i;
		changed();
	}

	public void newLinkSet() {
		active_linkset = new LinkSet(this);
		changed();
	}

	public void resetLinkSet() {
		active_linkset.reset();
		changed();
	}

	public void setLinkSet(LinkSet l) {
		active_linkset = l;
		changed();
	}

	public void changed() {
		setChanged();
		notifyObservers();
	}
}
