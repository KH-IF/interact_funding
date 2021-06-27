package com.kh.interactFunding.funding.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int commentNo;
	private int commentLevel;
	private int writerNo;
	private String content;
	private int fundingNo;
	private int commentRef;
	private Date regDate;
	
	//작성자 이름불러오기(DB에는 없음)
	private String name;
}