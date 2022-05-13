package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardReviewVO {

	private Integer review_num;
	private Integer user_num;
	private String user_id;
	private Integer prod_num;
	private String review_title;
	private String review_content;
	private int review_readcnt;
	private Timestamp review_regdate;
	private String review_ip;
	private String review_image;
	private int review_likecnt;
	private float review_rating;
}
