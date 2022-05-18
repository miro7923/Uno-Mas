package com.april.unomas.domain;

import java.sql.Date;

public class Qna_ComVO {
	
	private int qnacom_num;
	private int qna_num;
	private int admin_num;
	private String qna_content;
	private Date qna_regdate;
	private QnaVO qnaVO;
	
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
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	@Override
	public String toString() {
		return "Qna_ComVO [qnacom_num=" + qnacom_num + ", qna_num=" + qna_num + ", admin_num=" + admin_num
				+ ", qna_content=" + qna_content + ", qna_regdate=" + qna_regdate + ", qnaVO=" + qnaVO + "]";
	}
	
	
	
}
