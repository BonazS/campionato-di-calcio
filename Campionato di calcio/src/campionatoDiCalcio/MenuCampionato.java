package campionatoDiCalcio;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.table.*;
import javax.swing.text.NumberFormatter;

import java.sql.*;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;


public class MenuCampionato extends JFrame {
	private JTabbedPane menu;
	private JPanel inserimentoPartita, classifica, classificaMarcatori;
	private JPanel northPanel, centerPanel, dataPanel, risultatoPanel, salvaPanel; 
	private JButton visualizzaC, visualizzaM;
	private JTable tabellaClassifica, tabellaMarcatori;
	private JTextField dataText;
	private JFormattedTextField punteggioCasaText, punteggioTrasfertaText; 
	private JComboBox<String> campBox, gioBox, casa, trasferta;
	private JButton salva, annulla;
	private ContainerGol golCasaPanel, golTrasfertaPanel;
	private JTextField possessoCasaText, tiriInPortaCasaText, tiriFuoriCasaText, falliCasaText, ammonizioniCasaText, espulsioniCasaText;
	private JTextField possessoTrasfertaText, tiriInPortaTrasfertaText, tiriFuoriTrasfertaText, falliTrasfertaText, ammonizioniTrasfertaText, espulsioniTrasfertaText;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/campionatodicalcio?serverTimezone=Europe/Rome";
	static final String USER = "root";
	static final String PASS = "password";
	Connection db = null;
	
