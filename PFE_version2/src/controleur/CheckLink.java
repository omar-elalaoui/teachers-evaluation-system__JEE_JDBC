package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FormeDB;


public class CheckLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameterMap().containsKey("id") && request.getParameterMap().containsKey("hash")) {
			int forme_id= Integer.parseInt(request.getParameter("id"));
			int hash= Integer.parseInt(request.getParameter("hash"));
			int module_id= Integer.parseInt(request.getParameter("m_id"));
			 if(FormeDB.verifyHash(forme_id, hash)) {
					HttpSession session= request.getSession();
					session.setAttribute("formulaire_hash", hash);
					request.setAttribute("module_id", module_id);
					this.getServletContext().getRequestDispatcher("/WEB-INF/formulaire.jsp").forward(request, response);
				}else {
					response.sendRedirect("lienInvalideMessage.jsp");
				}
		}
			
	}


}
