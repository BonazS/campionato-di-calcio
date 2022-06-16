package campionatoDiCalcio;

public class StructGol {
	
	private int numeroTessera;
	private int minuto;
	private boolean autogol;
	private boolean rigore;
	
	public boolean isRigore() {
		return rigore;
	}
	public void setRigore(boolean rigore) {
		this.rigore = rigore;
	}
	public int getNumeroTessera() {
		return numeroTessera;
	}
	public void setNumeroTessera(int numeroTessera) {
		this.numeroTessera = numeroTessera;
	}
	public int getMinuto() {
		return minuto;
	}
	public void setMinuto(int minuto) {
		this.minuto = minuto;
	}
	public boolean isAutogol() {
		return autogol;
	}
	public void setAutogol(boolean autogol) {
		this.autogol = autogol;
	}
	
}
