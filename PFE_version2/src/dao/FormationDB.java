package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.*;
import beans.Module;

public class FormationDB {
	
		public static int add(Formation f) {
			int status=0;
			try {
				Connection con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("insert into formations(formation, duree, date_debut, date_fin) values(?,?,?,?)");
				ps.setString(1, f.getFormation());
				ps.setInt(2, f.getDuree());
				ps.setDate(3, new Date(f.getDate_debut().getTime()));
				ps.setDate(4, new Date(f.getDate_fin().getTime()));
				status= ps.executeUpdate();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println("FormationDB-->add(): "+e.getMessage());
			}
			return status;
		}
		
		public static int update(Formation f) {
			int status=0;
				try {
					Connection con= ConnectionDB.getConnection();
					PreparedStatement ps= con.prepareStatement("update formations set duree=?, date_debut=?, date_fin=? where id=?");
					ps.setInt(1, f.getDuree());
					ps.setDate(2, new Date(f.getDate_debut().getTime()));
					ps.setDate(3, new Date(f.getDate_fin().getTime()));
					ps.setInt(4, f.getId());
					status= ps.executeUpdate();
					ps.close();
					con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			return status;
		}
		
		public static List<Formateur> getFormateurs(int _id){
			List<Formateur> formateurList= new ArrayList<Formateur>();
			try {
				Connection con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("select distinct formateur_id from modules where formation_id=? and formateur_id is not null");
				ps.setInt(1, _id);
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					formateurList.add(FormateurDB.get(rs.getInt("formateur_id")));
				}
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return formateurList;
		}
	
		public static List<Forme> getFormes(int _id){
			List<Forme> formeList= new ArrayList<Forme>();
			try {
				Connection con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("select * from formation_forme where formation_id=?");
				ps.setInt(1, _id);
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					formeList.add(FormeDB.get(rs.getInt("forme_id")));
				}
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return formeList;
		}
		
		public static List<Forme> getFormes(int[] formationsId){
			List<Forme> formesList= new ArrayList<Forme>();
				for(int i: formationsId) {
					   List<Forme> formesListTemp= getFormes(i);
						boolean exist=false;
						for(Forme ff: formesListTemp) {
							for(Forme fff: formesList) {
								if(ff.getId() == fff.getId()) {
									exist= true;
								}
							}
							if(!exist) { formesList.add(ff); }
						}
						
				}	
			return formesList;
		}
		
		public static List<Module> getModules(int _id){
			List<Module> moduleList= new ArrayList<Module>();
			try {
				Connection con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("select * from modules where formation_id=?");
				ps.setInt(1, _id);
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					moduleList.add(ModuleDB.get(rs.getInt("id")));
				}
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return moduleList;
		}
		
		public static Formation get(int _id){
			Connection con=null;
			Formation f= new Formation();
			try {
				con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("select * from formations where id=?");
				ps.setInt(1, _id);
				ResultSet rs= ps.executeQuery();
				rs.next();
				f.setId(_id);
				f.setFormation(rs.getString("formation"));
				f.setDuree(rs.getInt("duree"));
				f.setDate_debut(rs.getDate("date_debut"));
				f.setDate_fin(rs.getDate("date_fin"));
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println("FormationDB-->get(): "+e.getMessage());
			}
			return f;
		}
		
		public static Formation getLast() {
			Formation f= new Formation();
			try {
				Connection con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("SELECT * FROM formations WHERE id=(SELECT MAX(id) FROM formations)");
				ResultSet rs= ps.executeQuery();
				rs.next();
				f= get(rs.getInt("id"));
				rs.close();
				ps.close();
				con.close();
				return f;
			} catch (Exception e) {
				System.out.println("FormationDB-->getLast(): "+e.getMessage());
			}
			return null;
		}
		
		public static List<Formation> getAll(){
			List<Formation> formationList= new ArrayList<Formation>();
			try {
				Connection con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("select * from formations");
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					Formation f= get(rs.getInt("id"));
					f.setFormateurs(getFormateurs(rs.getInt("id")));
					f.setFormes(getFormes(rs.getInt("id")));
					formationList.add(f);
				}
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println("FormationDB-->getAll() "+e.getMessage());
			}
			return formationList;
		}

		public static int getCount() {
			Connection con=null;
			int nbr=0;
			try {
				con= ConnectionDB.getConnection();
				PreparedStatement ps= con.prepareStatement("select count(*) as nbr from formations");
				ResultSet rs= ps.executeQuery();
				if(rs.next()) {
					nbr= rs.getInt("nbr");
				}
				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println("FormationDB-->getCount(): "+e.getMessage());
			}
			return nbr;
		}
}
