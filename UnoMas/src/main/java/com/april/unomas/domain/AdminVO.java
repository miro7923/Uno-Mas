package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminVO {

	private int admin_num;
	private String admin_id;
	private String admin_pass;
	private int admin_permit;
	private Timestamp admin_regdate;
	private Timestamp admin_lastlogin;
}
