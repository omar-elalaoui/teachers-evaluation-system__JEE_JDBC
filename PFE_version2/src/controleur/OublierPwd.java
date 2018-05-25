package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.EmailBean;
import dao.UserDB;
import helpers.Functions;
import helpers.PwdHelper;

/**
 * Servlet implementation class OublierPwd
 */
@WebServlet("/OublierPwd")
public class OublierPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String compteType= request.getParameter("compteType");
		String email= request.getParameter("email");
		
		String nouveauPwd= Functions.generateRandomString("AzErTyUiOpQsDfGhJkLmWxCvBn", 17);
		String nouveauPwdEncrypted= PwdHelper.encrypt(nouveauPwd);
		EmailBean emailSender= new EmailBean();
		try {
			if(compteType.equals("admin")) {
				if(UserDB.checkAdminEmail(email)) {
					UserDB.updatePwd(1, nouveauPwdEncrypted);
					emailSender.send(email, "oublier mot de passe", "Voila votre nouveau mot de passe:\n\nnouveau mot de passe: "+nouveauPwd+"\n\nCliquer sur ce lien pour réinitialiser votre mot de passe:\n\n"+
					"http://localhost:8081/PFE_version2/modifierPwdAdmin.jsp");
					request.setAttribute("messageSS", true);
					this.getServletContext().getRequestDispatcher("/oublierPwdAdmin.jsp").forward(request, response);
				}else {
					request.setAttribute("messageErr", true);
					this.getServletContext().getRequestDispatcher("/oublierPwdAdmin.jsp").forward(request, response);
				}
			}else if(compteType.equals("assistant")){
				if(UserDB.checkAsstEmail(email)) {
					UserDB.updatePwd(2, nouveauPwdEncrypted);
					emailSender.send(email, "oublier mot de passe", "Voila votre nouveau mot de passe:\nnouveau mot de passe: "+nouveauPwd+"\nCliquer sur ce lien pour réinitialiser votre mot de passe:"+
					"http://localhost:8081/PFE_version2/modifierPwdAsst.jsp");
					request.setAttribute("messageSS", true);
					this.getServletContext().getRequestDispatcher("/oublierPwdAsst.jsp").forward(request, response);
				}else {
					request.setAttribute("messageErr", true);
					this.getServletContext().getRequestDispatcher("/oublierPwdAsst.jsp").forward(request, response);
				}
			}
			
		} catch (Exception e) {
			System.out.println("ModifierCompte"+e.getMessage());;
		}

	}

}
