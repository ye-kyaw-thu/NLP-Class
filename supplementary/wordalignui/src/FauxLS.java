import java.util.*;

public class FauxLS {
	// fake linkset useful only for displaying user alignment files
	Vector eConnect;
	Vector cConnect;
	Vector links;  
	Bitext bitext;

	public FauxLS(Bitext b) {
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

	public boolean is_same(FauxLS fls) {
		// fls is the same as this one if
		// all and only the links in fls are in this one
		for (Iterator i=fls.links.iterator(); i.hasNext();) {
			Link l = (Link)i.next();
			if (l.find_link(links) == false) {
				return false;
			}
		}
		return (links.size() == fls.links.size());
	}

	public void addWord(Word w) {
		// System.out.println ("adding word: "+w.getLabel());
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
	
	public Vector getLinks() {
		return links;
	}
	
	private void addLinks(Word w, Vector v) {
		for (Iterator i=v.iterator(); i.hasNext();) {
			Word w2 = (Word)i.next();
			// System.out.println ("adding link between "+w.getLabel()+" and "+w2.getLabel());
			links.addElement(new Link(w, w2));
		}
	}

	// converts this to a real linkset
	public LinkSet toLinkSet() {
		LinkSet linkset = new LinkSet(bitext);
		
		for (Iterator i=links.iterator(); i.hasNext();) {
			Link l = (Link)i.next();
			if (linkset.eConnect.indexOf(l.eng) == -1)
				linkset.addWord(l.eng);
			if (linkset.cConnect.indexOf(l.ch) == -1)
				linkset.addWord(l.ch);
		}
		return linkset;
	}
}


