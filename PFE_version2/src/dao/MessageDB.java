package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MessageDB {
	public static void add(String m) {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into messages(message, state) values(?,?)");
			ps.setString(1, m);
			ps.setString(2, "new");
			ps.executeUpdate();
			
		} catch (Exception e) { System.out.println("MessageDao-->add() "+e.getMessage()); }
	}
	
	public static int count() {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from messages");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) return (int) rs.getLong("nbr");
			
		} catch (Exception e) { System.out.println("MessageDao-->Count() "+e.getMessage()); }
		
		return 0;
	}
	
	public static List<String> getAll(){
		List<String> messages= new ArrayList<String>();
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select * from messages");
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				messages.add(rs.getString("message"));
			}
			
		} catch (Exception e) { System.out.println("MessageDao-->add() "+e.getMessage()); }
		return messages;
	}

	public static void allOld() {
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("update messages set state='old'");
			ps.executeUpdate();
			
		} catch (Exception e) { System.out.println("MessageDao--> allOld() "+e.getMessage()); }
	}
	
	public static int newCount() {
		int count=0;
		try {
			Connection con= ConnectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("select count(*) as nbr from messages where state='new'");
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				count= rs.getInt("nbr");
			}
		} catch (Exception e) { System.out.println("MessageDao-->add() "+e.getMessage()); }
		return count;
	}
}
