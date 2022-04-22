package com.april.unomas.domain;

import java.sql.Timestamp;

public class AdminVO {

	private int admin_num;
	private String admin_id;
	private String admin_pass;
	private int admin_permit;
	private Timestamp admin_regdate;
	private Timestamp admin_lastlogin;
	
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	public int getAdmin_permit() {
		return admin_permit;
	}
	public void setAdmin_permit(int admin_permit) {
		this.admin_permit = admin_permit;
	}
	public Timestamp getAdmin_regdate() {
		return admin_regdate;
	}
	public void setAdmin_regdate(Timestamp admin_regdate) {
		this.admin_regdate = admin_regdate;
	}
	public Timestamp getAdmin_lastlogin() {
		return admin_lastlogin;
	}
	public void setAdmin_lastlogin(Timestamp admin_lastlogin) {
		this.admin_lastlogin = admin_lastlogin;
	}
	
	@Override
	public String toString() {
		return "AdminVO [admin_num=" + admin_num + ", admin_id=" + admin_id + ", admin_pass=" + admin_pass
				+ ", admin_permit=" + admin_permit + ", admin_regdate=" + admin_regdate + ", admin_lastlogin="
				+ admin_lastlogin + "]";
	}
}
