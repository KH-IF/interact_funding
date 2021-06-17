package com.kh.interactFunding.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class FundingDetailVo extends Funding{
	
	private int rewardNo;
	private int price;
	private String rewardTitle;
	private String rewardContent;
	private int shippingPrice;
	private int limitAmount;
	private Date shippingDate;
	private String originalFileName;
	private String renamedFileName;
	private String status_1;
	private String name;
	
	
}
