package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.EmailBean;
import dao.UserDB;
import helpers.PwdHelper;

@WebServlet("/ModifierCompte")
public class ModifierCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String compteType= request.getParameter("compteType");
				String email= request.getParameter("email");
				String ppwd= PwdHelper.encrypt(request.getParameter("ppwd"));
				String npwd= PwdHelper.encrypt(request.getParameter("pwd1"));
				EmailBean emailSender= new EmailBean();
				try {
					if(compteType.equals("admin")) {
							
							if(UserDB.checkAdminPwd(ppwd)) {
								UserDB.updatePwd(1, npwd);
								request.setAttribute("messageSS", true);
								emailSender.send("omar_elalaoui@yahoo.com", "mot de passe modifié", "le mote de passe changé");
								this.getServletContext().getRequestDispatcher("/modifierPwdAdmin.jsp").forward(request, response);
							}else {
								request.setAttribute("messageErr", true);
								this.getServletContext().getRequestDispatcher("/modifierPwdAdmin.jsp").forward(request, response);
							}
							
						
					}else if(compteType.equals("assistant")){
						
						if(UserDB.checkAdminEmail(email)) {
							request.setAttribute("messageErr2", true);
							this.getServletContext().getRequestDispatcher("/modifierPwdAdmin.jsp").forward(request, response);
						}else {
							if(UserDB.checkAsstPwd(ppwd)) {
								UserDB.updatePwd(2, npwd);
								request.setAttribute("messageSS", true);
								emailSender.send("omar_elalaoui@yahoo.com", "mot de passe modifié", "le mote de passe changé");
								this.getServletContext().getRequestDispatcher("/modifierPwdAsst.jsp").forward(request, response);
							}else {
								request.setAttribute("messageErr", true);
								this.getServletContext().getRequestDispatcher("/modifierPwdAsst.jsp").forward(request, response);
							}
						}
						
						
					}
					
				} catch (Exception e) {
					System.out.println("ModifierCompte"+e.getMessage());;
				}
	}

}
