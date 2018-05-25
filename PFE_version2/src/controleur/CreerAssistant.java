package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import beans.EmailBean;
import dao.AssistantDB;
import helpers.PwdHelper;


public class CreerAssistant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email= request.getParameter("email");
			String pwd= request.getParameter("pwd1");
			String pwdEncrypted= PwdHelper.encrypt(pwd);
			User assistant= new User();
			assistant.setuserEmail(email);
			assistant.setPwd(pwdEncrypted);
			if(AssistantDB.add(assistant)) {
				response.sendRedirect("assistant.jsp");
				EmailBean emailObj= new EmailBean();
				emailObj.send(email, "Assisatnt mot de passe", "voilà les paramètres pour accéder à l'application:\n\nIdentifiant: "+email+"\n"+"Mot de passe: "+pwd);
				HttpSession session= request.getSession();
				session.setAttribute("pwdSent", true);
 			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
