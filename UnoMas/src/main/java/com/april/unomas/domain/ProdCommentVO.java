package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProdCommentVO {

	private int com_num;
	private int p_inquiry_num;
	private int admin_num;
	private String com_content;
	private Timestamp com_regdate;
}

