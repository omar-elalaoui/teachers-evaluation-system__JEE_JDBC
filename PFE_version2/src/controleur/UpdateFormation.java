package controleur;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Formation;
import dao.FormationDB;


public class UpdateFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id= Integer.parseInt(request.getParameter("id"));
		String duree= request.getParameter("duree");
		String date_debutS= request.getParameter("date_debut");
		String date_finS= request.getParameter("date_fin");
		
		try {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date_debut= format.parse(date_debutS);
			Date date_fin= format.parse(date_finS);
			
			Formation f= new Formation();
			f.setId(id);
			f.setDuree(Integer.parseInt(duree));
			f.setDate_debut(date_debut);
			f.setDate_fin(date_fin);
			FormationDB.update(f);
		   response.sendRedirect("formation.jsp");
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
