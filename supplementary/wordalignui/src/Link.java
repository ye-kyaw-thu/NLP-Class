import java.util.*;

public class Link {
	Word eng;
	Word ch;

	public Link(Word w1, Word w2) {
		if (w1.isEnglish()) {
			eng = w1;
			ch  = w2;
		}
		else {
			ch  = w1;
			eng = w2;
		}
	}
	public boolean find_link(Vector v) {
		for (Iterator i=v.iterator(); i.hasNext();) {
			Link l = (Link)i.next();
			if ((eng == l.eng) && (ch == l.ch))
				return true;
		}
		return false;
	}

	public int getEWordPos() {
		return eng.getPosition();
	}

	public int getCWordPos() {
		return ch.getPosition();
	}
}
