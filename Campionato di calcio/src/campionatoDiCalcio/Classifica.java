package campionatoDiCalcio;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Classifica extends JPanel {
	
	Box first, second;
	static final String JDBC_DRIVER = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
	static final String DB_URL = " jdbc:sqlserver://localhost/Campionato di calcio";
	
	public Classifica(ActionListener listener, JButton visualizzaClassifica) {
		
		super();
		visualizzaClassifica = new JButton("Visualizza classifica");
		visualizzaClassifica.addActionListener(listener);
		first = new Box(BoxLayout.Y_AXIS);
		first.add(visualizzaClassifica);
	}
}
