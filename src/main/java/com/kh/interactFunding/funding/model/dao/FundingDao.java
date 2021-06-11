package com.kh.interactFunding.funding.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.funding.model.vo.Funding;

public interface FundingDao {

	//김윤수
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	public List<Funding> indexfundingList();
	//이승우
	public List<Funding> fundingList(Map<String, Object> map);
	
	public List<Funding> fundingSearchList();
	
	//천호현
	public Funding selectOneFunding(int funding_no);
	
	public List<Funding> selectFunding(int funding_no);

}
