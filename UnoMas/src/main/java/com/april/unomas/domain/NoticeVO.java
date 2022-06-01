package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private Integer notice_num;
	private Integer admin_num;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_regdate;
	private Integer notice_readcnt;
	private String notice_ip;
	private String notice_file;
	private String notice_img;
	private AdminVO adminVO;
}
