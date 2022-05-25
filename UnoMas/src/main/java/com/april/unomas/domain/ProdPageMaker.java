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
	private String searchType;
	private String keyword;
//	private String srchTypeKyw;
	
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
	
//	public void setSrchTypeKyw(String searchType, String keyword) {
//		 
//		 if(searchType.equals("") || keyword.equals("")) {
//			 srchTypeKyw = ""; 
//		 } else {
//			 srchTypeKyw = "&searchType=" + searchType + "&keyword=" + keyword; 
//		 }  
//	}
	
	public String getSrchTypeKyw() {
		
		if(searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
	
	
}
