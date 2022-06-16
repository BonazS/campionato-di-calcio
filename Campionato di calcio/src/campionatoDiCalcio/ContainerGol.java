package campionatoDiCalcio;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

public class ContainerGol extends JPanel {
	
	private LinkedList<GolPanel> golPanels = new LinkedList<GolPanel>();
	private List<StructCalciatore> calciatori = new LinkedList<StructCalciatore>();
	
	public ContainerGol() {
		this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
	}
	
	public void setNumeroGol(int n) {
		golPanels.clear();
		this.removeAll();
		for (int i = 0; i < n; i++) {
			GolPanel component = new GolPanel();
			this.add(component);
			golPanels.add(component);
		}
		this.revalidate();
		this.repaint();
		this.updatePanels();
	}
	
	public Collection<StructGol> getGols(){
		LinkedList<StructGol> result = new LinkedList<StructGol>();
		for (GolPanel panel: golPanels) {
			result.add(panel.getStructGol());
		}
		return result;
	}

	public void setCalciatori(List<StructCalciatore> calciatori) {
		this.calciatori = calciatori;
		this.updatePanels();
	}
	
	private void updatePanels() {
		for (GolPanel panel: golPanels) {
			panel.setCalciatori(calciatori);
		}
	}
	
	public void clearCalciatori() {
		this.calciatori.clear();
		this.updatePanels();
	}

	public boolean isFilled() {
		boolean result = true;
		for (GolPanel panel: golPanels) {
			result = ((result) && (panel.isFilled()));
		}
		//return this.golPanels.stream().allMatch(panel -> panel.isFilled());
		return result;
	}
}
