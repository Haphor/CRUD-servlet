package com.haphor.postDB;

public interface PostDAO {

	public int insertPost(Post p, String query);
	public Post viewPost(int userid, String query);
	public int postCount(String query);
	public int deletePost(int postid, String query);
	
}
