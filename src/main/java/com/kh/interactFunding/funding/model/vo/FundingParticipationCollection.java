package com.kh.interactFunding.funding.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FundingParticipationCollection {
	private int fundingNo;
	private int memberNo;
	
	//rewardList : mapper에서 Collection을 위해만듦
	List<RewardCollection> rewardList;
}
