package com.kh.interactFunding.funding.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;

import com.kh.interactFunding.funding.model.vo.Funding_reward;

import com.kh.interactFunding.funding.model.vo.FundingExt;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FundingDaoImpl implements FundingDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	//김윤수
	
	//김경태
	
	//김주연
	@Override
	public int ready1FundingInsertNo(Funding funding) {
		// TODO Auto-generated method stub
		return session.insert("funding.ready1FundingInsertNo",funding);
	}
	@Override
	public int saveCharge(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("funding.saveCharge",param);
	}
	@Override
	public int saveBasicInfo(FundingExt funding) {
		// TODO Auto-generated method stub
		return session.update("funding.saveBasicInfo",funding);
	}
	@Override
	public int insertAttachment(Attachment attach) {
		// TODO Auto-generated method stub
		return session.insert("funding.insertAttachment",attach);
	}
	@Override
	public int saveStory(Funding funding) {
		// TODO Auto-generated method stub
		return session.update("funding.saveStory",funding);
	}
	
	
	//박요한
	
	//배기원
	@Override
	public List<Funding> indexfundingList() {
		return session.selectList("funding.indexfundingList");
	}
	@Override
	public List<Funding> indexfundinglike() {
		return session.selectList("funding.indexfundinglike");
	}

	@Override
	public List<Funding_reward> indexfuding_rewardList() {
		// TODO Auto-generated method stub
		return session.selectList(null);
	}



	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		log.debug("map@dap = {}",map);
		return session.selectList("funding.selectFundingList", map);
	}

	@Override
	public List<Funding> fundingSearchList() {
		return session.selectList("funding.searchFundingList");
	}

	//천호현

	@Override
	public Funding selectOneFunding(int funding_no) {
		return session.selectOne("funding.selectOneFunding", funding_no);
	}

	@Override
	public List<Funding> selectFunding(int funding_no) {
		return session.selectList("funding.selectFunding", funding_no);
	}
	
}
