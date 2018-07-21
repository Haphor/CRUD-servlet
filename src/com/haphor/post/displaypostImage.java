package com.haphor.post;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class displaypostImage
 */
@WebServlet("/displaypostImage")
public class displaypostImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public displaypostImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.haphor.userDB.UserDAO ud = new com.haphor.userDB.UserDAOImpl();
		int id = Integer.parseInt(request.getParameter("img"));
		com.haphor.userDB.User u = ud.viewUser(id, "select * from USER where userid=?");
		
		response.setContentType("image/png");
		response.setContentLength(u.getImage2().length);
		OutputStream os = response.getOutputStream();
		os.write(u.getImage2());
		os.flush();
		os.close();
	}

}
