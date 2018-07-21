package com.haphor.edit;

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

/**
 * Servlet implementation class changePic
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/changePic")
public class changePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePic() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Part filePart = request.getPart("userimg");
		String updateProfileQuery="update USER set userimg=? where userid=?";


		UserDAO ud = new UserDAOImpl();
		User u = new User();
		 InputStream inputStream = null; // input stream of the upload file
	        // obtains the upload file part in this multipart request
		 
		 if (filePart != null) {
	            inputStream = filePart.getInputStream();
	     }
		 if (inputStream != null) {
             //files are treated as BLOB objects in database
             //here we're letting the JDBC driver
             //create a blob object based on the
             //input stream that contains the data of the file
		 u.setImage(inputStream);
		 u.setUserid(Integer.parseInt(request.getSession().getAttribute("LogId").toString()));
		 ud.changePic(u, updateProfileQuery);
		 response.sendRedirect(request.getContextPath()+"/viewProfile");
		 }
	}
}
