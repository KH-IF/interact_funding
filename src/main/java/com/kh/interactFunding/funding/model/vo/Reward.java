package com.kh.interactFunding.funding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reward {
	private int rewardNo;
	private int fundingNo;
	private int price;
	private String title;
	private String content;
	private int shippingPrice;
	private int limitAmount;
	private Date shippingDate;
}
