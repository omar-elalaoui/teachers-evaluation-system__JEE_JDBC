package controleur;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.EmailBean;
import beans.Forme;
import beans.Module;
import dao.FormeDB;
import dao.ModuleDB;

public class MailSender extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		EmailBean email= new EmailBean();
		try {
			
				if(request.getParameterValues("forme_id") != null && request.getParameterValues("module_id") != null) {
					int[] formes_id= Arrays.asList(request.getParameterValues("forme_id")).stream().mapToInt(Integer::parseInt).toArray();
					int[] modules_id= Arrays.asList(request.getParameterValues("module_id")).stream().mapToInt(Integer::parseInt).toArray();
					
					for(int f_id: formes_id) {
						Forme f= FormeDB.get(f_id);
						FormeDB.deleteAllFormeHashes(f_id);
						List<Integer> ValideHash= FormeDB.generateValideHashes(f.getId(), modules_id.length);
						int i=0;
						String message="";
						for(int m_id: modules_id) {
							Module m= ModuleDB.get(m_id);
							message += "Clicker sur ce lien pour faire une evaluation sur le module "+m.getModule()+
											": \n http://localhost:8081/PFE_version2/CheckLink?id="
											+f.getId()+"&hash="+ValideHash.get(i)+"&m_id="+m.getId()+"\n\n\n";
							i++;
						}
						if(message != "") email.send(f.getEmail(), "Formulaire à remplir",message);
					}
					response.sendRedirect("evaluation.jsp");
					HttpSession session= request.getSession();
					session.setAttribute("emailSent", true);
				}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}


}
