package dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;


import beans.Formation;
import beans.Forme;

public class FormeDB {
	
	public static int add(Forme f) {
		int status=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into forme(nom, prenom, telephone, email, date_naissance, genre, cin, formulaire_code) values(?,?,?,?,?,?,?,?)");
			ps.setString(1,f.getNom());
			ps.setString(2,f.getPrenom());
			ps.setString(3,f.getTelephone());
			ps.setString(4,f.getEmail());
			ps.setDate(5, new Date(f.getDate_naissance().getTime()));
			ps.setString(6, f.getGenre());
			ps.setString(7,f.getCin());
			ps.setInt(8, generateIntRange(1, 1000000000));
			status= ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {System.out.println("FormeDao-->add() "+e.getMessage());}
		return status;
	}
	
	public static void update(Forme f) {
		try {
			Connection con= ConnectionDB.getConnection();
			
			PreparedStatement ps= con.prepareStatement("update forme set nom=?, prenom=?, telephone=?, email=?, date_naissance=?, genre=?, cin=? where id=?");
			ps.setString(1,f.getNom());
			ps.setString(2,f.getPrenom());
			ps.setString(3,f.getTelephone());
			ps.setString(4,f.getEmail());
			ps.setDate(5, new Date(f.getDate_naissance().getTime()));
			ps.setString(6,f.getGenre());
			ps.setString(7, f.getCin());
			ps.setInt(8, f.getId());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {System.out.println("FormateurDao-->update() "+e.getMessage());}
	}
	
	public static void affecterChangerFormations(int _id, List<Formation> formations) {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps1= con.prepareStatement("delete from formation_forme where forme_id=?");
			ps1.setInt(1, _id);
			ps1.executeUpdate();
			if(!formations.isEmpty()) {
				PreparedStatement ps2= con.prepareStatement("insert into formation_forme(formation_id, forme_id) values(?,?)");
				ps2.setInt(2, _id);
				for(Formation f: formations) {
					ps2.setInt(1, f.getId());
					ps2.executeUpdate();
				}
			}
			con.close();
		} catch (Exception e) {
			System.out.println("affecterChangerFormations-->getAll() "+e.getMessage());
		}
	}
	
	public static Forme get(int _id) {
		Forme f= new Forme();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from forme where id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			f.setId(_id);
			f.setNom(rs.getString("nom"));
			f.setPrenom(rs.getString("prenom"));
			f.setEmail(rs.getString("email"));
			f.setTelephone(rs.getString("telephone"));
			f.setDate_naissance(rs.getDate("date_naissance"));
			f.setGenre(rs.getString("genre"));
			f.setCin(rs.getString("cin"));
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("forme get()"+e.getMessage());
		}
		return f;
	}
	
	public static List<Formation> getFormations(int _id){
		List<Formation> formationList= new ArrayList<Formation>();
		
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from formation_forme where forme_id=?");
			ps.setInt(1, _id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				formationList.add(FormationDB.get(rs.getInt("formation_id")));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("FormeDao-->getFormations(int _id) "+e.getMessage());
		}
		return formationList;
	}
	
	public static List<Forme> getAll(){
		List<Forme> formeList= new ArrayList<Forme>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from forme");
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				Forme f= new Forme();
				f.setId(rs.getInt("id"));
				f.setNom(rs.getString("nom"));
				f.setPrenom(rs.getString("prenom"));
				f.setTelephone(rs.getString("telephone"));
				f.setEmail(rs.getString("email"));
				List<Formation> formationList= getFormations(rs.getInt("id"));
				f.setFormationList(formationList);
				formeList.add(f);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("FormeDao-->getAll(int _id) "+e.getMessage());
		}
		return formeList;
	}
	
	/*public static int generateLinkCode() {
		int status = 0;
		int i;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps1= con.prepareStatement("select MAX(id) as MAXid from forme");
			ResultSet rsMAX= ps1.executeQuery();
			rsMAX.next();
			int max= rsMAX.getInt("MAXid");
			for(i=1; i< max+1; i++) {
				PreparedStatement ps= con.prepareStatement("update forme set formulaire_code=? where id=?");
				ps.setInt(1, generateIntRange(1, 1000000000));
				ps.setInt(2,i);
				status=ps.executeUpdate();
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return status;
	}*/
	
	public static List<Integer> generateValideHashes(int forme_id, int modules_nbr) {
		List<Integer> hashes= new ArrayList<Integer>();
		try {
			Connection con= ConnectionDB.getConnection();
			for(int i=0; i< modules_nbr; i++) {
				int hash= generateIntRange(1, 1000000000);
				hashes.add(hash);
				PreparedStatement ps= con.prepareStatement("insert into validehash (hash, forme_id) values(?,?)");
				ps.setInt(1, hash);
				ps.setInt(2, forme_id);
				ps.executeUpdate();
			}
			con.close();
		} catch (Exception e) {
			System.out.println("generateValideHashes"+e.getMessage());
		}
		return hashes;
	}
	
	public static boolean verifyHash(int id, int hash) {
		boolean status=false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from validehash where hash=? and forme_id=?");
			ps.setInt(1, hash);
			ps.setInt(2, id);
			ResultSet rs= ps.executeQuery();
			status=rs.next();
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("forme verifyHash()"+e.getMessage());
		}
		return status;
	}
	
	public static void deleteHash(int hash) {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("delete from validehash where hash=?");
			ps.setInt(1, hash);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("forme deleteHash()"+e.getMessage());
		}
	}
	
	public static void deleteAllFormeHashes(int forme_id) {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("delete from validehash where forme_id=?");
			ps.setInt(1, forme_id);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("forme deleteAllFormeHashes()"+e.getMessage());
		}
	}
	
	public static int generateIntRange(int min, int max) {
	    Random r = new Random();
	    return r.nextInt((max - min) + 1) + min;

	}
	
	public static Map<String, Integer> getEmailCodeMap() {
		Map<String, Integer> map= new HashMap<String, Integer>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from forme order by id");
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				map.put(rs.getString("email"), rs.getInt("formulaire_code"));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("forme getEmailCodeMap()"+e.getMessage());
		}
		return map;
	}
	
	public static Forme getLast() {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM forme WHERE id=(SELECT MAX(id) FROM forme)");
			ResultSet rs= ps.executeQuery();
			rs.next();
			return get(rs.getInt("id"));
		} catch (Exception e) {
			System.out.println("FormationDB-->getLast(): "+e.getMessage());
		}
		return null;
	}

	public static int getCount() {
		Connection con=null;
		int nbr=0;
		try {
			con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from forme");
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















