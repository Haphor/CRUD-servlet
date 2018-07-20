package com.haphor.userDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.haphor.connect.MyConnection;

public class UserDAOImpl implements UserDAO{

	/**
	 * 
	 */
	static Connection con;
	static PreparedStatement st;
	
	@Override
	public int insertUser(User u, String query) {
		int status=0;
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
			st.setString(1, u.getUsername());
            st.setString(2, u.getFirstname());
            st.setString(3, u.getLastname());
            st.setString(4, u.getEmailaddress());
            st.setString(5, u.getPassword());
            st.setString(6, u.getCountry());
            st.setString(7, u.getGender());
            st.setString(8, u.getAge());
            st.setBlob(9, u.getImage());
            status=st.executeUpdate();
			con.close();
		}catch(Exception e) {
			System.out.println(e);
			
		}
		return status;
	}

	@Override
	public User getUser(String username, String password, String query) {
		
		User u = new User();
		
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
			st.setString(1, username);
            st.setString(2, password);
            
            ResultSet rs = st.executeQuery();
			if(rs.next()) {
				u.setUserid(rs.getInt("userid"));
				u.setUsername(rs.getString("username"));
				u.setFirstname(rs.getString("firstname"));
				u.setLastname(rs.getString("lastname"));
				u.setEmailaddress(rs.getString("emailaddress"));
				u.setPassword(rs.getString("password"));
				u.setCountry(rs.getString("country"));
				u.setGender(rs.getString("gender"));
				u.setAge(rs.getString("age"));
				
				return u;
				
			}
		}catch(Exception e) {
			System.out.println(e);
			
		}
		return null;
	}

	@Override
	public boolean checkExist(String username, String query) {
		
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return false;
	}

	@Override
	public User viewUser(int userid, String query){
		
		User u = new User();
		try {
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, userid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				
                  u.setUsername(rs.getString("username"));
                  u.setFirstname(rs.getString("firstname"));
                  u.setLastname(rs.getString("lastname"));
                  u.setEmailaddress(rs.getString("emailaddress"));
                  u.setPassword(rs.getString("password"));
                  u.setCountry(rs.getString("country"));
                  u.setGender(rs.getString("gender"));
                  u.setAge(rs.getString("age"));
                  u.setImage2(rs.getBytes(10));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return u;
	}

	@Override
	public void updatePass(int userid, String password, String query) {
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
			st.setString(1, password);
			st.setInt(2, userid);
			st.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

	@Override
	public int updateProfile(User u,  String query) {
		int status=0;
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
			st.setString(1, u.getUsername());
			st.setString(2, u.getFirstname());
			st.setString(3, u.getLastname());
			st.setString(4, u.getEmailaddress());
			st.setString(5, u.getCountry());
			st.setString(6, u.getGender());
			st.setString(7, u.getAge());
			st.setInt(8, u.getUserid());
			status=st.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return status;
		// TODO Auto-generated method stub
		
	}

	@Override
	public String selectFull(int userid, String query) {
		String fullname="";
		String fname="";
		String lname="";
		try {
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, userid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				fname = rs.getString("firstname");
				lname = rs.getString("lastname");
			}
			fullname = fname+" "+lname;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return fullname;
	}

	@Override
	public int changePic(User u, String query) {
		int status=0;
		try {
			con = MyConnection.getCon();
			st=con.prepareStatement(query);
			st.setBlob(1, u.getImage());
			st.setInt(2, u.getUserid());
			status=st.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return status;
		// TODO Auto-generated method stub
	}

}
