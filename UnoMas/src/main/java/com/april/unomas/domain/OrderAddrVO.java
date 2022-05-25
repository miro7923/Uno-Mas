package com.april.unomas.domain;

import lombok.Data;

@Data
public class OrderAddrVO {

	private int addr_num;
	private int user_num;
	private String addr_name;
	private String addr_postalcode;
	private String addr_roadaddr;
	private String addr_detailaddr;
	private boolean addr_primary;
	private String addr_recipient;
	private String addr_phone;
}
