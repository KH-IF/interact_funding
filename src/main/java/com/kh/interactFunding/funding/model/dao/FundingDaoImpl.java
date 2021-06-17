package com.kh.interactFunding.funding.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.vo.Member;

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
	public List<FundingExt> statusYList(Member loginMember) {
		// TODO Auto-generated method stub
		return session.selectList("funding.statusYList",loginMember);
	}
	@Override
	public List<FundingExt> statusNList(Member loginMember) {
		// TODO Auto-generated method stub
		return session.selectList("funding.statusNList",loginMember);
	}
	@Override
	public FundingExt loadFunding(String fundingNo) {
		// TODO Auto-generated method stub
		return session.selectOne("funding.loadFunding",fundingNo);
	}

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
	@Override
	public List<Reward> loadReward(String fundingNo) {
		// TODO Auto-generated method stub
		return session.selectList("funding.loadReward",fundingNo);
	}
	@Override
	public int insertReward(Reward reward) {
		// TODO Auto-generated method stub
		return session.insert("funding.insertReward",reward);
	}
	@Override
	public int updateReward(Reward reward) {
		// TODO Auto-generated method stub
		return session.update("funding.updateReward",reward);
	}
	@Override
	public int deleteReward(int rewardNo) {
		// TODO Auto-generated method stub
		return session.delete("funding.deleteReward",rewardNo);
	}
	@Override
	public int finalSubmit(Funding funding) {
		// TODO Auto-generated method stub
		return session.update("funding.finalSubmit",funding);
	}
	@Override
	public int deleteFunding(String fundingNo) {
		// TODO Auto-generated method stub
		return session.delete("funding.deleteFunding",fundingNo);
	}

	

	//박요한
	@Override
	public List<Funding> news(Map<String, Object> param) {
		return session.selectList("funding.news", param);
	}
	
	@Override
	public List<Funding> community(Map<String, Object> param) {
		return session.selectList("funding.community", param);
	}
	
	@Override
	public List<Funding> supporter(Map<String, Object> param) {
		return session.selectList("funding.supporter", param);
	}
	
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
	public int indexTotalContents() {
		return session.selectOne("funding.indexTotalContents");
	}
	
	
	
	@Override
	public List<Funding> indexEarlyList() {
		// TODO Auto-generated method stub
		return session.selectList("funding.indexEarlyList");
	}
	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		log.debug("map@dap = {}",map);
		return session.selectList("funding.selectFundingList", map);
	}

	@Override
	public List<Map<String, String>> selectCategoryList() {
		return session.selectList("funding.selectCategoryList");
	}	

	//천호현

	@Override
	public Funding selectOneFunding(int funding_no) {
		return session.selectOne("funding.selectOneFunding", funding_no);
	}
	
	@Override
	public int selectOneFunding2(int funding_no) {
		return session.selectOne("funding.selectOneFunding2", funding_no);
	}


	
	

	

	
	
}
