package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.*;
import beans.Module;
public class ResultatDB {
	
	public static int add(Resultat R) {
		int status=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("INSERT INTO resultat(q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,commentaire,formation_id,module_id)"+
	                								   "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
			ps.setString(1, R.getR1());
		    ps.setString(2, R.getR2());
		    ps.setString(3, R.getR3());
		    ps.setString(4, R.getR4());
		    ps.setString(5, R.getR5());
		    ps.setString(6, R.getR6());
		    ps.setString(7, R.getR7());
		    ps.setString(8, R.getR8());
		    ps.setString(9, R.getR9());
		    ps.setString(10, R.getR10());
		    ps.setString(11, R.getR11());
		    ps.setString(12, R.getR12());
		    ps.setString(13, R.getR13());
		    ps.setString(14, R.getR14());
		    ps.setString(15, R.getR15());
		    ps.setString(16, R.getR16());
		    ps.setString(17, R.getR17());
		    ps.setString(18, R.getR18());
		    ps.setString(19, R.getR19());
		    ps.setString(20, R.getR20());
		    ps.setString(21, R.getR21());
		    ps.setString(22, R.getR22());
		    ps.setString(23, R.getCommentaire());
		    ps.setInt(24, R.getFormation().getId());
		    ps.setInt(25, R.getModule().getId());
			status= ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {System.out.println("ResultatDB-->add() "+e.getMessage());}
		return status;
	}

	public static List<Formation> getFormation(){
		List<Formation> formationList= new ArrayList<Formation>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select distinct formation_id from resultat");
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				formationList.add(FormationDB.get(rs.getInt("formation_id")));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(" ResultatDB getFormation: "+e.getMessage());
		}
		return formationList;
	}
	
	public static List<Module> getModules(int f_id){
		List<Module> modulesList= new ArrayList<Module>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select distinct module_id from resultat where formation_id=?");
			ps.setInt(1, f_id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				modulesList.add(ModuleDB.get(rs.getInt("module_id")));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ResultatDB getModule: "+e.getMessage());
		}
		return modulesList;
	}
	
	public static int count(int m_id){
		int count=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from resultat where module_id=?");
			ps.setInt(1, m_id);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				count= (int) rs.getLong("nbr");
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ResultatDB getModule: "+e.getMessage());
		}
		return count;
	}
	
	public static int getNombre_Reponses(String q, String ch, int m_id) {
		int count=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from resultat where "+q+"=? and module_id=?");
			ps.setString(1, ch);
			ps.setInt(2, m_id);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				count= (int) rs.getLong("nbr");
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ResultatDB getNombre_Reponses: "+e.getMessage());
		}
		return count;
	}
	
	public static String[] getComms(int id){
		String[] comms= new String[3];
		int i=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select commentaire from resultat where module_id=?");
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				
				comms[i]= rs.getString("commentaire");
				i++;
			}
			
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("ResultatDB getComms: "+e.getMessage());
		}
		return comms;
	}
}
