package com.kh.interactFunding.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FundingParticipation {
	private int no;
	private int fundingNo;
	private int memberNo;
	private Date regDate;
	private Boolean status;
	private int rewardNo;
	private int point;
	private String address;
	private String name;
	private String phone;
	private String etc;
}
