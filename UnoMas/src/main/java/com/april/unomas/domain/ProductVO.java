package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

//@Data
public class ProductVO {

	private int prod_num;
	private String prod_name;
	private int prod_category;
	private int prod_price;
	private int prod_stock;
	private String prod_thumbnail;
	private String prod_image1;
	private String prod_image2;
	private String prod_image3;
	private Timestamp prod_regdate;
	private Timestamp prod_expire;
	private int prod_readcnt;
	private int prod_sellcnt;
	private String prod_keep;
	private int prod_weight;
	private String prod_country;
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_category() {
		return prod_category;
	}
	public void setProd_category(int prod_category) {
		this.prod_category = prod_category;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(int prod_stock) {
		this.prod_stock = prod_stock;
	}
	public String getProd_thumbnail() {
		return prod_thumbnail;
	}
	public void setProd_thumbnail(String prod_thumbnail) {
		this.prod_thumbnail = prod_thumbnail;
	}
	public String getProd_image1() {
		return prod_image1;
	}
	public void setProd_image1(String prod_image1) {
		this.prod_image1 = prod_image1;
	}
	public String getProd_image2() {
		return prod_image2;
	}
	public void setProd_image2(String prod_image2) {
		this.prod_image2 = prod_image2;
	}
	public String getProd_image3() {
		return prod_image3;
	}
	public void setProd_image3(String prod_image3) {
		this.prod_image3 = prod_image3;
	}
	public Timestamp getProd_regdate() {
		return prod_regdate;
	}
	public void setProd_regdate(Timestamp prod_regdate) {
		this.prod_regdate = prod_regdate;
	}
	public Timestamp getProd_expire() {
		return prod_expire;
	}
	public void setProd_expire(Timestamp prod_expire) {
		this.prod_expire = prod_expire;
	}
	public int getProd_readcnt() {
		return prod_readcnt;
	}
	public void setProd_readcnt(int prod_readcnt) {
		this.prod_readcnt = prod_readcnt;
	}
	public int getProd_sellcnt() {
		return prod_sellcnt;
	}
	public void setProd_sellcnt(int prod_sellcnt) {
		this.prod_sellcnt = prod_sellcnt;
	}
	public String getProd_keep() {
		return prod_keep;
	}
	public void setProd_keep(String prod_keep) {
		this.prod_keep = prod_keep;
	}
	public int getProd_weight() {
		return prod_weight;
	}
	public void setProd_weight(int prod_weight) {
		this.prod_weight = prod_weight;
	}
	public String getProd_country() {
		return prod_country;
	}
	public void setProd_country(String prod_country) {
		this.prod_country = prod_country;
	}
	
	
	
}
