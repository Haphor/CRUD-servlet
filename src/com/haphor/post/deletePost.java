package com.haphor.post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haphor.postDB.PostDAO;
import com.haphor.postDB.PostDAOImpl;

/**
 * Servlet implementation class deletePost
 */
@WebServlet("/deletePost")
public class deletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deletePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int curpost = Integer.parseInt(request.getParameter("curpost"));
		
		String query ="DELETE FROM POST WHERE postid=?";
		
		PostDAO pd = new PostDAOImpl();
		
		pd.deletePost(curpost, query);
		
		
		response.sendRedirect(request.getContextPath()+"/getPost");
	}

}
