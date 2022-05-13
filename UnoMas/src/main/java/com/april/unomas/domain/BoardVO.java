package com.april.unomas.domain;

import java.sql.Date;

public class BoardVO {
	private Integer faq_num;
	private String faq_title;
	private String faq_cate;
	private String faq_content;
	private Date faq_regdate;
	
	public Integer getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(Integer faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_cate() {
		return faq_cate;
	}
	public void setFaq_cate(String faq_cate) {
		this.faq_cate = faq_cate;
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
	@Override
	public String toString() {
		return "BoardVO [faq_num=" + faq_num + ", faq_title=" + faq_title + ", faq_cate=" + faq_cate + ", faq_content="
				+ faq_content + ", faq_regdate=" + faq_regdate + "]";
	}
	
}
