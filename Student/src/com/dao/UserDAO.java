package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.User;

public class UserDAO {
	Connection con;
	ResultSet rs;
	PreparedStatement ps;

	public UserDAO() {
		// TODO Auto-generated constructor stub
		con = ConnectDB.connect();
	}

	public boolean loginCheck(User u) {
		String sql = "select password from user where username = ? and password = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			ps.setString(2, u.getPassworrd());
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (rs.next())
				return  true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
	public int maxId(){
		String sql = "SELECT MAX(ID) AS LastID FROM student";
		int i=0;
		Statement st;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
			i = rs.getInt("LastID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return i;
	}

	public boolean userCheck(User u) {
		String sql = "select * from user where username = ? ";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (rs.next())
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public void addUser(User u){
		String sql = "insert into user values(?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			ps.setString(2, u.getPassworrd());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
