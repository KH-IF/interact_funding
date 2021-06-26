package com.kh.interactFunding.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FundingBoard {
	private int no;
	private int fundingNo;
	private String title;
	private int writerNo;
	private String content;
	private Date regDate;
	private int readCount;
	
	private Attachment attachment;
}
