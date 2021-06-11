package com.kh.interactFunding.funding_reward.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class funding_reward {
	//배기원
	private int reward_no;
	private int funding_no;
	private int member_no;
	private int price;
	private String title;
	private String content;
	private int shipping_price;
	private int limit_amount;
	private Date  shippin_date;
}
