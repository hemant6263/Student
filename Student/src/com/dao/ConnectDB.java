package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	private static Connection con;

	public static Connection connect() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
		}catch(ClassNotFoundException | SQLException s){
			System.out.println(s.getMessage());
		}
		return con;
	}
}
