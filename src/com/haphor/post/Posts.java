package com.haphor.post;

public class Posts {

	private int postid;
	private int userid;
	private String fullname;
	private String content;
	private String date;
	
	
	
	
	
	public Posts(int postid, int userid, String fullname, String content, String date) {
		super();
		this.postid = postid;
		this.userid = userid;
		this.fullname = fullname;
		this.content = content;
		this.date = date;
	}
	
	
	




	@Override
	public String toString() {
		return String.format("Posts [postid=%s, userid=%s, fullname=%s, content=%s, date=%s]", postid, userid, fullname,
				content, date);
	}







	public int getUserid() {
		return userid;
	}





	public void setUserid(int userid) {
		this.userid = userid;
	}





	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
