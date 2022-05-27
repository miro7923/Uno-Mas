package com.april.unomas.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class Criter {
	private int page;
    private int perPageNum;
    
    private String search_type;
    private String keyword;
    
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public Criter() {
        this.page = 1;
        this.perPageNum = 10;
        this.search_type = null;
        this.keyword = null;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    
    public String makeQuery() {
    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
    			.queryParam("page", page)
    			.queryParam("perPageNum", this.perPageNum);
    	if(search_type != null) {
    		uriComponentsBuilder
    			.queryParam("search_type",this.search_type)
    			.queryParam("keyword",this.keyword);
    	}
    	return uriComponentsBuilder.build().encode().toString();
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int perPageNum) {
        if(perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
        } else {
            this.perPageNum = perPageNum;
        }
    }

	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criter [page=" + page + ", perPageNum=" + perPageNum + ", search_type=" + search_type + ", keyword="
				+ keyword + "]";
	}
    
}
