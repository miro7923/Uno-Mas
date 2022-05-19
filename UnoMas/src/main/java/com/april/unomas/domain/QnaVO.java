package com.april.unomas.domain;

import java.sql.Date;

public class QnaVO {
	
	private int qna_num;
	private int user_num;
	private String qna_title;
	private String qna_content;
	private Date qna_regdate;
	private int qnacate_num;
	private int qna_process;
	private String qnacate2;
	private String qna_image1;
	private String qna_image2;
	private QnaCateVO qnaCateVO;
	private Qna_ComVO qna_comVO;
	

	
	public Qna_ComVO getQna_comVO() {
		return qna_comVO;
	}
	public void setQna_comVO(Qna_ComVO qna_comVO) {
		this.qna_comVO = qna_comVO;
	}
	public String getQna_image1() {
		return qna_image1;
	}
	public void setQna_image1(String qna_image1) {
		this.qna_image1 = qna_image1;
	}
	public String getQna_image2() {
		return qna_image2;
	}
	public void setQna_image2(String qna_image2) {
		this.qna_image2 = qna_image2;
	}
	public QnaCateVO getQnaCateVO() {
		return qnaCateVO;
	}
	public void setQnaCateVO(QnaCateVO qnaCateVO) {
		this.qnaCateVO = qnaCateVO;
	}
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
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
	public int getQnacate_num() {
		return qnacate_num;
	}
	public void setQnacate_num(int qnacate_num) {
		this.qnacate_num = qnacate_num;
	}
	public int getQna_process() {
		return qna_process;
	}
	public void setQna_process(int qna_process) {
		this.qna_process = qna_process;
	}
	public String getQnacate2() {
		return qnacate2;
	}
	public void setQnacate2(String qnacate2) {
		this.qnacate2 = qnacate2;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_num=" + qna_num + ", user_num=" + user_num + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_regdate=" + qna_regdate + ", qnacate_num=" + qnacate_num + ", qna_process="
				+ qna_process + ", qnacate2=" + qnacate2 + ", qna_image1=" + qna_image1 + ", qna_image2=" + qna_image2
				+ ", qnaCateVO=" + qnaCateVO + ", qna_comVO=" + qna_comVO + "]";
	}
	
	
	
	
}
