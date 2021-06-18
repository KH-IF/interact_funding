package com.kh.interactFunding.funding.model.vo;



import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class Funding {
	private int fundingNo;
	private String title;
	private String categoryCode;
	private int nowAmount;
	private int goalAmount;
	private String ratePlanCode;
	private int writerNo;
	private int readCount;
	private int likeCount;
	private Date startDate;
	private Date dDay;
	private Date regDate;
	private String phone;
	private Boolean status;
	
	private Attachment attachment;
	
	
}
