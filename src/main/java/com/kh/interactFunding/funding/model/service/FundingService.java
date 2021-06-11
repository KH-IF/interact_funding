package com.kh.interactFunding.funding.model.service;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
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
	
	//이승우
	public List<Funding> fundingList();



	
	//천호현
	
}
