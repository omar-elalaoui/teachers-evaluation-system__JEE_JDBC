package dao;


import java.sql.*;

public class ConnectionDB {
	public static Connection getConnection() {
		Connection con=null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");  
		     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pfe_2018","root","");  
		}catch(Exception e) {System.out.println("13"+e.getMessage());}
		return con;
	}
}
