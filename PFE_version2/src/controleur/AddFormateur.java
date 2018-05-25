package controleur;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Formateur;
import dao.FormateurDB;


public class AddFormateur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom= request.getParameter("nom");
		String prenom= request.getParameter("prenom");
		String telephone= request.getParameter("telephone");
		String email= request.getParameter("email");
		String specialite= request.getParameter("specialite");
		String date_naissanceS= request.getParameter("date_naissance");
		String genre= request.getParameter("genre");
		
		try {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date_naissance= format.parse(date_naissanceS);
			Formateur f=new Formateur();
			f.setNom(nom);
			f.setPrenom(prenom);
			f.setTelephone(telephone);
			f.setEmail(email);
			f.setSpecialite(specialite);
			f.setGenre(genre);
			f.setDate_naissance(date_naissance);
			if(FormateurDB.add(f)>0) {
					response.sendRedirect("formateurs.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
