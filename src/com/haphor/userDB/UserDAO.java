package com.haphor.userDB;



public interface UserDAO {

	
	public int insertUser(User u, String query);
	public User getUser(String username, String password, String query);
	public boolean checkExist(String username, String query);
	public User viewUser(int userid, String query);
	public void updatePass(int userid, String password, String query);
	public int updateProfile(User u, String query);
	public String selectFull(int userid, String query);
	
	public int changePic(User u, String query);
}
