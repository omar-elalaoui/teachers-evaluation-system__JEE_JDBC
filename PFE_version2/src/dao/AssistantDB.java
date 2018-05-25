package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.User;

public class AssistantDB {
	
	public static boolean add(User u) {
		try {
			delete();
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into users(userEmail, pwd) values(?,?)");
			ps.setString(1, u.getuserEmail());
			ps.setString(2, u.getPwd());
			if(ps.executeUpdate()>0) {
				ps.close();
				con.close();
				return true;
			}
			
		} catch (Exception e) {System.out.println("AssistantDao-->add() "+e.getMessage());
		}
		return false;
	}
	
	public static User get() {
		User u= new User();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where id <> 1");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				u.setuserEmail(rs.getString("userEmail"));
				u.setPwd(rs.getString("pwd"));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("AssistantDao-->get() "+e.getMessage());
		}
		return u;
	}
	
	public static void delete() {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("delete from users where id <> 1");
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println("AssistantDao-->delete() "+e.getMessage());
		}
	}
	
	public static boolean isCreated() {
		
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from users");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				if(rs.getLong("nbr") > 1) {
					ps.close();
					con.close();
					return true;
				}
			}
			
		} catch (Exception e) {System.out.println("AssistantDao-->add() "+e.getMessage());}
		
		return false;
	}
	
}
