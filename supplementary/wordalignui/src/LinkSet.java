import java.util.*;

public class LinkSet {
	// word pointers pointing to participating words for this set of links
	Vector eConnect;
	Vector cConnect;
	Vector links;  // possible new links
	Bitext bitext;

	public LinkSet(Bitext b) {
		eConnect = new Vector();
		cConnect = new Vector();
		links    = new Vector();
		bitext   = b;
	}

	public boolean is_empty() {
		return ((eConnect.size() == 0) &&
				(cConnect.size() == 0) &&
				(links.size() == 0));
	}

	public boolean is_same(LinkSet ls) {
		// linkset ls is the same as this one if
		// all and only the links in ls are in this one
		for (Iterator i=ls.links.iterator(); i.hasNext();) {
			Link l = (Link)i.next();
			if (l.find_link(links) == false) {
				return false;
			}
		}
		return (links.size() == ls.links.size());
	}

	public void reset() {
		for (int i=eConnect.size(); i>0; i--) 
			removeWord((Word)eConnect.elementAt(i-1));
		for (int i=cConnect.size(); i>0; i--) 
			removeWord((Word)cConnect.elementAt(i-1));
	}
	
	public void addWord(Word w) {
		// System.out.println ("adding word: "+w.getLabel());
		w.setLinkSet(this);
		if (w.isEnglish()) {
			eConnect.addElement(w);
			addLinks(w, cConnect);
		}
		else {
			cConnect.addElement(w);
			addLinks(w, eConnect);
		}
		bitext.changed();
	}
	
	public void removeWord(Word w) {
		// System.out.println ("calling removeWord with "+w.getLabel());
		delLinks(w);
		if (w.linkset != null) {  // didn't get to delete this in delLink, so do it now
			w.setLinkSet(null);
			if (w.isEnglish()) 
				eConnect.removeElement(w);
			else cConnect.removeElement(w);

		}
		bitext.changed();
	}
	
	public Vector getLinks() {
		return links;
	}
	
	private void addLinks(Word w, Vector v) {
		for (Iterator i=v.iterator(); i.hasNext();) {
			Word w2 = (Word)i.next();
			// System.out.println ("adding link between "+w.getLabel()+" and "+w2.getLabel());
			links.addElement(new Link(w, w2));
			w.iLinks++;
			w2.iLinks++;
		}
	}
	
	// remove all links containing word w from newlinks
	private void delLinks(Word w) {
		int i = 0;
		while (i<links.size()) {
			Link cur = (Link)links.elementAt(i);
			if ((cur.eng == w) || (cur.ch == w)) {
				// System.out.println ("removing link between "+cur.eng.getLabel()+" and "+cur.ch.getLabel());
				cur.eng.iLinks--;
				cur.ch.iLinks--;
				if (cur.eng.iLinks == 0) {
					// System.out.println ("removing word "+cur.eng.getLabel()+" from active linkset");
					cur.eng.setLinkSet(null);
					eConnect.removeElement(cur.eng);
				}
				if (cur.ch.iLinks == 0) {
					// System.out.println ("removing word "+cur.ch.getLabel()+" from active linkset");
					cur.ch.setLinkSet(null);
					cConnect.removeElement(cur.ch);
				}
				links.removeElementAt(i);
			}
			else i++;
		}
	}
	
	// make l the active linkset instead of this one
	public void replace(LinkSet l) {
		bitext.setLinkSet(l);
	}
}


