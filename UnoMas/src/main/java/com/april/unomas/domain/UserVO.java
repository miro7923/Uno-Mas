package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class UserVO {

	private int user_num;
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_birth;
	private String user_phone;
	private String user_email;
	private String user_postalcode;
	private String user_roadaddr;
	private String user_detailaddr;
	private Timestamp user_regdate;
	private int user_status;
	private int user_emailagree;
	private int user_point;
	
	
}
