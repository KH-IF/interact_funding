package com.kh.interactFunding.funding.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.funding.model.dao.FundingDao;
import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FundingServiceImpl implements FundingService{
	
	@Autowired
	private FundingDao fundingDao;
	
	//김윤수
	
	//김경태
	
	//김주연
	@Override
	public List<FundingExt> statusYList(Member loginMember) {
		// TODO Auto-generated method stub
		return fundingDao.statusYList(loginMember);
	}
	@Override
	public List<FundingExt> statusNList(Member loginMember) {
		// TODO Auto-generated method stub
		return  fundingDao.statusNList(loginMember);
	}
	@Override
	public int ready1FundingInsertNo(Funding funding) {
		return fundingDao.ready1FundingInsertNo(funding);
	}
	@Override
	public FundingExt selectCheckFunding(String fundingNo) {
		// TODO Auto-generated method stub
		return fundingDao.selectCheckFunding(fundingNo);
	}
	@Override
	public int saveCharge(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return fundingDao.saveCharge(param);
	}
	@Override
	public int saveBasicInfo(FundingExt funding) {
		int result = 0;
		result = fundingDao.saveBasicInfo(funding);
		log.debug("funding = {}",funding);
		
		//attachment 등록
		if(funding.getAttachList().size() > 0) {
			for(Attachment attach: funding.getAttachList()) {
				attach.setFundingNo(funding.getFundingNo()); //이번에 발급받은 funindg pk|  attach no fk세팅
				result = insertAttachment(attach);
				log.debug("attach={}",attach);
			}
		}	
		return result;
	}
	@Override
	public int insertAttachment(Attachment attach) {
		return fundingDao.insertAttachment(attach);
	}
	@Override
	public int saveStory(Funding funding) {
		// TODO Auto-generated method stub
		return fundingDao.saveStory(funding);
	}
	@Override
	public List<Reward> loadReward(String fundingNo) {
		// TODO Auto-generated method stub
		return fundingDao.loadReward(fundingNo);
	}
	
	@Override
	public Reward selectOneReward(String rewardNo) {
		// TODO Auto-generated method stub
		return fundingDao.selectOneReward(rewardNo);
	}
	@Override
	public int insertReward(Reward reward) {
		// TODO Auto-generated method stub
		return fundingDao.insertReward(reward);
	}
	@Override
	public int updateReward(Reward reward) {
		// TODO Auto-generated method stub
		return fundingDao.updateReward(reward);
	}
	@Override
	public int deleteReward(int rewardNo) {
		// TODO Auto-generated method stub
		return fundingDao.deleteReward(rewardNo);
	}

	
	@Override
	public int finalSubmit(Funding funding) {
		// TODO Auto-generated method stub
		return fundingDao.finalSubmit(funding);
	}
	@Override
	public FundingExt loadFunding(String fundingNo) {
		// TODO Auto-generated method stub
		return fundingDao.loadFunding(fundingNo);
	}
	@Override
	public int deleteFunding(String fundingNo) {
		// TODO Auto-generated method stub
		return fundingDao.deleteFunding(fundingNo);
	}
	
	
	//박요한
	
	@Override
	public List<Funding> fundingNews(int funding_no) {
		return fundingDao.fundingNews(funding_no);
	}
	
	
	//배기원
	@Override
	public List<Funding> indexfundingList() {
		return fundingDao.indexfundingList();
	}
	@Override
	public List<Funding> indexfundinglike() {
		return fundingDao.indexfundinglike();
	}
	@Override
	public List<Funding> indexviewlist() {
		return fundingDao.indexviewlist();
	}
	@Override
	public int indexTotalContents() {
		return fundingDao.indexTotalContents();
	}
	@Override
	public List<Funding> indexEarlyList() {
		return fundingDao.indexEarlyList();
	}
	@Override
	public List<Funding> indexlikelist() {
		return fundingDao.indexlikelist();
	}
	@Override
	public List<Funding> indexfundingRefresh() {
		return fundingDao.indexfundingRefresh();
	}
	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		return fundingDao.fundingList(map);
	}

	@Override
	public int selectFundingListTotalContents(Map<String, Object> map) {
		return fundingDao.selectFundingListTotalContents(map);
	}
	
	@Override
	public List<Map<String, String>> selectCategoryList() {
		return fundingDao.selectCategoryList();
	}
	
	@Override
	public List<Funding> earlyList(Map<String, Object> map) {
		return fundingDao.earlyList(map);
	}

	//천호현
	@Override
	public Funding selectOneFunding(int funding_no) {
		return fundingDao.selectOneFunding(funding_no);
	}
	@Override
	public int selectOneFunding2(int funding_no) {
		return fundingDao.selectOneFunding2(funding_no);
	}

	

	

	
	
}
