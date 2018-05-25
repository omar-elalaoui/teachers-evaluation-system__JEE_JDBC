package beans;

import java.util.*;

public class Formation {
	private int id, duree;
	private String formation;
	private Date date_debut, date_fin;
	private List<Module> modules;
	private List<Formateur> formateurs;
	private List<Forme> formes;

	public List<Module> getModules() {
		return modules;
	}
	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	public List<Formateur> getFormateurs() {
		return formateurs;
	}
	public void setFormateurs(List<Formateur> formateurs) {
		this.formateurs = formateurs;
	}
	public List<Forme> getFormes() {
		return formes;
	}
	public void setFormes(List<Forme> formes) {
		this.formes = formes;
	}
	public String getFormation() {
		return formation;
	}
	public void setFormation(String formation) {
		this.formation = formation;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	public Date getDate_debut() {
		return date_debut;
	}
	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}
	public Date getDate_fin() {
		return date_fin;
	}
	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}
}
