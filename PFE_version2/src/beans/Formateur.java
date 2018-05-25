package beans;

import java.util.Map;


public class Formateur extends Personne{
	private int id;
	private String specialite;
	private Map<Formation, Module[]> modules;

	public Map<Formation, Module[]> getModules() {
		return modules;
	}
	public void setModules(Map<Formation, Module[]> modules) {
		this.modules = modules;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpecialite() {
		return specialite;
	}
	public void setSpecialite(String specialite) {
		this.specialite = specialite;
	}
	
}
