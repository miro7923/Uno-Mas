package com.april.unomas.domain;

import lombok.Data;

@Data
public class ProdPaging {

	private int cateStart;
	private int cateEnd;
	private int startRow;
	private int pageSize;
	private int prod_category;
}
