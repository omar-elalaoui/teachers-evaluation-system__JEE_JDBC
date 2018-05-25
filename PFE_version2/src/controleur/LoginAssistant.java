
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

public class LoginAssistant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail= request.getParameter("userEmail");
		String pwd= request.getParameter("pwd");
		System.out.println(userEmail);
		User u= new User();
		u.setuserEmail(userEmail);
		u.setPwd(PwdHelper.encrypt(pwd));
		if(UserDB.checkUserAssistant(u)) {
			HttpSession session= request.getSession();
			session.setAttribute("loginAssistant", true);
			response.sendRedirect("accueil.jsp");
		}else {
			response.sendRedirect("login.jsp");;
		}
	}

}
