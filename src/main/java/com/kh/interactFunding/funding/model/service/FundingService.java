package com.kh.interactFunding.funding.model.service;

import java.util.List;

import java.util.Map;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.Funding_reward;
import com.kh.interactFunding.funding.model.vo.FundingExt;


public interface FundingService {
	
	//김윤수
	
	//김경태
	
	//김주연
	int ready1FundingInsertNo(Funding funding);
	int saveCharge(Map<String, Object> param);
	int saveBasicInfo(FundingExt funding);
	int insertAttachment(Attachment attach);
	int saveStory(Funding funding);
	
	//박요한
	
	//배기원
	public List<Funding> indexfundingList();
	public List<Funding_reward> indexfuding_rewardList();
	public List<Funding> indexfundinglike();
	//이승우
	public List<Funding> fundingList(Map<String, Object> map);



	
	//천호현
	public Funding selectOneFunding(int funding_no);

	public List<Funding> selectFunding(int funding_no);
	
	
}
