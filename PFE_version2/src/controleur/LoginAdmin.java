package controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import dao.UserDB;
import helpers.PwdHelper;


public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail= request.getParameter("userEmail");
		String pwd= request.getParameter("pwd");
		User u= new User();
		u.setuserEmail(userEmail);
		u.setPwd(PwdHelper.encrypt(pwd));
		if(UserDB.checkUserAdmin(u)) {
			HttpSession session= request.getSession();
			session.setAttribute("loginAdmin", true);
			response.sendRedirect("accueil.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
