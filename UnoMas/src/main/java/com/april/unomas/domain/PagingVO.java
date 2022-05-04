package com.april.unomas.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class PagingVO {
	
	 	private Criter cri;
	    private int totalCount;
	    private int startPage;
	    private int endPage;
	    private boolean prev;
	    private boolean next;
	    private int displayPageNum = 6;
	    
	    public Criter getCri() {
	        return cri;
	    }
	    public void setCri(Criter cri) {
	        this.cri = cri;
	    }
	    public int getTotalCount() {
	        return totalCount;
	    }
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        calcData();
	    }
	    
	    public PagingVO(Criter cri) {
	    	this.cri = cri;
	    }
	    
	    private void calcData() {
	    	int page = this.cri.getPage();
	    	int perPageNum = this.cri.getPerPageNum();
	        
	        this.endPage = (int) (Math.ceil(page / (double) displayPageNum) * displayPageNum);
	 
	        this.startPage = (this.endPage - displayPageNum) + 1;
	        if(startPage <= 0) startPage = 1;
	        
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) perPageNum));
	        if (this.endPage > tempEndPage) {
	            this.endPage = tempEndPage;
	        }
	 
	        this.prev = (startPage != 1);
	        this.next = (endPage * perPageNum < totalCount);
	        
	    }
	    
	    public int getStartPage() {
	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public void setEndPage(int endPage) {
	        this.endPage = endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public void setPrev(boolean prev) {
	        this.prev = prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    public void setNext(boolean next) {
	        this.next = next;
	    }
	    public int getDisplayPageNum() {
	        return displayPageNum;
	    }
	    public void setDisplayPageNum(int displayPageNum) {
	        this.displayPageNum = displayPageNum;
	    }
	    
		public String makeQuery(int page/* , boolean needSearch */) {
	    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
	    			.queryParam("page", page)
	    			.queryParam("perPageNum", this.cri.getPerPageNum());
	    	
	    	if(this.cri.getSearch_type() != null) {
	    		uriComponentsBuilder
	    			.queryParam("search_type", this.cri.getSearch_type())
	    			.queryParam("keyword", this.cri.getKeyword());
	    	}
	    	return uriComponentsBuilder.build().encode().toString();
	    }


}
