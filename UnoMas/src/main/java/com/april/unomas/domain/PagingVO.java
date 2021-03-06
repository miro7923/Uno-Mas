package com.april.unomas.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class PagingVO {
	
	 	private Criter cri;
	    private int totalCount;
	    private int startPage;
	    private int endPage;
	    private int lastPage;
	    private boolean prev;
	    private boolean next;
	    private int displayPageNum = 6;
	    private int firstPage;
	    
		public int getFirstPage() {
			return firstPage;
		}
		public void setFirstPage(int firstPage) {
			this.firstPage = firstPage;
		}
		public int getLastPage() {
			return lastPage;
		}
		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
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
	        System.out.println("endPage == ::" + endPage);
	        this.startPage = (this.endPage - displayPageNum) + 1;
	        System.out.println("startPage == :: " + startPage);
//	        if(startPage <= 0) startPage = 0;
	        
	        int tempEndPage = (int) (Math.ceil(totalCount / (double) perPageNum));
	        if (this.endPage > tempEndPage) {
	            this.endPage = tempEndPage;
	        }
	        int realEnd = (int) (Math.ceil(totalCount / (double) perPageNum));
	        this.lastPage = realEnd;
	        
	        this.firstPage = 1;
	 
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
	    
//	    public String sortQuery(int page) {
//	    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
//	    			.queryParam("page", page)
//	    			.queryParam("perPageNum", this.cri.getPerPageNum());
//	    	return uriComponentsBuilder.build().encode().toString();
//	    }
	    
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
		@Override
		public String toString() {
			return "PagingVO [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
					+ endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + "]";
		}
		
		
		
		
		
}
