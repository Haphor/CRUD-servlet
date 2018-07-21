package com.haphor.profile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haphor.userDB.User;
import com.haphor.userDB.UserDAO;
import com.haphor.userDB.UserDAOImpl;

/**
 * Servlet implementation class ViewProfile
 */
@WebServlet("/viewProfile")
public class ViewProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("LogId")!=null)
		{
			List<GetUsers> user = new ArrayList<GetUsers>();
			
			UserDAO ud = new UserDAOImpl();
			int id = Integer.parseInt(request.getSession().getAttribute("LogId")+"");
			User u = ud.viewUser(id, "select * from USER where userid=?");
			
			user.add(new GetUsers(u.getUserid(), u.getUsername(),u.getFirstname(), u.getLastname(), u.getEmailaddress(), u.getPassword(), u.getCountry(), u.getGender(), u.getAge()));
			
			request.setAttribute("curUser", user);
			
			request.getRequestDispatcher("pages/profile.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath());
		}
		
		
		
	}

}
