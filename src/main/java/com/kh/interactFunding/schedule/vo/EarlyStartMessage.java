package com.kh.interactFunding.schedule.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EarlyStartMessage {
	private int no;
	private int fundingNo;
	private int memberNo;
	private Date startDate;
	
	private String title;
}
