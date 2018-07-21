package com.haphor.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haphor.postDB.Post;
import com.haphor.postDB.PostDAO;
import com.haphor.postDB.PostDAOImpl;
import com.haphor.userDB.UserDAO;
import com.haphor.userDB.UserDAOImpl;

/**
 * Servlet implementation class getPost
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("LogId")!=null)
		{
		List<Posts> post = new ArrayList<Posts>();
		
		PostDAO pd = new PostDAOImpl();
		UserDAO ud = new UserDAOImpl();
		
		int size = pd.postCount("select count(*) from POST");
		
		for(int i=1; i<=size; i++)
		{
			Post p = pd.viewPost(i, "select * from POST where postid=?");
			if(p.getPostid()!=0) {
				String fullname= ud.selectFull(p.getUserid(), "select firstname,lastname from user where userid=?");
				post.add(new Posts(i,p.getUserid(), fullname, p.getContent(), p.getDate()));
			}
			else
			{
				size++;
			}
		}
		
		
		request.setAttribute("allpost", post);
		request.getRequestDispatcher("pages/welcome.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath());
		}
		
	}

}
