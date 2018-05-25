package beans;

import java.util.List;

public class Forme extends Personne{
	private int id;
	private List<Formation> formationList;
	private String cin;
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public List<Formation> getFormationList() {
		return formationList;
	}
	public void setFormationList(List<Formation> formationList) {
		this.formationList = formationList;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
}
