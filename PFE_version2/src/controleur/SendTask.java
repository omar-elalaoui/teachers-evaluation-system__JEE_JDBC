package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDB;

public class SendTask extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameterMap().containsKey("message")) {
			String message= request.getParameter("message");
			MessageDB.add(message);
			HttpSession session= request.getSession();
			session.setAttribute("messageSent", true);
			
		}
		response.sendRedirect("assistant.jsp");
	}

}