	public MenuCampionato() {
		
		super("Campionato di calcio");
		setSize(1000,800);
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		Container c = getContentPane();
		menu = new JTabbedPane();
		visualizzaC = new JButton("Visualizza classifica");
		MenuCampionato.EventoVisualizzaClassifica tmp = new MenuCampionato.EventoVisualizzaClassifica();
		visualizzaC.addActionListener(tmp);
		visualizzaM = new JButton("Visualizza classifica marcatori");
		visualizzaM.addActionListener(tmp);
		
		tabellaClassifica = new JTable(new DefaultTableModel(new Object[] {"Squadra", "Punti", "PG", "V", "P", "S", "GF", "GS"}, 0));
		tabellaMarcatori = new JTable(new DefaultTableModel(new String[] {"Cognome", "Gol", "Squadra"},0));
		
		//form di inserimento partita
		riempiInserimentoPartita();
		
		//classifica
		classifica = new JPanel();
		classifica.setLayout(new BorderLayout());
		classifica.add(visualizzaC, BorderLayout.NORTH);
		classifica.add(new JScrollPane(tabellaClassifica), BorderLayout.CENTER);
		
		//classifica marcatori
		classificaMarcatori = new JPanel();
		classificaMarcatori.setLayout(new BorderLayout());
		classificaMarcatori.add(visualizzaM, BorderLayout.NORTH);
		classificaMarcatori.add(new JScrollPane(tabellaMarcatori), BorderLayout.CENTER);
		
		
		menu.addTab("Inserisci partita", inserimentoPartita);
		menu.addTab("Classifica", classifica);
		menu.addTab("Classifica marcatori", classificaMarcatori);
		c.add(menu);
		
		try {
			Class.forName(JDBC_DRIVER).newInstance();
			System.out.println("Connecting to a selected database...");
			db = DriverManager.getConnection(DB_URL, USER, PASS);
		    System.out.println("Connected database successfully...");
		} catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }
		this.addWindowListener(new MenuCampionato.CaricaCampionati());
		this.addWindowListener(new MenuCampionato.CaricaSquadra(casa));
		this.addWindowListener(new MenuCampionato.CaricaSquadra(trasferta));
		campBox.addItemListener(new MenuCampionato.CaricaGiornate());
		casa.addItemListener(new MenuCampionato.ControllaStessaSquadra());
		trasferta.addItemListener(new MenuCampionato.ControllaStessaSquadra());
		casa.addItemListener(new MenuCampionato.CaricaGiocatori());
		trasferta.addItemListener(new MenuCampionato.CaricaGiocatori());
		dataText.addFocusListener(new MenuCampionato.ControllaData());
	}
	
	private void riempiInserimentoPartita() {
		
		golCasaPanel = new ContainerGol();
		golTrasfertaPanel = new ContainerGol();
		
		inserimentoPartita = new JPanel();
		inserimentoPartita.setLayout(new BorderLayout());
		northPanel = new JPanel();
		centerPanel = new JPanel();
		inserimentoPartita.add(northPanel, BorderLayout.NORTH);
		inserimentoPartita.add(centerPanel, BorderLayout.CENTER);
		
		dataPanel = new JPanel();
		risultatoPanel = new JPanel();
		salvaPanel = new JPanel();
		northPanel.setLayout(new BorderLayout());
		northPanel.add(dataPanel, BorderLayout.WEST);
		northPanel.add(risultatoPanel, BorderLayout.CENTER);
		northPanel.add(salvaPanel, BorderLayout.EAST);
		
		Box dataBox = new Box(BoxLayout.Y_AXIS);
		JLabel dataLabel = new JLabel("Data");
		dataText = new JTextField(2+1+2+1+4);
		JLabel campLabel = new JLabel("Campionato");
		campBox = new JComboBox<String>();
		campBox.setEditable(false);
		JLabel gioLabel = new JLabel("Giornata");
		gioBox = new JComboBox<String>();
		gioBox.setEditable(false);
		dataBox.add(dataLabel);
		dataBox.add(dataText);
		dataBox.add(campLabel);
		dataBox.add(campBox);
		dataBox.add(gioLabel);
		dataBox.add(gioBox);
		dataPanel.add(dataBox);
		
		Box risultatoBox = new Box(BoxLayout.X_AXIS);
		risultatoBox.add(Box.createVerticalStrut(20));
		Box casaBox = new Box(BoxLayout.Y_AXIS);
		JLabel casaLabel = new JLabel("CASA");
		casa = new JComboBox<String>();
		casa.setEditable(false);
		casaBox.add(casaLabel);
		casaBox.add(casa);
		risultatoBox.add(casaBox);
		risultatoBox.add(Box.createHorizontalStrut(80));
		Box punteggioBox = new Box(BoxLayout.X_AXIS);
		NumberFormatter numberFormatterCasa = new NumberFormatter(NumberFormat.getInstance());
		numberFormatterCasa.setValueClass(Integer.class);
		numberFormatterCasa.setMinimum(0);
		numberFormatterCasa.setMaximum(Integer.MAX_VALUE);
		//numberFormatterCasa.setAllowsInvalid(false);
		//numberFormatterCasa.setCommitsOnValidEdit(true);
		punteggioCasaText = new JFormattedTextField(numberFormatterCasa);
		punteggioCasaText.setColumns(2);
		punteggioCasaText.addFocusListener(new MenuCampionato.CaricaNumeroGol(golCasaPanel, punteggioCasaText));
		NumberFormatter numberFormatterTrasferta = new NumberFormatter(NumberFormat.getInstance());
		numberFormatterTrasferta.setValueClass(Integer.class);
		numberFormatterTrasferta.setMinimum(0);
		numberFormatterTrasferta.setMaximum(Integer.MAX_VALUE);
		//numberFormatterTrasferta.setAllowsInvalid(false);
		//numberFormatterTrasferta.setCommitsOnValidEdit(true);
		punteggioTrasfertaText = new JFormattedTextField(numberFormatterTrasferta);
		punteggioTrasfertaText.setColumns(2);
		punteggioTrasfertaText.addFocusListener(new MenuCampionato.CaricaNumeroGol(golTrasfertaPanel, punteggioTrasfertaText));
		punteggioBox.add(punteggioCasaText);
		punteggioBox.add(Box.createHorizontalStrut(10));
		punteggioBox.add(new JLabel("-"));
		punteggioBox.add(Box.createHorizontalStrut(10));
		punteggioBox.add(punteggioTrasfertaText);
		risultatoBox.add(punteggioBox);
		risultatoBox.add(Box.createHorizontalStrut(80));
		Box trasfertaBox = new Box(BoxLayout.Y_AXIS);
		JLabel trasfertaLabel = new JLabel("TRASFERTA");
		trasferta = new JComboBox<String>();
		trasferta.setEditable(false);
		trasfertaBox.add(trasfertaLabel);
		trasfertaBox.add(trasferta);
		risultatoBox.add(trasfertaBox);
		risultatoPanel.add(risultatoBox);
		
		Box salvaBox = new Box(BoxLayout.Y_AXIS);
		salva = new JButton("Salva");
		annulla = new JButton("Annulla");
		salva.addActionListener(new MenuCampionato.EventoSalva());
		annulla.addActionListener(new MenuCampionato.EventoAnnulla());
		salvaBox.add(salva);
		salvaBox.add(Box.createVerticalStrut(10));
		salvaBox.add(annulla);
		salvaPanel.add(salvaBox);
		
		centerPanel.setLayout(new GridLayout(1, 4, 10, 0));
		
		
		Box statCasaBox = new Box(BoxLayout.Y_AXIS);
		statCasaBox.add(new JLabel("Possesso palla"));
		possessoCasaText = new JTextField();
		statCasaBox.add(possessoCasaText);
		statCasaBox.add(new JLabel("Tiri in porta"));
		tiriInPortaCasaText = new JTextField();
		statCasaBox.add(tiriInPortaCasaText);
		statCasaBox.add(new JLabel("Tiri fuori"));
		tiriFuoriCasaText = new JTextField();
		statCasaBox.add(tiriFuoriCasaText);
		statCasaBox.add(new JLabel("Falli"));
		falliCasaText = new JTextField();
		statCasaBox.add(falliCasaText);
		statCasaBox.add(new JLabel("Ammonizioni"));
		ammonizioniCasaText = new JTextField();
		statCasaBox.add(ammonizioniCasaText);
		statCasaBox.add(new JLabel("Espulsioni"));
		espulsioniCasaText = new JTextField();
		statCasaBox.add(espulsioniCasaText);
		centerPanel.add(statCasaBox);
		
		centerPanel.add(new JScrollPane(golCasaPanel));
		centerPanel.add(new JScrollPane(golTrasfertaPanel));
		
		Box statTrasfertaBox = new Box(BoxLayout.Y_AXIS);
		statTrasfertaBox.add(new JLabel("Possesso palla"));
		possessoTrasfertaText = new JTextField();
		statTrasfertaBox.add(possessoTrasfertaText);
		statTrasfertaBox.add(new JLabel("Tiri in porta"));
		tiriInPortaTrasfertaText = new JTextField();
		statTrasfertaBox.add(tiriInPortaTrasfertaText);
		statTrasfertaBox.add(new JLabel("Tiri fuori"));
		tiriFuoriTrasfertaText = new JTextField();
		statTrasfertaBox.add(tiriFuoriTrasfertaText);
		statTrasfertaBox.add(new JLabel("Falli"));
		falliTrasfertaText = new JTextField();
		statTrasfertaBox.add(falliTrasfertaText);
		statTrasfertaBox.add(new JLabel("Ammonizioni"));
		ammonizioniTrasfertaText = new JTextField();
		statTrasfertaBox.add(ammonizioniTrasfertaText);
		statTrasfertaBox.add(new JLabel("Espulsioni"));
		espulsioniTrasfertaText = new JTextField();
		statTrasfertaBox.add(espulsioniTrasfertaText);
		centerPanel.add(statTrasfertaBox);
		
		
		
	}
	
	private class CaricaCampionati implements WindowListener {

		@Override
		public void windowOpened(WindowEvent e) {
			try {
				Statement s = db.createStatement();
				String sql;
				sql = "SELECT anno_calcistico FROM campionato";
				ResultSet res = s.executeQuery(sql);
				while (res.next()) {
					String annoCalcistico = res.getString("anno_calcistico");
					campBox.addItem(annoCalcistico);
				}
				campBox.setSelectedIndex(-1);
			} catch (Exception _e) {
				
			}
			
		}
		@Override public void windowClosing(WindowEvent e) {}
		@Override public void windowClosed(WindowEvent e) {}
		@Override public void windowIconified(WindowEvent e) {}
		@Override public void windowDeiconified(WindowEvent e) {}
		@Override public void windowActivated(WindowEvent e) {}
		@Override public void windowDeactivated(WindowEvent e) {}
	}
	
	private class ControllaData implements FocusListener {
		
		
		@Override public void focusGained(FocusEvent e) {}

		@Override
		public void focusLost(FocusEvent e) {
			if (dataText.getText().trim().length() == 0)
				return;
			try {
				LocalDate.parse(dataText.getText().trim(), DateTimeFormatter.ofPattern("dd/MM/yyyy"));
			} catch (Exception _e) {
				JOptionPane.showMessageDialog(null, "Errore: Data della partita non corretta.");
				dataText.setText("");
			}
		}
	}
	
	private class CaricaSquadra implements WindowListener {
		
		private JComboBox<String> box;
		
		public CaricaSquadra (JComboBox<String> box) {
			this.box = box;
		}

		@Override
		public void windowOpened(WindowEvent e) {
			try {
				Statement s = db.createStatement();
				String sql;
				sql = "SELECT nome FROM squadra";
				ResultSet res = s.executeQuery(sql);
				while (res.next()) {
					String nome = res.getString("nome");
					box.addItem(nome);
				}
				box.setSelectedIndex(-1);
			} catch (Exception _e) {
				
			}
			
		}
		@Override public void windowClosing(WindowEvent e) {}
		@Override public void windowClosed(WindowEvent e) {}
		@Override public void windowIconified(WindowEvent e) {}
		@Override public void windowDeiconified(WindowEvent e) {}
		@Override public void windowActivated(WindowEvent e) {}
		@Override public void windowDeactivated(WindowEvent e) {}
	}
	
	private class CaricaGiornate implements ItemListener {

		@Override
		public void itemStateChanged(ItemEvent e) {
			if (e.getStateChange() == ItemEvent.SELECTED) {
				gioBox.removeAllItems();
				String annoCalcistico = (String) campBox.getSelectedItem();
				try {
					Statement s = db.createStatement();
					String sql;
					sql = "SELECT numero FROM giornata WHERE anno_calcistico ='"+annoCalcistico+"'";
					ResultSet res = s.executeQuery(sql);
					while (res.next()) {
						String numero = res.getString("numero");
						gioBox.addItem(numero);
					}
				} catch (Exception _e) {
					
				}
			} else if (e.getStateChange() == ItemEvent.DESELECTED) {
				gioBox.removeAllItems();
			}
		}
		
		
	}
	
	private class ControllaStessaSquadra implements ItemListener {

		@Override
		public void itemStateChanged(ItemEvent e) {
			if ((e.getStateChange() == ItemEvent.SELECTED) && (casa.getSelectedIndex() >= 0) && (trasferta.getSelectedIndex() >= 0)) {
				if (casa.getSelectedItem().equals(trasferta.getSelectedItem())) {
					JOptionPane.showMessageDialog(null, "Errore: Partita disputata tra stesse squadre.");
					casa.setSelectedIndex(-1);
					trasferta.setSelectedIndex(-1);
				}
				
			}
		}
		
	}
	
	private class CaricaGiocatori implements ItemListener {
		
		@Override
		public void itemStateChanged(ItemEvent e) {
			if (e.getStateChange() == ItemEvent.SELECTED) {
				ArrayList<StructCalciatore> calciatori = new ArrayList<StructCalciatore>();
				if (casa.getSelectedIndex() >= 0) {
					try {
						Statement s = db.createStatement();
						String sql;
						sql = "SELECT C.cognome AS cognome, C.tessera_FIGC as tessera_FIGC " + 
								"FROM CALCIATORE AS C " + 
								"INNER JOIN CONTRATTO ON CONTRATTO.tessera_FIGC = C.tessera_FIGC " + 
								"WHERE " + 
								"	CONTRATTO.data_inizio = (		SELECT MAX(data_inizio) " + 
								"									FROM CONTRATTO " + 
								"									WHERE CONTRATTO.tessera_FIGC = C.tessera_FIGC) " + 
								"AND CONTRATTO.squadra LIKE '" + casa.getSelectedItem().toString() + "'" + 
								"ORDER BY cognome";
						ResultSet res = s.executeQuery(sql);
						while (res.next()) {
							String cognome = res.getString("cognome");
							int tessera_FIGC = res.getInt("tessera_FIGC");
							calciatori.add(new StructCalciatore(cognome, tessera_FIGC));
						}
					} catch (Exception _e) {
						
					}
				}
				if (trasferta.getSelectedIndex() >= 0) {
					try {
						Statement s = db.createStatement();
						String sql;
						sql = "SELECT C.cognome AS cognome, C.tessera_FIGC as tessera_FIGC " + 
								"FROM CALCIATORE AS C " + 
								"INNER JOIN CONTRATTO ON CONTRATTO.tessera_FIGC = C.tessera_FIGC " + 
								"WHERE " + 
								"	CONTRATTO.data_inizio = (		SELECT MAX(data_inizio) " + 
								"									FROM CONTRATTO " + 
								"									WHERE CONTRATTO.tessera_FIGC = C.tessera_FIGC) " + 
								"AND CONTRATTO.squadra LIKE '" + trasferta.getSelectedItem().toString() + "'" + 
								"ORDER BY cognome";
						ResultSet res = s.executeQuery(sql);
						while (res.next()) {
							String cognome = res.getString("cognome");
							int tessera_FIGC = res.getInt("tessera_FIGC");
							calciatori.add(new StructCalciatore(cognome, tessera_FIGC));
						}
					} catch (Exception _e) {
						
					}
				}
				golCasaPanel.setCalciatori(calciatori);
				golTrasfertaPanel.setCalciatori(calciatori);
			}
		}
		
	}
	
	private class CaricaNumeroGol implements FocusListener {
		
		private ContainerGol container;
		private JFormattedTextField textField;
		
		public CaricaNumeroGol(ContainerGol container, JFormattedTextField textField) {
			this.container = container;
			this.textField = textField;
		}
		
		@Override public void focusGained(FocusEvent e) {}

		@Override
		public void focusLost(FocusEvent e) {
			if ((!e.isTemporary()) && (textField.getText().length() > 0)) {
				try {
					int numeroGol = Integer.parseInt(textField.getText());
					container.setNumeroGol(numeroGol);
				} catch (Exception _e) {
					
				}
			}
		}
		
	}
	
	private class EventoSalva implements ActionListener {
		
		private boolean isStatisticheTrasfertaValide() {
			return 	(	(possessoTrasfertaText.getText().trim().length() > 0)
					&&	(tiriInPortaTrasfertaText.getText().trim().length() > 0)
					&&	(tiriFuoriTrasfertaText.getText().trim().length() > 0)
					&&	(falliTrasfertaText.getText().trim().length() > 0)
					&&	(ammonizioniTrasfertaText.getText().trim().length() > 0)
					&&	(espulsioniTrasfertaText.getText().trim().length() > 0)		);
		}

		private boolean isStatisticheCasaValide() {
			return 	(	(possessoCasaText.getText().trim().length() > 0)
					&&	(tiriInPortaCasaText.getText().trim().length() > 0)
					&&	(tiriFuoriCasaText.getText().trim().length() > 0)
					&&	(falliCasaText.getText().trim().length() > 0)
					&&	(ammonizioniCasaText.getText().trim().length() > 0)
					&&	(espulsioniCasaText.getText().trim().length() > 0)		);
		}
		
		public void actionPerformed(ActionEvent e) {
			if (	(dataText.getText().trim().length() == 0)
				||	(campBox.getSelectedIndex() < 0)
				||	(gioBox.getSelectedIndex() < 0)
				||	(casa.getSelectedIndex() < 0)
				||	(punteggioCasaText.getText().trim().length() == 0)
				||	(trasferta.getSelectedIndex() < 0)
				||	(punteggioTrasfertaText.getText().trim().length() == 0)
				||	(!this.isStatisticheCasaValide())
				||	(!this.isStatisticheTrasfertaValide())
				||	(!golCasaPanel.isFilled())
				||	(!golTrasfertaPanel.isFilled())		) {
				JOptionPane.showMessageDialog(null, "Errore: I campi non sono stati tutti inseriti.");
				return;
			}
			
			int formazioneCasa = this.getMaxCodiceFormazione() + 1;
			int formazioneTrasferta = formazioneCasa + 1;
			int codicePartita = this.getMaxCodicePartita() + 1;
			String squadraCasa = casa.getSelectedItem().toString();
			String squadraTrasferta = trasferta.getSelectedItem().toString();
			LocalDate data = LocalDate.parse(dataText.getText().trim(), DateTimeFormatter.ofPattern("dd/MM/yyyy"));
			String annoCalcistico = campBox.getSelectedItem().toString();
			String giornata = gioBox.getSelectedItem().toString();
			int punteggioCasa = Integer.parseInt(punteggioCasaText.getText().trim());
			int punteggioTrasferta = Integer.parseInt(punteggioTrasfertaText.getText().trim());
			int esitoCasa, esitoTrasferta;
			if (punteggioCasa == punteggioTrasferta) {
				esitoCasa = 1;
				esitoTrasferta = 1;
			} else if (punteggioCasa > punteggioTrasferta) {
				esitoCasa = 3;
				esitoTrasferta = 0;
			} else {
				esitoCasa = 0;
				esitoTrasferta = 3;
			}
			
			int possessoCasa = Integer.parseInt(possessoCasaText.getText().trim());
			int possessoTrasferta = Integer.parseInt(possessoTrasfertaText.getText().trim());
			int tiriInPortaCasa = Integer.parseInt(tiriInPortaCasaText.getText().trim());
			int tiriInPortaTrasferta = Integer.parseInt(tiriInPortaTrasfertaText.getText().trim());
			int tiriFuoriCasa = Integer.parseInt(tiriFuoriCasaText.getText().trim());
			int tiriFuoriTrasferta = Integer.parseInt(tiriFuoriTrasfertaText.getText().trim());
			int falliCasa = Integer.parseInt(falliCasaText.getText().trim());
			int falliTrasferta = Integer.parseInt(falliTrasfertaText.getText().trim());
			int ammonizioniCasa = Integer.parseInt(ammonizioniCasaText.getText().trim());
			int ammonizioniTrasferta = Integer.parseInt(ammonizioniTrasfertaText.getText().trim());
			int espulsioniCasa = Integer.parseInt(espulsioniCasaText.getText().trim());
			int espulsioniTrasferta = Integer.parseInt(espulsioniTrasfertaText.getText().trim());
			
			Collection<StructGol> marcatoriCasa = golCasaPanel.getGols();
			Collection<StructGol> marcatoriTrasferta = golTrasfertaPanel.getGols();
			
			String sqlFormazione1 = "";
			String sqlFormazione2 = "";
			String sqlPartita = "";
			String sqlGol = "";
			sqlFormazione1 = "INSERT INTO FORMAZIONE (codice, squadra) VALUES ("+ formazioneCasa +",'"+ squadraCasa +"')";
			sqlFormazione2 = "INSERT INTO FORMAZIONE (codice, squadra) VALUES ("+ formazioneTrasferta +", '"+ squadraTrasferta +"')";

			sqlPartita = "INSERT INTO PARTITA ( codice,      data         ,   esito_casa  ,    esito_trasferta  ,  gol_casa  ,   gol_trasferta    ,    possesso_palla_casa,    possesso_palla_trasferta,    tiri_in_porta_casa,    tiri_in_porta_trasferta,    tiri_fuori_casa ,    tiri_fuori_trasferta ,    falli_casa  ,    falli_trasferta  ,    ammonizioni_casa  ,    ammonizioni_trasferta  ,    espulsioni_casa  ,    espulsioni_trasferta  ,    anno_calcistico   ,   giornata ,    squadra_casa  ,     squadra_trasferta   ,    formazione_casa  ,    formazione_trasferta) "+ 
					"VALUES    ("+ codicePartita +", '"+  this.convertToSQLDateFormat(data) +"', "+ esitoCasa +", "+ esitoTrasferta +", "+ punteggioCasa +", "+ punteggioTrasferta +", "+ possessoCasa +"   , "+ possessoTrasferta +"    , "+ tiriInPortaCasa +", "+ tiriInPortaTrasferta +", "+ tiriFuoriCasa +", "+ tiriFuoriTrasferta +", "+ falliCasa +", "+ falliTrasferta +", "+ ammonizioniCasa +", "+ ammonizioniTrasferta +", "+ espulsioniCasa +", "+ espulsioniTrasferta +", '"+ annoCalcistico +"', "+ giornata +", '"+ squadraCasa +"', '"+ squadraTrasferta +"', "+ formazioneCasa +", "+ formazioneTrasferta +")";
			
			
			
			try {
				int res = db.createStatement().executeUpdate(sqlFormazione1);
				if (res <= 0) {
					throw new Exception();
				}
				res = db.createStatement().executeUpdate(sqlFormazione2);
				if (res <= 0) {
					throw new Exception();
				}
				res = db.createStatement().executeUpdate(sqlPartita);
				if (res <= 0) {
					throw new Exception();
				}
				for (StructGol gol: marcatoriCasa) {
					sqlGol = "INSERT INTO GOL(   tessera_FIGC       ,   partita   ,    minuto   ,   autogol     , rigore) "+
							"VALUES      ("+ gol.getNumeroTessera() +", "+ codicePartita +", "+ gol.getMinuto() +", "+ gol.isAutogol() +", "+ gol.isRigore() +")";
					res = db.createStatement().executeUpdate(sqlGol);
					if (res <= 0) {
						throw new Exception();
					}
				}
				for (StructGol gol: marcatoriTrasferta) {
					sqlGol = "INSERT INTO GOL(   tessera_FIGC       ,   partita   ,    minuto   ,   autogol     , rigore) "+
						   "VALUES      ("+ gol.getNumeroTessera() +", "+ codicePartita +", "+ gol.getMinuto() +", "+ gol.isAutogol() +", FALSE)";
					res = db.createStatement().executeUpdate(sqlGol);
					if (res <= 0) {
						throw new Exception();
					}
				}
				JOptionPane.showMessageDialog(null, "Inserimento della partita avvenuto con successo.");
			} catch (Exception _e) {
				JOptionPane.showMessageDialog(null, "Errore d'inserimento partita.");
				_e.printStackTrace();
			}
			annulla.doClick();
		}

		private int getMaxCodiceFormazione() {
			try {
				Statement s = db.createStatement();
				String sql;
				sql = "SELECT MAX(codice) FROM formazione";
				ResultSet res = s.executeQuery(sql);
				if (res.next()) {
					return res.getInt(1);
				}
			} catch (Exception _e) {
				
			}
			return -1;
		}
		
		private int getMaxCodicePartita() {
			try {
				Statement s = db.createStatement();
				String sql;
				sql = "SELECT MAX(codice) FROM partita";
				ResultSet res = s.executeQuery(sql);
				if (res.next()) {
					return res.getInt(1);
				}
			} catch (Exception _e) {
				
			}
			return -1;
		}
		
		private String convertToSQLDateFormat(LocalDate data) {
			String month, day;
			if (data.getMonthValue() <= 9)
				month = "0" + data.getMonthValue();
			else 
				month = "" + data.getMonthValue();
			if (data.getDayOfMonth() <= 9)
				day = "0" + data.getDayOfMonth();
			else 
				day = "" + data.getDayOfMonth();
			return "" + data.getYear() + month + day;
		}
	}
	
	private class EventoAnnulla implements ActionListener {

		public void actionPerformed(ActionEvent e) {
			dataText.setText("");
			campBox.setSelectedIndex(-1);
			gioBox.setSelectedIndex(-1);
			casa.setSelectedIndex(-1);
			trasferta.setSelectedIndex(-1);
			punteggioCasaText.setText("");
			possessoCasaText.setText("");
			tiriInPortaCasaText.setText("");
			tiriFuoriCasaText.setText("");
			falliCasaText.setText("");
			ammonizioniCasaText.setText("");
			espulsioniCasaText.setText("");
			punteggioTrasfertaText.setText("");
			possessoTrasfertaText.setText("");
			tiriInPortaTrasfertaText.setText("");
			tiriFuoriTrasfertaText.setText("");
			falliTrasfertaText.setText("");
			ammonizioniTrasfertaText.setText("");
			espulsioniTrasfertaText.setText("");
			golCasaPanel.setNumeroGol(0);
			golCasaPanel.clearCalciatori();
			golTrasfertaPanel.setNumeroGol(0);
			golTrasfertaPanel.clearCalciatori();
		}
		
	}
	
	private class EventoVisualizzaClassifica implements ActionListener {

		public void actionPerformed(ActionEvent e) {
			try {
				
				
				Statement s = db.createStatement();
				String sql;
				Object buttonClick = e.getSource();
				if (buttonClick==visualizzaC) {
					sql = "WITH PartiteGiocate(SQUADRA, ESITO, GOLFATTI, GOLSUBITI, ANNOCALCISTICO) AS ( (SELECT P.squadra_casa AS SQUADRA, P.esito_casa AS ESITO, P.gol_casa AS GOLFATTI, P.gol_trasferta AS GOLSUBITI, P.anno_calcistico AS ANNOCALCISTICO FROM PARTITA AS P) UNION ALL (SELECT P.squadra_trasferta AS SQUADRA, P.esito_trasferta AS ESITO, P.gol_trasferta AS GOLFATTI, P.gol_casa AS GOLSUBITI, P.anno_calcistico AS ANNOCALCISTICO FROM PARTITA AS P) ) SELECT SQUADRA, SUM(ESITO) AS PUNTI, COUNT(*) AS PG, COUNT(CASE WHEN ESITO = 3 THEN 1 ELSE NULL END) AS V, COUNT(CASE WHEN ESITO = 1 THEN 1 ELSE NULL END) AS P, COUNT(CASE WHEN ESITO = 0 THEN 1 ELSE NULL END) AS S, SUM(GOLFATTI) AS GF, SUM(GOLSUBITI) AS GS FROM PartiteGiocate WHERE ANNOCALCISTICO = '2019/2020' GROUP BY SQUADRA ORDER BY PUNTI DESC, (SUM(GOLFATTI) - SUM(GOLSUBITI)) DESC";
					ResultSet res = s.executeQuery(sql);
					ResultSetMetaData metaData = res.getMetaData();
					int cols = metaData.getColumnCount();
					DefaultTableModel model = (DefaultTableModel) tabellaClassifica.getModel();
					for (int i = model.getRowCount() - 1; i >= 0; i--) {
						model.removeRow(i);
					}
					while (res.next()) {
						Vector<Object> row = new Vector<Object>(cols);
						for (int i=1; i <= cols; i++) {
							row.addElement(res.getObject(i));
						}
						model.addRow(row);
					}
					model.fireTableDataChanged();
					tabellaClassifica.repaint();
				} else if (buttonClick==visualizzaM) {
					sql = "SELECT C.cognome AS cognome, SUM(CASE WHEN G.autogol = true THEN 0 ELSE 1 END) AS golFatti, CONTRATTO.squadra FROM CALCIATORE AS C INNER JOIN GOL AS G ON C.tessera_FIGC = G.tessera_FIGC INNER JOIN CONTRATTO ON CONTRATTO.tessera_FIGC = C.tessera_FIGC WHERE CONTRATTO.data_inizio = (		SELECT MAX(data_inizio) FROM CONTRATTO WHERE CONTRATTO.tessera_FIGC = C.tessera_FIGC) GROUP BY C.cognome, CONTRATTO.squadra HAVING golFatti > 0 ORDER BY golFatti DESC, cognome";
					ResultSet res = s.executeQuery(sql);
					ResultSetMetaData metaData = res.getMetaData();
					int cols = metaData.getColumnCount();
					DefaultTableModel model = (DefaultTableModel) tabellaMarcatori.getModel();
					for (int i = model.getRowCount() - 1; i >= 0; i--) {
						model.removeRow(i);
					}
					while (res.next()) {
						Vector<Object> row = new Vector<Object>(cols);
						for (int i=1; i <= cols; i++) {
							row.addElement(res.getObject(i));
						}
						model.addRow(row);
					}
					model.fireTableDataChanged();
					tabellaMarcatori.repaint();
				}
				s.close();
			} catch (Exception ex) {
				
			}
			
		}
		
	}

}
