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


public class AddForme extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom= request.getParameter("nom");
		String prenom= request.getParameter("prenom");
		String telephone= request.getParameter("telephone");
		String email= request.getParameter("email");
		String date_naissanceS= request.getParameter("date_naissance");
		String genre= request.getParameter("genre");
		String cin= request.getParameter("cin");
		try {
			Forme f=new Forme();
			f.setNom(nom);
			f.setPrenom(prenom);
			f.setTelephone(telephone);
			f.setEmail(email);
			Date date_naissance= new SimpleDateFormat("yyyy-mm-dd").parse(date_naissanceS);
			f.setDate_naissance(date_naissance);
			f.setGenre(genre);
			f.setCin(cin);
			if(FormeDB.add(f)>0) {
				response.sendRedirect("formes.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
