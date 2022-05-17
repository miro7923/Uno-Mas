package com.april.unomas.domain;

import java.sql.Date;

public class BoardVO {
	private Integer faq_num;
	private Integer admin_num;
	private String faq_title;
	private String faq_content;
	private Date faq_regdate;
	private Integer qnacate_num;
	private AdminVO adminVO;
	private QnaCateVO qnaCateVO;
	public Integer getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(Integer faq_num) {
		this.faq_num = faq_num;
	}
	public Integer getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(Integer admin_num) {
		this.admin_num = admin_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Date getFaq_regdate() {
		return faq_regdate;
	}
	public void setFaq_regdate(Date faq_regdate) {
		this.faq_regdate = faq_regdate;
	}
	public Integer getQnacate_num() {
		return qnacate_num;
	}
	public void setQnacate_num(Integer qnacate_num) {
		this.qnacate_num = qnacate_num;
	}
	public AdminVO getAdminVO() {
		return adminVO;
	}
	public void setAdminVO(AdminVO adminVO) {
		this.adminVO = adminVO;
	}
	public QnaCateVO getQnaCateVO() {
		return qnaCateVO;
	}
	public void setQnaCateVO(QnaCateVO qnaCateVO) {
		this.qnaCateVO = qnaCateVO;
	}
	@Override
	public String toString() {
		return "BoardVO [faq_num=" + faq_num + ", admin_num=" + admin_num + ", faq_title=" + faq_title
				+ ", faq_content=" + faq_content + ", faq_regdate=" + faq_regdate + ", qnacate_num=" + qnacate_num
				+ ", adminVO=" + adminVO + ", qnaCateVO=" + qnaCateVO + "]";
	}
	
	
	
}
