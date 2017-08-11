package com.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.dao.UserDAO;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/signup")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("uname");
		String password = request.getParameter("pw");
		String password2 = request.getParameter("pw2");
		boolean v= password.equals(password2);
	
		User u = new User(username, password);
		UserDAO ud = new UserDAO();
		boolean b = ud.userCheck(u);
		if(username==null & password == null & password2 == null ){
			String message = "All Fields Are Required";
			HttpSession hs = request.getSession();
			hs.setAttribute("message", message);
			hs.setAttribute("user", u.getUserName());
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		if(v!=true){
			String message = "password not matched";
			HttpSession hs = request.getSession();
			hs.setAttribute("message", message);
			hs.setAttribute("user", u.getUserName());
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}else {
		if(b!=true){
			ud.addUser(u);
			String message = "Please Login";
			request.getSession().setAttribute("message", message);

			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else{
			String message = "Please Check The Details";
			request.getSession().setAttribute("message", message);
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}

	}

}
