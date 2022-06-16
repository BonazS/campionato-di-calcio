package campionatoDiCalcio;


import java.util.List;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class GolPanel extends JPanel {
	
	private JComboBox<StructCalciatore> marcatore;
	private JTextField minuto;
	private JCheckBox autogol;
	private JCheckBox rigore;
	
	public GolPanel() {
		
		super();
		
		Box marcatoreBox = new Box(BoxLayout.Y_AXIS);
		marcatoreBox.add(new JLabel("Nome"));
		marcatore = new JComboBox<StructCalciatore>();
		marcatore.setEditable(false);
		marcatoreBox.add(marcatore);
		this.add(marcatoreBox);
		
		Box minutoBox = new Box(BoxLayout.Y_AXIS);
		minutoBox.add(new JLabel("Minuto"));
		minuto = new JTextField();
		minutoBox.add(minuto);
		this.add(minutoBox);
		
		Box autogolBox = new Box(BoxLayout.Y_AXIS);
		autogolBox.add(new JLabel("Autogol"));
		autogol = new JCheckBox();
		autogolBox.add(autogol);
		this.add(autogolBox);
		
		Box rigoreBox = new Box(BoxLayout.Y_AXIS);
		rigoreBox.add(new JLabel("Rigore"));
		rigore = new JCheckBox();
		rigoreBox.add(rigore);
		this.add(rigoreBox);
	}
	
	public StructGol getStructGol() {
		StructGol result = new StructGol();
		result.setNumeroTessera(((StructCalciatore) marcatore.getSelectedItem()).getTesseraFIGC());
		result.setMinuto(Integer.parseInt(minuto.getText()));
		result.setAutogol(autogol.isSelected());
		result.setRigore(rigore.isSelected());
		return result;
	}

	public void setCalciatori(List<StructCalciatore> calciatori) {
		marcatore.removeAllItems();
		for (StructCalciatore calciatore: calciatori) {
			marcatore.addItem(calciatore);
		}
		marcatore.setSelectedIndex(-1);
	}

	public boolean isFilled() {
		return ((marcatore.getSelectedIndex() >= 0) && (minuto.getText().trim().length() > 0));
	}
}
