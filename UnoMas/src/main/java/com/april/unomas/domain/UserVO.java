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
@ToString
@AllArgsConstructor
@NoArgsConstructor
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
	private int user_use_point;
	private String user_bank;
	private String user_account;
	private String user_account_holder;
	private Timestamp user_deldate;
	
	private int addr_num;
	private String addr_name;
	private String addr_postalcode;
	private String addr_roadaddr;
	private String addr_detailaddr;
	private boolean addr_primary;
	private String addr_recipient;
	private String addr_phone;

}

