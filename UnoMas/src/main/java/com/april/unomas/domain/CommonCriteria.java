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
public class CommonCriteria {
	private int page;
	private int perPageNum;
	
	public CommonCriteria() {
		this.page = 1;
		this.perPageNum = 2;
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
