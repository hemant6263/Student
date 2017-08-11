package com.bean;

public class User {
String userName,passworrd;

public User(String userName, String passworrd) {
	super();
	this.userName = userName;
	this.passworrd = passworrd;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getPassworrd() {
	return passworrd;
}

public void setPassworrd(String passworrd) {
	this.passworrd = passworrd;
}

public boolean checkPassword(String pw){
	 boolean t = passworrd.equals(pw);
	return t;
	
	
}

}
