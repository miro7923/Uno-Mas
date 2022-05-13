package com.april.unomas.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EmailVO {
	private String sender = "cieloeun@naver.com";
	private String recipients;
	private String subject;
	private String content;
}