package com.april.unomas.domain;

import java.sql.Date;

public class Qna_ComVO {
	
	private int qnacom_num;
	private int qna_num;
	private int admin_num;
	private String qnacom_content;
	private Date qnacom_regdate;
	private QnaVO qnaVO;
	private AdminVO adminVO;
	
	public int getQnacom_num() {
		return qnacom_num;
	}
	public void setQnacom_num(int qnacom_num) {
		this.qnacom_num = qnacom_num;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	
	
	public Date getQnacom_regdate() {
		return qnacom_regdate;
	}
	public void setQnacom_regdate(Date qnacom_regdate) {
		this.qnacom_regdate = qnacom_regdate;
	}
	public String getQnacom_content() {
		return qnacom_content;
	}
	public void setQnacom_content(String qnacom_content) {
		this.qnacom_content = qnacom_content;
	}
	public QnaVO getQnaVO() {
		return qnaVO;
	}
	public void setQnaVO(QnaVO qnaVO) {
		this.qnaVO = qnaVO;
	}
	
	
	public AdminVO getAdminVO() {
		return adminVO;
	}
	public void setAdminVO(AdminVO adminVO) {
		this.adminVO = adminVO;
	}
	@Override
	public String toString() {
		return "Qna_ComVO [qnacom_num=" + qnacom_num + ", qna_num=" + qna_num + ", admin_num=" + admin_num
				+ ", qnacom_content=" + qnacom_content + ", qnacom_regdate=" + qnacom_regdate + ", qnaVO=" + qnaVO
				+ ", adminVO=" + adminVO + "]";
	}
	
	
	
	
	
}
