package com.kh.interactFunding.funding.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FundingParticipationCollection {
//	private int no; // rewardList에서 처리할것
	private int fundingNo;
	private int memberNo;
	private Date regDate;
	private Boolean status;
//	private int rewardNo; //rewardList에서 처리할것
	private int point;
	private String address;
	private String name;
	private String phone;
	private String etc;
	
	//rewardList : mapper에서 Collection을 위해만듦
	List<RewardCollection> rewardList;
}
