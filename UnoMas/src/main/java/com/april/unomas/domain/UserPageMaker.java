package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserPageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageBlock = 10;
	private CommonCriteria cri;
	
	
	
	public void setCri(CommonCriteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();	// 계산
	}
	
	
	private void calcData() {
		endPage = (int)Math.ceil(cri.getPage() / (double) pageBlock) * pageBlock;
		startPage = (endPage - pageBlock) + 1;
	
		// 임시 엔드페이지.
		int tmpEndPage = (int)Math.ceil(totalCount / (double)cri.getPerPageNum());
		if(endPage > tmpEndPage) { endPage = tmpEndPage; }
		
		// 이전과 다음
		prev = startPage == 1 ? false :  true;
		next = endPage * cri.getPerPageNum() >= totalCount? false : true;
	}
	
}
