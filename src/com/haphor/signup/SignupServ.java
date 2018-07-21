package com.haphor.signup;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.haphor.userDB.User;
import com.haphor.userDB.UserDAO;
import com.haphor.userDB.UserDAOImpl;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/signup")
public class SignupServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pass1 = request.getParameter("psw1");
		String pass2= request.getParameter("psw2");
		String country = request.getParameter("country");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		
		String userExistQuery="select * from USER where username=?";
		String insertQuery="INSERT INTO USER (`username`, `firstname`,`lastname`,`emailaddress`, `password`,`country`,`gender`,`age`,`userimg` ) VALUES (?,?,?, ?,?, ?,?,?,?)";
		
		UserDAO ud = new UserDAOImpl();
		User u = new User();
		
		InputStream inputStream = null; // input stream of the upload file
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("userimg");
		
		if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
		
		if(ud.checkExist(uname, userExistQuery))
		{
			request.getSession().setAttribute("errormessage", "User name already exist!");
			response.sendRedirect(request.getContextPath());
		}
		else
		{
			if(pass1.equals(pass2))
			{
				u.setUsername(uname);
				u.setFirstname(fname);
				u.setLastname(lname);
				u.setEmailaddress(email);
				u.setPassword(pass1);
				u.setCountry(country);
				u.setGender(gender);
				u.setAge(age);
				if (inputStream != null) {
	                //files are treated as BLOB objects in database
	                //here we're letting the JDBC driver
	                //create a blob object based on the
	                //input stream that contains the data of the file
	                u.setImage(inputStream);
	            }
				ud.insertUser(u, insertQuery);
				response.sendRedirect(request.getContextPath());
			}
			else
			{
				request.getSession().setAttribute("errormessage", "Passwords do not match!");
				response.sendRedirect(request.getContextPath());
			}
		}
		
		
		
	}

}
