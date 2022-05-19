package com.april.unomas.domain;

import java.sql.Date;

public class NoticeVO {
	private Integer notice_num;
	private Integer admin_num;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	private Integer notice_readcnt;
	private String notice_ip;
	private String notice_file;
	private String notice_img;
	private AdminVO adminVO;
	
	public AdminVO getAdminVO() {
		return adminVO;
	}
	public void setAdminVO(AdminVO adminVO) {
		this.adminVO = adminVO;
	}
	public Integer getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(Integer notice_num) {
		this.notice_num = notice_num;
	}
	public Integer getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(Integer admin_num) {
		this.admin_num = admin_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	
	public String getNotice_ip() {
		return notice_ip;
	}
	public void setNotice_ip(String notice_ip) {
		this.notice_ip = notice_ip;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public String getNotice_img() {
		return notice_img;
	}
	public void setNotice_img(String notice_img) {
		this.notice_img = notice_img;
	}
	public Integer getNotice_readcnt() {
		return notice_readcnt;
	}
	public void setNotice_readcnt(Integer notice_readcnt) {
		this.notice_readcnt = notice_readcnt;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", admin_num=" + admin_num + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_regdate=" + notice_regdate + ", notice_readcnt="
				+ notice_readcnt + ", notice_ip=" + notice_ip + ", notice_file=" + notice_file + ", notice_img="
				+ notice_img + ", adminVO=" + adminVO + "]";
	}
	
	
	
	
	
}
