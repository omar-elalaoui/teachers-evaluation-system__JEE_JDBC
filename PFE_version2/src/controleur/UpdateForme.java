package controleur;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import beans.Forme;
import dao.FormeDB;

public class UpdateForme extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id= Integer.parseInt(request.getParameter("id"));
			String nom= request.getParameter("nom");
			String prenom= request.getParameter("prenom");
			String telephone= request.getParameter("telephone");
			String email= request.getParameter("email");
			String date_naissanceS= request.getParameter("date_naissance");
			Date date= new SimpleDateFormat("yyyy-mm-dd").parse(date_naissanceS);
			String genre= request.getParameter("genre");
			String cin= request.getParameter("cin");
			Forme f= new Forme();
			f.setId(id);
			f.setPrenom(prenom);
			f.setNom(nom);
			f.setTelephone(telephone);
			f.setEmail(email);
			f.setDate_naissance(date);
			f.setGenre(genre);
			f.setCin(cin);
			FormeDB.update(f);
			response.sendRedirect("formes.jsp");
		} catch (Exception e) {
			System.out.println("UpdateForme exception: "+e.getMessage());
		}
		
	}


}
