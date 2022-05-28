package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PointVO {

	private Integer point_num;
	private Integer order_code;
	private Integer user_num;
	private String point_form;
	private String point_content;
	private int point_cost;
	private Timestamp point_regdate;
	private Timestamp point_deadline;
}
