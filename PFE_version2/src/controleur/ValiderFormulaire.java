package controleur;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Resultat;
import beans.Formation;
import beans.Module;
import dao.FormeDB;
import dao.ModuleDB;
import dao.ResultatDB;

public class ValiderFormulaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session= request.getSession(false);
			int hash= (Integer)session.getAttribute("formulaire_hash");
			FormeDB.deleteHash(hash);
			
			Resultat rs= new Resultat();
			Module module= ModuleDB.get(Integer.parseInt(request.getParameter("module_id")));
			Formation formation= ModuleDB.getFormation(module.getId());
			
			rs.setFormation(formation);
			rs.setModule(module);
			
			if(request.getParameter("formation_q1") != null) { rs.setR1(request.getParameter("formation_q1")); }
			if(request.getParameter("formation_q2") != null) { rs.setR2(request.getParameter("formation_q2")); }
			if(request.getParameter("formation_q3") != null) { rs.setR3(request.getParameter("formation_q3")); }
			
			if(request.getParameter("communication_q1") != null) { rs.setR4(request.getParameter("communication_q1")); }
			if(request.getParameter("communication_q2") != null) { rs.setR5(request.getParameter("communication_q2")); }
			if(request.getParameter("communication_q3") != null) { rs.setR6(request.getParameter("communication_q3")); }
			if(request.getParameter("communication_q4") != null) { rs.setR7(request.getParameter("communication_q4")); }
			
			if(request.getParameter("enseignement_q1") != null) { rs.setR8(request.getParameter("enseignement_q1")); }
			if(request.getParameter("enseignement_q2") != null) { rs.setR9(request.getParameter("enseignement_q2")); }
			if(request.getParameter("enseignement_q3") != null) { rs.setR10(request.getParameter("enseignement_q3")); }
			if(request.getParameter("enseignement_q4") != null) { rs.setR11(request.getParameter("enseignement_q4")); }
			
	        if(request.getParameter("evaluation_q1") != null) { rs.setR12(request.getParameter("evaluation_q1")); }
			if(request.getParameter("evaluation_q2") != null) { rs.setR13(request.getParameter("evaluation_q2")); }
			if(request.getParameter("evaluation_q3") != null) { rs.setR14(request.getParameter("evaluation_q3")); }
			if(request.getParameter("evaluation_q4") != null) { rs.setR15(request.getParameter("evaluation_q4")); }
			
	        if(request.getParameter("techniques_q1") != null) { rs.setR16(request.getParameter("techniques_q1")); }
			if(request.getParameter("techniques_q2") != null) { rs.setR17(request.getParameter("techniques_q2")); }
			if(request.getParameter("techniques_q3") != null) { rs.setR18(request.getParameter("techniques_q3")); }

			if(request.getParameter("autres_q1") != null) { rs.setR19(request.getParameter("autres_q1")); }
			if(request.getParameter("autres_q2") != null) { rs.setR20(request.getParameter("autres_q2")); }
			if(request.getParameter("autres_q3") != null) { rs.setR21(request.getParameter("autres_q3")); }
			if(request.getParameter("autres_q4") != null) { rs.setR22(request.getParameter("autres_q4")); }
	        
	        if(request.getParameter("commentaire") != null) { rs.setCommentaire(request.getParameter("commentaire")); }
			
	        ResultatDB.add(rs);
	        
			response.sendRedirect("validationMessage.jsp");
	}


}
