package com.haphor.edit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haphor.userDB.User;
import com.haphor.userDB.UserDAO;
import com.haphor.userDB.UserDAOImpl;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		
		String oldpass = request.getParameter("oldpass");
		String editpass1 = request.getParameter("editpass1");
		String editpass2 = request.getParameter("editpass2");
		
		String submittype= request.getParameter("submit");
		
		String userExistQuery="select * from USER where username=?";
		String updatePassQuery="update USER set password=? where userid=?";
		String updateProfileQuery="update USER set username=?,firstname=?,lastname=?,emailaddress=?,country=?,gender=?,age=? where userid=?";

		UserDAO ud = new UserDAOImpl();
		User u = new User();
		
		
		if(submittype.equals("Edit Profile"))
		{
			if(ud.checkExist(uname, userExistQuery)) 
			{
				request.getSession().setAttribute("errormessage", "Username Already Exist");
				response.sendRedirect("viewProfile");
			}
			else
			{
				u.setUserid(Integer.parseInt(request.getSession().getAttribute("LogId").toString()));
				u.setUsername(uname);
				u.setFirstname(fname);
				u.setLastname(lname);
				u.setEmailaddress(email);
				u.setCountry(country);
				u.setGender(gender);
				u.setAge(age);
				ud.updateProfile(u, updateProfileQuery);
				response.sendRedirect("viewProfile");
			}
			
		}
		else if(submittype.equals("Edit Password"))
		{
			if(oldpass.equals(request.getSession().getAttribute("LogPass").toString()))
			{
				if(editpass1.equals(editpass2))
				{
					ud.updatePass(Integer.parseInt(request.getSession().getAttribute("LogId").toString()), editpass1, updatePassQuery);
					response.sendRedirect("viewProfile");
				}
				else
				{
					request.getSession().setAttribute("errormessage", "Passwords do not match");
					response.sendRedirect("viewProfile");
				}
			}
			else
			{
				request.getSession().setAttribute("errormessage", "Old Password do not match");
				response.sendRedirect("viewProfile");
			}
		}
	}

}
