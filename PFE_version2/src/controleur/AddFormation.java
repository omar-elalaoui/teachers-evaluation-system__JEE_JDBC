package controleur;

import java.io.IOException;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Formation;
import beans.Module;
import dao.FormationDB;
import dao.ModuleDB;

public class AddFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String formation= request.getParameter("formation");
			String duree= request.getParameter("duree");
			String date_debutS= request.getParameter("date_debut");
			String date_finS= request.getParameter("date_fin");
			List<String> modules= Arrays.asList(request.getParameterValues("module"));
			
			for(String s: modules) {
				System.out.println(s);
			}
			try {
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date date_debut= format.parse(date_debutS);
				Date date_fin= format.parse(date_finS);
				
				Formation f= new Formation();
				f.setFormation(formation);
				f.setDuree(Integer.parseInt(duree));
				f.setDate_debut(date_debut);
				f.setDate_fin(date_fin);

				if(FormationDB.add(f)>0) {
					Formation fLast= FormationDB.getLast();
					for(String moduleS: modules) {
						Module m= new Module();
						m.setModule(moduleS);
						m.setFormation(fLast);
						ModuleDB.add(m);
					}
					response.sendRedirect("formation.jsp");
				}
				
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
	}
	


}
