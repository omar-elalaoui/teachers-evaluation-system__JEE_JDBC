package controleur.Ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Formateur;
import beans.Formation;
import beans.Forme;
import dao.FormateurDB;
import dao.FormationDB;
import dao.FormeDB;

import com.google.gson.Gson;

public class ProfileAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			String nom= request.getParameter("profileNom");
			int id= Integer.parseInt(request.getParameter("id"));
			String json="";
			if(nom.equals("formateur")) {
				Formateur f= FormateurDB.get(id);
				json= new Gson().toJson(f);
			}else if(nom.equals("forme")) {
				Forme f= FormeDB.get(id);
				json= new Gson().toJson(f);
			}else if(nom.equals("formation")) {
				Formation f= FormationDB.get(id);
				f.setModules(FormationDB.getModules(id));
				json= new Gson().toJson(f);
			}
			response.getWriter().write(json);
		} catch (Exception e) {
			System.out.println("ProfileAjax.java exception: "+e.getMessage());
		}
	}

}
