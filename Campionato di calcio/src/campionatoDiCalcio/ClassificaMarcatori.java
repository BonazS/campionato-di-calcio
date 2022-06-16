package campionatoDiCalcio;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ClassificaMarcatori extends JPanel {
	
	Box first, second;
	
	public ClassificaMarcatori(ActionListener listener, JButton visualizzaClassificaMarcatori) {
		
		super();
		visualizzaClassificaMarcatori = new JButton("Visualizza classifica marcatori");
		visualizzaClassificaMarcatori.addActionListener(listener);
		first = new Box(BoxLayout.Y_AXIS);
		first.add(visualizzaClassificaMarcatori);
	}
}
