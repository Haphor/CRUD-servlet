package com.haphor.userDB;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class displayImage
 */
@WebServlet("/displayImage")
public class displayImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		com.haphor.userDB.UserDAO ud = new com.haphor.userDB.UserDAOImpl();
		int id = Integer.parseInt(request.getSession().getAttribute("LogId")+"");
		com.haphor.userDB.User u = ud.viewUser(id, "select * from USER where userid=?");
		
		response.setContentType("image/png");
		response.setContentLength(u.getImage2().length);
		OutputStream os = response.getOutputStream();
		os.write(u.getImage2());
		os.flush();
		os.close();
		
	}

	
}
