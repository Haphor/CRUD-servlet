package com.haphor.postDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.haphor.connect.MyConnection;

public class PostDAOImpl implements PostDAO {

	static Connection con;
	static PreparedStatement st;
	@Override
	public int insertPost(Post p, String query) {
		int status=0;
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
            st.setInt(1, p.getUserid());
            st.setString(2, p.getContent());
            st.setString(3, p.getDate());
            status=st.executeUpdate();
			con.close();
		}catch(Exception e) {
			System.out.println(e);
			
		}
		
		
		return status;
	}
	@Override
	public Post viewPost(int userid, String query) {
		Post p = new Post();
		try {
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, userid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				p.setPostid(rs.getInt("postid"));
				p.setUserid(rs.getInt("userid"));
				p.setUserid(rs.getInt("userid"));
				p.setContent(rs.getString("content"));
                p.setDate(rs.getString("postdate"));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return p;
	}
	@Override
	public int postCount(String query) {
		int status=0;
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
            ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				status=rs.getInt("count(*)");
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
			
		}
		return status;
	}
	@Override
	public int deletePost(int postid, String query) {
		int status=0;
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
            st.setInt(1, postid);
            status=st.executeUpdate();
			con.close();
		}catch(Exception e) {
			System.out.println(e);
			
		}
		return status;
	}

}
