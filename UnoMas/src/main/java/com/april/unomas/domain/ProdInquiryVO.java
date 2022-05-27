package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProdInquiryVO {

	private Integer p_inquiry_num;
	private Integer user_num;
	private String user_id;
	private Integer prod_num;
	private String prod_name;
	private String p_inquiry_title;
	private String p_inquiry_content;
	private Timestamp p_inquiry_regdate;
	private boolean p_inquiry_processs;
	private ProdCommentVO prod_comment;

}
