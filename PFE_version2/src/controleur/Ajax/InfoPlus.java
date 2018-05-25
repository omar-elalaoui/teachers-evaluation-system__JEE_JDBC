package controleur.Ajax;

import java.io.IOException;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Formateur;
import beans.Forme;
import beans.Formation;
import beans.Module;
import dao.FormateurDB;
import dao.FormationDB;
import dao.FormeDB;


public class InfoPlus extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name= request.getParameter("name");
		int id= Integer.parseInt(request.getParameter("id"));
		
		String htmlCode=" ";
		if(name.equals("formateurProfile")) {
			Formateur formateur= FormateurDB.get(id);
			
			Calendar frCal= Calendar.getInstance();
			frCal.setTime(formateur.getDate_naissance());
			
			htmlCode= "<div class='col-sm-6'><h4 style='color:#00b1b1;'>"+formateur.getPrenom()+" "+formateur.getNom()+"</h4><p>"+FormateurDB.getAge(frCal)+" ans</p></div><div class='clearfix'></div><hr style='margin:5px 0 5px 0;'>"+
	        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Prénom:</label></div>"+
	        "<div class='col-sm-7 col-xs-6 '>"+formateur.getPrenom()+"</div><div class='clearfix'></div>"+
	        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Nom:</label></div>"+
	        "<div class='col-sm-7'>"+formateur.getNom()+"</div><div class='clearfix'></div>"+
	        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Age:</label></div>"+
	        "<div class='col-sm-7'>"+FormateurDB.getAge(frCal)+" ans</div><div class='clearfix'></div>"+
	        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Téléphone:</label></div>"+
	        "<div class='col-sm-7'>"+formateur.getTelephone()+"</div><div class='clearfix'></div>"+
	        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Email:</label></div>"+
	        "<div class='col-sm-7'>"+formateur.getEmail()+"</div><div class='clearfix'></div>"+
	        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Specialité:</label></div>"+
	        "<div class='col-sm-7'>"+formateur.getSpecialite()+"</div><div class='clearfix'></div>";	
		}
		else if(name.equals("formateurModules")) {
			if(FormateurDB.getModules(id).isEmpty()) {
				htmlCode="<div id='nom'>"+FormateurDB.get(id).getPrenom()+" "+FormateurDB.get(id).getNom()+"</div>";
			}else {
			
			String formationModule=" ";
			for(Map.Entry<Formation, Module[]> entry: FormateurDB.getModules(id).entrySet()) {
				String modules="";
				for(Module m: entry.getValue()) { modules += "<li class='list-group-item'>"+ m.getModule() +"</li>"; }
				formationModule += "<li class='list-group-item'><div>"+ entry.getKey().getFormation() +" :</div><ul class='list-group'>"+ modules +"</ul></li>";
			}
			htmlCode="<div id='nom'>"+FormateurDB.get(id).getPrenom()+" "+FormateurDB.get(id).getNom()+"</div>"+
					"<div id='modulesList'><ul class='list-group fontPlus moduleesList'>"+formationModule+"</ul></div>";
			}
			
			
		}else if(name.equals("affecterChangerModules")) {
			if(FormateurDB.getModules(id).isEmpty()) {
				htmlCode="<div id='nom'>"+FormateurDB.get(id).getPrenom()+" "+FormateurDB.get(id).getNom()+"</div>"+
						"<div class='text-center' id='modules'><em>Aucun module</em><input type='text' value='"+id+"' name='id' style='display:none;'></div>";
			}else {
				String div="";
				for(Map.Entry<Formation, Module[]> entry: FormateurDB.getModules(id).entrySet()) {
					for(Module m: entry.getValue()) { 
						div += "<div class='form-group-s'><div class='input-group'>"+
		                        "<input type='text' READONLY required class='form-control' value=\""+m.getModule()+"     ["+entry.getKey().getFormation()+"]\"><span class='input-group-btn'>"+
		                        "<button type='button' class='btn btn-default supp'><i class='fa fa-times'></i></button></span><input type='number' value='"+m.getId()+"' name='module' style='display:none;'>"+
		                        "</div><div class='clearfix'></div></div>";
					}
				}
				htmlCode= "<div id='nom'>"+FormateurDB.get(id).getPrenom()+" "+FormateurDB.get(id).getNom()+"</div>"+
						"<div id='modules'><input type='text' value='"+id+"' name='id' style='display:none;'>"+div+"</div>";
			}
        }else if(name.equals("formationPlus")) {
			Formation formation= FormationDB.get(id);
			String moduleList= "";
			String formateurList= "";
			String formeList= "";
			int i=0;
			for(Module m: FormationDB.getModules(id)) { 
				moduleList += "<tr><td><label class='control-label'>"+m.getModule()+"</label></td></tr>"; 
				}
			for(Formateur f: FormationDB.getFormateurs(id)) { i++; formateurList += "<tr><th scope='row'>"+i+"</th><td>"+f.getPrenom()+"</td><td>"+f.getNom()+"</td></tr>"; }
			i=0;
			for(Forme f: FormationDB.getFormes(id)) { i++; formeList += "<tr><th scope='row'>"+i+"</th><td>"+f.getPrenom()+"</td><td>"+f.getNom()+"</td></tr>"; }
			
			htmlCode= "<div id='formationTitre'>"+formation.getFormation()+"</div>"+
			"<div id='formationInfo'>"+
	                "<table class='table f_table'><tbody>"+
	                "<tr><td><label class='control-label'>Volume horaire </label></td><td>" +formation.getDuree()+ "</td></tr>"+
	                "<tr><td><label class='control-label'>Date de début </label></td><td>"+ formation.getDate_debut() +"</td></tr>"+
	                "<tr><td><label class='control-label'>Date de fin </label></td><td>"+ formation.getDate_fin() +"</td></tr>"+
	                "</tbody></table>"+
	         "</div>"+
	         "<div id='tableFormateurs'><table>"+formateurList+"</table></div>"+
	         "<div id='tableFormes'><table>"+formeList+"</table></div>"+
	         "<div id='listModules'><u><h2 class='text-danger text-center'>"+formation.getFormation()+"</h2></u><br><table class='table f_table'><tbody>"+moduleList+"</tbody></table></div>";
			
			
			
		}else if(name.equals("formeProfile")) {
			Forme forme= FormeDB.get(id);
			Calendar frCal= Calendar.getInstance();
			frCal.setTime(forme.getDate_naissance());
			
			htmlCode= "<div class='col-sm-6'><h4 style='color:#00b1b1;'>"+forme.getPrenom()+" "+forme.getNom()+"</h4><p>"+FormateurDB.getAge(frCal)+" ans</p></div>"+
					    "<div class='clearfix'></div><hr style='margin:5px 0 5px 0;'>"+
				        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Prénom:</label></div>"+
				        "<div class='col-sm-7 col-xs-6 '>"+forme.getPrenom()+"</div><div class='clearfix'></div>"+
				        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Nom:</label></div>"+
				        "<div class='col-sm-7'>"+forme.getNom()+"</div><div class='clearfix'></div>"+
				        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Age:</label></div>"+
				        "<div class='col-sm-7'>"+FormateurDB.getAge(frCal)+" ans</div><div class='clearfix'></div>"+
				        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Téléphone:</label></div>"+
				        "<div class='col-sm-7'>"+forme.getTelephone()+"</div><div class='clearfix'></div>"+
				        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>Email:</label></div>"+
				        "<div class='col-sm-7'>"+forme.getEmail()+"</div><div class='clearfix'></div>"+
				        "<div class='col-sm-5 col-xs-6 tital '><label class='control-label'>CIN:</label></div>"+
				        "<div class='col-sm-7'>"+forme.getCin()+"</div><div class='clearfix'></div>";
			
			
		}else if(name.equals("formeFormations")) {
			if(FormeDB.getFormations(id).isEmpty()) {
				htmlCode="<div class='text-center'><em>Aucune formation</em></div>";
			}else {
				String li= "";
				for(Formation f: FormeDB.getFormations(id)) {
					li += "<li class='list-group-item'>"+f.getFormation()+"</li>";
				}
				htmlCode= "<div class='x_title'><h2 class='paddLeftPlus paddTopPlus'>"+FormeDB.get(id).getPrenom()+" "+FormeDB.get(id).getNom()+"</h2><div class='clearfix'></div></div></h2><br><ul class='list-group fontPlus'>"+li+"</ul>";
			}
			
			
		}else if(name.equals("affecterChangerFormations")) {
			if(FormeDB.getFormations(id).isEmpty()) {
				htmlCode="<div id='nom'>"+FormeDB.get(id).getPrenom()+" "+FormeDB.get(id).getNom()+"</div>"+
						"<div class='text-center' id='listFormations'><em>Aucune formation</em><input type='text' value='"+id+"' name='id' style='display:none;'></div>";
			}else {
				String div="";
					for(Formation f: FormeDB.getFormations(id)) { 
						div += "<div class='form-group-s'><div class='input-group'>"+
		                        "<input type='text' READONLY required class='form-control' value=\""+f.getFormation()+"\"><span class='input-group-btn'>"+
		                        "<button type='button' class='btn btn-default supp'><i class='fa fa-times'></i></button></span><input type='number' value='"+f.getId()+"' name='formation' style='display:none;'></div><div class='clearfix'></div></div>";
					}
				htmlCode="<div id='nom'>"+FormeDB.get(id).getPrenom()+" "+FormeDB.get(id).getNom()+"</div>"+
						"<div id='listFormations'><input type='text' value='"+id+"' name='id' style='display:none;'>"+div+"</div>";
					}
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("TF-8");
		response.getWriter().write(htmlCode);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
