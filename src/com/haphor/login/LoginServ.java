package com.haphor.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.haphor.userDB.User;
import com.haphor.userDB.UserDAO;
import com.haphor.userDB.UserDAOImpl;

@WebServlet("/login")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServ() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("psw");
		String query = "select * from USER where username=? and password=?";
		
		UserDAO ud = new UserDAOImpl();
		User u = ud.getUser(uname, pass, query);

		if(u!=null && u.getFirstname()!=null) 
		{
			HttpSession session = request.getSession();
			int uu= u.getUserid();
			session.setAttribute("LogId", uu);
			session.setAttribute("LogUser", uname);
			session.setAttribute("LogPass", pass);
			response.sendRedirect(request.getContextPath()+"/getPost");
		}
		else
		{
			//request.setAttribute("errormessage", "User name or Password do not match!");
			request.getSession().setAttribute("errormessage", "User name or Password do not match!");
			response.sendRedirect(request.getContextPath());
		}
		
	}

}
