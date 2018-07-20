package com.haphor.post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haphor.postDB.Post;
import com.haphor.postDB.PostDAO;
import com.haphor.postDB.PostDAOImpl;

/**
 * Servlet implementation class Posting
 */
@WebServlet("/posting")
public class Posting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Posting() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String mypost = request.getParameter("mypost");
		
		
		String date= new java.util.Date().toString();
		String query = "INSERT INTO POST (`userid`, `content`,`postdate`) VALUES (?,?, ?)";
		
		PostDAO pd = new PostDAOImpl();
		Post p = new Post();
		
		p.setUserid(Integer.parseInt(request.getSession().getAttribute("LogId").toString()));
		p.setContent(mypost);
		p.setDate(date);
		request.getSession().removeAttribute("allpost");
		pd.insertPost(p, query);
		
		
		response.sendRedirect(request.getContextPath()+"/getPost");
		
		
	/*PrintWriter out = response.getWriter();
		
		out.print(date);*/
		
	}

}
