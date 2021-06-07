package com.kh.interactFunding.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Funding {
	//이승우
	private int funding_no;
	private String category_code;
	private String rate_plan_code;
	private int writer_no;
	private String title;
	private int now_amount;
	private int goal_amount;
	private int readCount;
	private String content;
	private String early_content;
	private Date start_date;
	private Date d_day;
	private Date reg_date;
	private String phone;
	
	
}
