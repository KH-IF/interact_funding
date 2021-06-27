package com.kh.interactFunding.funding.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RewardCollection {
	private int no; //funding_participation 테이블의 no(pk)임
	private int rewardNo;
	private int price;
	private int point;
	private String title;
	private String content;
	private int shippingPrice;
	private int limitAmount;
	private Date shippingDate;
	
	private Date regDate;
	private Boolean status;
	private String address;
	private String name;
	private String phone;
	private String etc;
}
