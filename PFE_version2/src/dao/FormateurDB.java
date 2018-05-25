package dao;



import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import beans.Formateur;
import beans.Formation;
import beans.Module;

public class FormateurDB {
		
	
	public static int add(Formateur f) {
		int status=0;
		try {
			Connection con= ConnectionDB.getConnection();
			
			PreparedStatement ps= con.prepareStatement("insert into formateurs(nom, prenom, telephone, email, specialite, date_naissance, genre) values(?,?,?,?,?,?,?)");
			ps.setString(1,f.getNom());
			ps.setString(2,f.getPrenom());
			ps.setString(3,f.getTelephone());
			ps.setString(4,f.getEmail());
			ps.setString(5,f.getSpecialite());
			ps.setDate(6, new Date(f.getDate_naissance().getTime()));
			ps.setString(7,f.getGenre());
			status= ps.executeUpdate();
			ps.close();
			con.close();
			
		} catch (Exception e) {System.out.println("FormateurDao-->add() "+e.getMessage());}
		return status;
	}
	
	public static void update(Formateur f) {
		try {
			Connection con= ConnectionDB.getConnection();
			
			PreparedStatement ps= con.prepareStatement("update formateurs set nom=?, prenom=?, telephone=?, email=?, specialite=?, date_naissance=?, genre=? where id=?");
			ps.setString(1,f.getNom());
			ps.setString(2,f.getPrenom());
			ps.setString(3,f.getTelephone());
			ps.setString(4,f.getEmail());
			ps.setString(5,f.getSpecialite());
			ps.setDate(6, new Date(f.getDate_naissance().getTime()));
			ps.setString(7,f.getGenre());
			ps.setInt(8, f.getId());
			ps.executeUpdate();
			ps.close();
			con.close();
			
		} catch (Exception e) {System.out.println("FormateurDao-->update() "+e.getMessage());}
	}
	
	public static Formateur get(int _id) {
		Formateur f= new Formateur();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from formateurs where id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				f.setId(_id);
				f.setNom(rs.getString("nom"));
				f.setPrenom(rs.getString("prenom"));
				f.setEmail(rs.getString("email"));
				f.setTelephone(rs.getString("telephone"));
				f.setSpecialite(rs.getString("specialite"));
				f.setDate_naissance(rs.getDate("date_naissance"));
				f.setGenre(rs.getString("genre"));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("FormateurDao-->get() "+e.getMessage());
		}
		return f;
	}
	
	public static Map<Formation, Module[]> getModules(int _id) {
		Map<Formation, Module[]> modules= new HashMap<Formation, Module[]>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps1= con.prepareStatement("select distinct formation_id from modules where formateur_id=?");
			ps1.setInt(1, _id);
			ResultSet rs1= ps1.executeQuery();
			while(rs1.next()) {
				List<Module> modulesList= new ArrayList<Module>();
				PreparedStatement ps2= con.prepareStatement("select * from modules where formation_id=? and formateur_id=?");
				ps2.setInt(1, rs1.getInt("formation_id"));
				ps2.setInt(2, _id);
				ResultSet rs2= ps2.executeQuery();
				while(rs2.next()) {
					modulesList.add(ModuleDB.get(rs2.getInt("id")));
				}
				modules.put(FormationDB.get(rs1.getInt("formation_id")), modulesList.toArray(new Module[modulesList.size()]));
			}
			rs1.close();
			ps1.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println("getModules-->get() "+e.getMessage());
		}
		return modules;
	}
	
	public static List<Formation> getFormations(int _id){
		List<Formation> formationsList= new ArrayList<Formation>();	
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select DISTINCT formation_id from modules where formateur_id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				formationsList.add(FormationDB.get(rs.getInt("formation_id")));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("getFormations-->get() "+e.getMessage());
		}
		return formationsList;
	}
	
	public static void affecterChangerModules(int _id, List<Module> modules) {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps1= con.prepareStatement("update modules set formateur_id=null where formateur_id=?");
			ps1.setInt(1, _id);
			ps1.executeUpdate();
			if(!modules.isEmpty()) {
				PreparedStatement ps2= con.prepareStatement("update modules set formateur_id=? where id=?");
				ps2.setInt(1, _id);
				for(Module m: modules) {
					ps2.setInt(2, m.getId());
					ps2.executeUpdate();
				}
				ps2.setInt(1, _id);
			}
			ps1.close();
			con.close();
		} catch (Exception e) {
			System.out.println("affecterChangerModules-->getAll() "+e.getMessage());
		}
	}
	
	public static List<Formateur> getAll(){
		List<Formateur> FormateurList= new ArrayList<Formateur>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from formateurs");
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				Formateur f= get(rs.getInt("id"));
				Map<Formation, Module[]> modulesMap= getModules(rs.getInt("id"));
				f.setModules(modulesMap);
				FormateurList.add(f);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("FormateurDao-->getAll() "+e.getMessage());
		}
		return FormateurList;
	}
	
	public static Formateur getLast() {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM formateurs WHERE id=(SELECT MAX(id) FROM formateurs)");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				return get(rs.getInt("id"));
			}
		} catch (Exception e) {
			System.out.println("FormationDB-->getLast(): "+e.getMessage());
		}
		return null;
	}
	
	public static int getAge(Calendar Cal){
			Calendar today = Calendar.getInstance();
			int curYear = today.get(Calendar.YEAR);
			int CalYear = Cal.get(Calendar.YEAR);
			
			int age = curYear - CalYear;
			int curMonth = today.get(Calendar.MONTH);
			int CalMonth = Cal.get(Calendar.MONTH);
			
			if (CalMonth > curMonth) { 
				 age--;
			} else if (CalMonth == curMonth) { 
				int curDay = today.get(Calendar.DAY_OF_MONTH);
				int CalDay = Cal.get(Calendar.DAY_OF_MONTH);
				if (CalDay > curDay) { 
					age--;
				}
			}
			return age;
		}
	
	public static int getCount() {
		Connection con=null;
		int nbr=0;
		try {
			con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from formateurs");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				nbr= rs.getInt("nbr");
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("FormateurDB-->getCount(): "+e.getMessage());
		}
		return nbr;
	}
}
