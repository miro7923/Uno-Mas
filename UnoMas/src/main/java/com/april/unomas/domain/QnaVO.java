package com.april.unomas.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qna_num;
	private int user_num;
	private String qna_title;
	private String qna_content;
	private Date qna_regdate;
	private int qnacate_num;
	private int qna_process;
	private String qnacate2;
	private String qna_image1;
	private String qna_image2;
	private QnaCateVO qnaCateVO;
	private Qna_ComVO qna_comVO;
}
