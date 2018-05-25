package controleur.Ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import beans.Formation;
import beans.Module;
import dao.FormationDB;
import dao.ModuleDB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class ModulesFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] selectedFormations= request.getParameterValues("formation_id[]");
		List<Formation> formationList= new ArrayList<Formation>();
		for(String s: selectedFormations) {
			int i=Integer.parseInt(s);
			Formation f= FormationDB.get(i);
			f.setModules(FormationDB.getModules(i));
			formationList.add(f);
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			String json1= new Gson().toJson(formationList);
			List<Module> ModulesNoDispoList= ModuleDB.ModulesNoDisponible();
			String json2= new Gson().toJson(ModulesNoDispoList);
			String json= "["+json1+","+json2+"]";
			response.getWriter().write(json);
		} catch (Exception e) {
			System.out.println("¨Gson exeption:  "+e.getMessage());
		}
	}

}
