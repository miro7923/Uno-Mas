package com.april.unomas.domain;

import lombok.Data;

@Data
public class ProdCriteria {

	private int cateStart;
	private int cateEnd;
	private int page;
	private int perPageNum;
	private int prod_category;
	
	public ProdCriteria() {
		this.page = 1;
		this.perPageNum = 9;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		// 페이지 사이즈 (한 페이지에 perPageNum만큼 출력하게 하기)
		if (!(0 < perPageNum && perPageNum < 100)) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
}
