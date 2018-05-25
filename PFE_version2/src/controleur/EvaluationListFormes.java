package controleur;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FormationDB;
import beans.Forme;

public class EvaluationListFormes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String[] formationsS= request.getParameterValues("formation_id");
			String[] modulesS= request.getParameterValues("module_id");
			int[] formations= Arrays.asList(formationsS).stream().mapToInt(Integer::parseInt).toArray();
			
			if(formations != null) {
				List<Forme> formeList= FormationDB.getFormes(formations);
				request.setAttribute("formeList", formeList);
				request.setAttribute("modulesList", modulesS);
			}
			this.getServletContext().getRequestDispatcher("/evaluation.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
	}

}
