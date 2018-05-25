package dao;


import java.sql.*;


import beans.User;
public class UserDB {
	public static boolean checkUserAssistant(User u) {
		boolean status= false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where userEmail=? and pwd=? and id>1");
			ps.setString(1, u.getuserEmail());
			ps.setString(2, u.getPwd());
			ResultSet rs= ps.executeQuery();
			status= rs.next();
			
		}catch(Exception e) {System.out.println("checkUser: "+e.getMessage());}
		return status;
	}
	
	public static boolean checkUserAdmin(User u) {
		boolean status= false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where userEmail=? and pwd=? and id=1");
			ps.setString(1, u.getuserEmail());
			ps.setString(2, u.getPwd());
			ResultSet rs= ps.executeQuery();
			status= rs.next();
			
		}catch(Exception e) {System.out.println("checkUser: "+e.getMessage());}
		return status;
	}
	
	public static boolean checkAdminPwd(String pwd) {
		boolean status= false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where id=1 and pwd=?");
			ps.setString(1, pwd);
			ResultSet rs= ps.executeQuery();
			status= rs.next();
			
		}catch(Exception e) {System.out.println("checkAdminPwd: "+e.getMessage());}
		return status;
	}
	
	public static boolean checkAsstPwd(String pwd) {
		boolean status= false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where id<> 1 and pwd=?");
			ps.setString(1, pwd);
			ResultSet rs= ps.executeQuery();
			status= rs.next();
			
		}catch(Exception e) {System.out.println("checkAsstPwd: "+e.getMessage());}
		return status;
	}
	
	public static boolean checkAsstEmail(String email) {
		boolean status= false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where id<> 1 and userEmail=?");
			ps.setString(1, email);
			ResultSet rs= ps.executeQuery();
			status= rs.next();
			
		}catch(Exception e) {System.out.println("checkAsstEmail: "+e.getMessage());}
		return status;
	}
	
	public static boolean checkAdminEmail(String email) {
		boolean status= false;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from users where id= 1 and userEmail=?");
			ps.setString(1, email);
			ResultSet rs= ps.executeQuery();
			status= rs.next();
			
		}catch(Exception e) {System.out.println("checkAdminEmail: "+e.getMessage());}
		return status;
	}
	
	public static void updatePwd(int type, String pwd) {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps;
			if(type == 1) {
				ps= con.prepareStatement("update users set pwd=? where id=1");
			}else {
				ps= con.prepareStatement("update users set pwd=? where id<> 1");
			}
			ps.setString(1, pwd);
			ps.executeUpdate();
		}catch(Exception e) {System.out.println("checkAsstPwd: "+e.getMessage());}
	}
}
