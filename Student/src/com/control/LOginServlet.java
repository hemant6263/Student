package com.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.SetAllPropertiesRule;

import com.bean.User;
import com.dao.UserDAO;

/**
 * Servlet implementation class LOginServlet
 */
@WebServlet("/login")
public class LOginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("pw");
		String password2 = request.getParameter("pw2");
	
		User u = new User(username, password);
		UserDAO ud = new UserDAO();
		boolean b = ud.loginCheck(u);
		int i = ud.maxId();
		int k = i+1;
		if(b==true){
			HttpSession hs = request.getSession();
			hs.setAttribute("id", k);
			hs.setAttribute("user", username);
			RequestDispatcher rd= request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}else{
			String message = "Please Check The Details";
			HttpSession hs = request.getSession();
			hs.setAttribute("message", message);
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}


}
