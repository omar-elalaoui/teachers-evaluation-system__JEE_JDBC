package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.Formateur;
import beans.Formation;
import beans.Module;

public class ModuleDB {
	
	public static int add(Module m) {
		int status=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into modules(module, formation_id) values(?,?)");
			ps.setString(1, m.getModule());
			ps.setInt(2, m.getFormation().getId());
			status= ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ModuleDB-->add() "+e.getMessage());
		}
		return status;
	}
	
	public static int update(int f_id, Module m) {
		int status=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("update modules set module=? where formation_id=?");
			ps.setString(1, m.getModule());
			ps.setInt(2, f_id);
			status= ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ModuleDB-->update() "+e.getMessage());
		}
		return status;
	}
	
	public static Module get(int _id) {
		Module m= new Module();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from modules where id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			m.setId(_id);
			m.setModule(rs.getString("module"));
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ModuleDB-->get(): "+e.getMessage());
		}
		return m;
	}
	
	public static Formation getFormation(int _id){
		Formation formation= new Formation();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from modules where id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			formation= FormationDB.get(rs.getInt("formation_id"));
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return formation;
	}
	
	public static Formateur getFormateur(int _id){
		Formateur formateur= new Formateur();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from modules where id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			formateur= FormateurDB.get(rs.getInt("formateur_id"));
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return formateur;
	}
	
	public static List<Module> ModulesNoDisponible(){
		List<Module> modulesList= new ArrayList<Module>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from modules where formateur_id IS NOT NULL");
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				modulesList.add(ModuleDB.get(rs.getInt("id")));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(" ModulesNoDisponible(): "+e.getMessage());
		}
		return modulesList;
	}
	
	public static int getCount() {
		Connection con=null;
		int nbr=0;
		try {
			con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from modules");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				nbr= rs.getInt("nbr");
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("FormeDB-->getCount(): "+e.getMessage());
		}
		return nbr;
	}
	
}
