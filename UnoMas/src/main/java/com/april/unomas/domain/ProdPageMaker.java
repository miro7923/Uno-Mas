package com.april.unomas.domain;

import lombok.Data;

@Data
public class ProdPageMaker {

	private int totalCnt;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageBlock = 10;
	private ProdCriteria cri;
	
	public void setCri(ProdCriteria cri) {
		this.cri = cri;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
		
		calcData();
	}
	
	public void calcData() {
		endPage = (int)Math.ceil(cri.getPage() / (double)pageBlock) * pageBlock;
		startPage = (endPage - pageBlock) + 1;
		int tmpEndPage = (int)Math.ceil(totalCnt / (double)cri.getPerPageNum());
		
		if (endPage > tmpEndPage) endPage = tmpEndPage;
		
		prev = (startPage == 1) ? false : true;
		next = (endPage * cri.getPerPageNum() >= totalCnt) ? false : true;
	}
}
