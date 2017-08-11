package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bean.Student;

public class StudentDAO {
	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	List<Student> li = new ArrayList<Student>();

	public StudentDAO() {
		con = ConnectDB.connect();
	}

	public static Student getRecordById(int id) {
		Student u = null;
		try {
			Connection con = ConnectDB.connect();
			PreparedStatement ps = con.prepareStatement("select * from student where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new Student();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setAddress(rs.getString("address"));
				u.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}

	public void add(Student s) {
		String sql = "insert into student values(?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, s.getId());
			ps.setString(2, s.getName());
			ps.setString(3, s.getAddress());
			ps.setString(4, s.getPhone());
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<Student> getAll() {
		String sql = "select * from Student";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while (rs.next()) {
				Student u = new Student();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setAddress(rs.getString("address"));
				u.setPhone(rs.getString("phone"));
				li.add(u);
			}
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}

		return li;
	}

	public void update(Student u) {
		try {
			ps = con.prepareStatement("update student set name=?,address=?,phone=? where id=?");
			ps.setString(1, u.getName());
			ps.setString(2, u.getAddress());
			ps.setString(3, u.getPhone());
			ps.setInt(4, u.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void delete(Student u) {
		try {
			ps = con.prepareStatement("delete from student where id=?");
			ps.setInt(1, u.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
