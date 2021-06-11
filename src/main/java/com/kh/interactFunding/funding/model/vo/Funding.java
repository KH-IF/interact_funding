package com.kh.interactFunding.funding.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	
	//김주연 start_day date로 변환
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date start_date;
	
	//김주연 d_day date로 변환
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date d_day;
	
	private Date reg_date;
	private String phone;
	
	
}
