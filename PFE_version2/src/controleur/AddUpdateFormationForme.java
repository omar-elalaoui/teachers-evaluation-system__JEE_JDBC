package controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Formation;
import dao.FormationDB;
import dao.FormeDB;


public class AddUpdateFormationForme extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Formation> formationsList= new ArrayList<Formation>();
		int id= Integer.parseInt(request.getParameter("id"));
		try {
			if(request.getParameterMap().containsKey("formation")) {
				String[] formationsString= request.getParameterValues("formation");
				for(String s: formationsString) {
					formationsList.add(FormationDB.get(Integer.parseInt(s)));
				}
			}
			FormeDB.affecterChangerFormations(id, formationsList);
			response.sendRedirect("formes.jsp");
		} catch (Exception e) {
			System.out.println("AddUpdateFormationForme exception: "+ e.getMessage());
		}

	}

}
