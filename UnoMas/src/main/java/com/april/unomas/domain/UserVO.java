package com.april.unomas.domain;

import java.sql.Timestamp;

public class UserVO {

	private int user_num;
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_birth;
	private String user_phone;
	private String user_email;
	private String user_postalcode;
	private String user_roadaddr;
	private String user_detailaddr;
	private Timestamp user_regdate;
	private int user_status;
	private int user_emailagree;
	private int user_point;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_postalcode() {
		return user_postalcode;
	}
	public void setUser_postalcode(String user_postalcode) {
		this.user_postalcode = user_postalcode;
	}
	public String getUser_roadaddr() {
		return user_roadaddr;
	}
	public void setUser_roadaddr(String user_roadaddr) {
		this.user_roadaddr = user_roadaddr;
	}
	public String getUser_detailaddr() {
		return user_detailaddr;
	}
	public void setUser_detailaddr(String user_detailaddr) {
		this.user_detailaddr = user_detailaddr;
	}
	public Timestamp getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Timestamp user_regdate) {
		this.user_regdate = user_regdate;
	}
	public int getUser_status() {
		return user_status;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public int getUser_emailagree() {
		return user_emailagree;
	}
	public void setUser_emailagree(int user_emailagree) {
		this.user_emailagree = user_emailagree;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	@Override
	public String toString() {
		return "MemberVO [user_num=" + user_num + ", user_id=" + user_id + ", user_pass=" + user_pass + ", user_name="
				+ user_name + ", user_birth=" + user_birth + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", user_postalcode=" + user_postalcode + ", user_roadaddr=" + user_roadaddr + ", user_detailaddr="
				+ user_detailaddr + ", user_regdate=" + user_regdate + ", user_status=" + user_status
				+ ", user_emailagree=" + user_emailagree + ", user_point=" + user_point + "]";
	}
}
