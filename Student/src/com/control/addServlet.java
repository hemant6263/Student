package com.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student;
import com.dao.StudentDAO;

/**
 * Servlet implementation class addServlet
 */
@WebServlet("/addServ")
public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name= request.getParameter("name");
		String address= request.getParameter("addr");
		String phone = request.getParameter("phone");
		Student s = new Student(id, name, address, phone);
		StudentDAO sa = new StudentDAO();
		sa.add(s);
		RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
		rd.forward(request, response);
		
		
	}


}
