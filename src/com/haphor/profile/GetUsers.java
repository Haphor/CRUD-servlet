package com.haphor.profile;

public class GetUsers {

	
	private int userid;
	private String username;
	private String firstname;
	private String lastname;
	private String emailaddress;
	private String password;
	private String country;
	private String gender;
	private String age;
	
	
	public GetUsers(int userid, String username, String firstname, String lastname, String emailaddress,
			String password, String country, String gender, String age) {
		super();
		this.userid = userid;
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.emailaddress = emailaddress;
		this.password = password;
		this.country = country;
		this.gender = gender;
		this.age = age;
	}
	
	
	@Override
	public String toString() {
		return String.format(
				"GetUsers [userid=%s, username=%s, firstname=%s, lastname=%s, emailaddress=%s, password=%s, country=%s, gender=%s, age=%s]",
				userid, username, firstname, lastname, emailaddress, password, country, gender, age);
	}


	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmailaddress() {
		return emailaddress;
	}
	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	
	
	
}
