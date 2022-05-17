package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {

	private Integer prod_num;
	private String prod_name;
	private int prod_category;
	private int prod_price;
	private int prod_stock;
	private String prod_thumbnail;
	private String prod_thumb_soldout;
	private String prod_image1;
	private String prod_image2;
	private String prod_image3;
	private Timestamp prod_regdate;
	private int prod_expire;
	private int prod_readcnt;
	private int prod_sellcnt;
	private String prod_keep;
	private String prod_weight;
	private String prod_country;
	private String prod_sellunit;
	private String prod_explain;
	private String prod_packing;
	private int prod_discntrate;
}
