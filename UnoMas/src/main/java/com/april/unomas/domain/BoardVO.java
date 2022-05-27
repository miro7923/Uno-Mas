package com.april.unomas.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer faq_num;
	private Integer admin_num;
	private String faq_title;
	private String faq_content;
	private Date faq_regdate;
	private Integer qnacate_num;
	private AdminVO adminVO;
	private QnaCateVO qnaCateVO;
}
