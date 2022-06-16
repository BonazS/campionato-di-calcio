package campionatoDiCalcio;

public class StructCalciatore {
	
	private String cognome;
	private int tesseraFIGC;
	
	public StructCalciatore(String cognome, int tesseraFIGC) {
		super();
		this.cognome = cognome;
		this.tesseraFIGC = tesseraFIGC;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	public int getTesseraFIGC() {
		return tesseraFIGC;
	}
	
	public void setTesseraFIGC(int tesseraFIGC) {
		this.tesseraFIGC = tesseraFIGC;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + tesseraFIGC;
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StructCalciatore other = (StructCalciatore) obj;
		if (tesseraFIGC != other.tesseraFIGC)
			return false;
		return true;
	}
	
	public String toString( ) {
		return cognome;
	}
}
