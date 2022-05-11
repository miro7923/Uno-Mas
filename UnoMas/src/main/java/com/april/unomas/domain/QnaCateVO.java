package com.april.unomas.domain;

public class QnaCateVO {
	
	private int qnacate_num;
	private String qnacate_name;
	
	public int getQnacate_num() {
		return qnacate_num;
	}
	public void setQnacate_num(int qnacate_num) {
		this.qnacate_num = qnacate_num;
	}
	public String getQnacate_name() {
		return qnacate_name;
	}
	public void setQnacate_name(String qnacate_name) {
		this.qnacate_name = qnacate_name;
	}
	
	@Override
	public String toString() {
		return "QnaCateVO [qnacate_num=" + qnacate_num + ", qnacate_name=" + qnacate_name + "]";
	}
	
	
	
}
