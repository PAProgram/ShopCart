package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int uId;
	@Column(name="user_name")
	String uName;
	@Column(name="user_email")
	String uMail;
	@Column(name="user_phone")
	String uPhone;
	@Column(name="user_password")
	String uPass;
	@Column(name="user_pic")
	String uPic;
	@Column(length = 1500)
	String uAddress;
	@Column(name = "user_type")
	String uType;
	
	public User(int uId, String uName, String uMail, String uPhone, String uPass, String uPic, String uAddress, String uType) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uMail = uMail;
		this.uPhone = uPhone;
		this.uPass = uPass;
		this.uPic = uPic;
		this.uAddress = uAddress;
		this.uType = uType;
	}

	public User(String uName, String uMail, String uPhone, String uPass, String uPic, String uAddress, String uType) {
		super();
		this.uName = uName;
		this.uMail = uMail;
		this.uPhone = uPhone;
		this.uPass = uPass;
		this.uPic = uPic;
		this.uAddress = uAddress;
		this.uType = uType;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuMail() {
		return uMail;
	}

	public void setuMail(String uMail) {
		this.uMail = uMail;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuPass() {
		return uPass;
	}

	public void setuPass(String uPass) {
		this.uPass = uPass;
	}

	public String getuPic() {
		return uPic;
	}

	public void setuPic(String uPic) {
		this.uPic = uPic;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public String getuType() {
		return uType;
	}

	public void setuType(String uType) {
		this.uType = uType;
	}

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uName=" + uName + ", uMail=" + uMail + ", uPhone=" + uPhone + ", uPass=" + uPass
				+ ", uPic=" + uPic + ", uAddress=" + uAddress + "]";
	}
	
	
	

}
