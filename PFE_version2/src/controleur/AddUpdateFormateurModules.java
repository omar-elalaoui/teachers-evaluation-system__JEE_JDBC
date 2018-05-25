package controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FormateurDB;
import dao.ModuleDB;
import beans.Module;

public class AddUpdateFormateurModules extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Module> modulesList= new ArrayList<Module>();
		try {
				if(request.getParameterMap().containsKey("module")) {
					String[] modulesString= request.getParameterValues("module");
					for(String s: modulesString) {
						modulesList.add(ModuleDB.get(Integer.parseInt(s)));
					}
				}
				int id= Integer.parseInt(request.getParameter("id"));
				FormateurDB.affecterChangerModules(id, modulesList);
				response.sendRedirect("formateurs.jsp");
			} catch (Exception e) {
				System.out.println("AddUpFM"+e.getMessage());
			}			
	}

}
