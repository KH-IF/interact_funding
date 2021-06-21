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
	@Override
	public List<Integer> selectMyLikeNoList(int memberNo) {
		return fundingDao.selectMyLikeNoList(memberNo);
	}
	@Override
	public Funding selectOneFundingKYS(int no) {
		Funding funding = fundingDao.selectOneFundingKYS(no);
		funding.setAttachment(fundingDao.selectOneAttach(no));
		return funding;
	}
	@Override
	public int selectMyPartiCnt(int memberNo) {
		return fundingDao.selectMyPartiCnt(memberNo);
	}
	@Override
	public int selectMyCreateCnt(int memberNo) {
		return fundingDao.selectMyCreateCnt(memberNo);
	}
	//김경태
	
	//김주연
	@Override
	public List<FundingExt> statusYList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.statusYList(memberNo);
		
		for(FundingExt funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public List<FundingExt> statusNList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.statusNList(memberNo);
		
		for(FundingExt funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public List<FundingExt> nowList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.nowList(memberNo);
		
		for(FundingExt funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public List<FundingExt> finishList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.finishList(memberNo);
		
		for(FundingExt funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public int ready1FundingInsertNo(Funding funding) {
		return fundingDao.ready1FundingInsertNo(funding);
	}
	@Override
	public FundingExt selectCheckFunding(int fundingNo) {
		FundingExt funding = fundingDao.selectCheckFunding(fundingNo);
		funding.setAttachment(fundingDao.selectOneAttach(fundingNo));
		return funding;
	}
	@Override
	public int saveCharge(Map<String, Object> param) {
		return fundingDao.saveCharge(param);
	}
	
	
	@Override
    public int saveBasicInfo(FundingExt funding) {
        int result = 0;
        result = fundingDao.saveBasicInfo(funding);
        log.debug("funding = {}",funding);
        
        //attachment 등록
        if(funding.getAttachment() == null) {
//            Attachment attach = funding.getAttachment(); 
//            attach.setFundingNo(funding.getFundingNo()); //이번에 발급받은 funindg pk|  attach no fk세팅
//            result = insertAttachment(attach);
//            log.debug("attach={}",attach);
        } else {
        	 Attachment attach =funding.getAttachment();
             attach.setFundingNo(funding.getFundingNo()); //이번에 발급받은 funindg pk|  attach no fk세팅
             int fundingNo = attach.getFundingNo();
             result = updateAttachment(fundingNo);
             result = insertAttachment(attach);
        }
        
        return result;
    }
	@Override
	public int updateAttachment(int fundingNo) {
		return fundingDao.updateAttachment(fundingNo);		
	}
	@Override
	public int insertAttachment(Attachment attach) {
		return fundingDao.insertAttachment(attach);
	}
	@Override
	public int saveStory(FundingExt funding) {
		return fundingDao.saveStory(funding);
	}
	@Override
	public List<Reward> loadReward(int fundingNo) {
		return fundingDao.loadReward(fundingNo);
	}
	
	@Override
	public Reward selectOneReward(int rewardNo) {
		return fundingDao.selectOneReward(rewardNo);
	}
	@Override
	public int insertReward(Reward reward) {
		return fundingDao.insertReward(reward);
	}
	@Override
	public int updateReward(Reward reward) {
		return fundingDao.updateReward(reward);
	}
	@Override
	public int deleteReward(int rewardNo) {
		return fundingDao.deleteReward(rewardNo);
	}

	
	@Override
	public int finalSubmit(int fundingNo) {
		return fundingDao.finalSubmit(fundingNo);
	}
	@Override
	public int finalNSubmit(int fundingNo) {
		return fundingDao.finalNSubmit(fundingNo);
	}
	@Override
	public FundingExt loadFunding(int fundingNo) {
		FundingExt funding = fundingDao.loadFunding(fundingNo);
		funding.setAttachment(fundingDao.selectOneAttach(fundingNo));
		return funding;
	}
	@Override
	public int deleteFunding(int fundingNo) {
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
		List<Funding> fundingList = fundingDao.indexfundingList();
		
		for(Funding funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public List<Funding> indexfundinglike() {
		List<Funding> fundingList = fundingDao.indexfundinglike();
		
		for(Funding funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public List<Funding> indexviewlist() {
		List<Funding> fundingList = fundingDao.indexviewlist();
		
		for(Funding funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	@Override
	public int indexTotalContents() {
		return fundingDao.indexTotalContents();
	}
//	@Override
//	public List<Funding> indexEarlyList() {
//		return fundingDao.indexEarlyList();
//	}
	@Override
	public List<Funding> indexlikelist() {
		return fundingDao.indexlikelist();
	}
	@Override
	public List<Funding> indexfundingRefresh() {
		List<Funding> fundingList = fundingDao.indexfundingRefresh();
		
		for(Funding funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}
	
	
	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		List<Funding> fundingList = fundingDao.fundingList(map);
		
		for(Funding funding: fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));	
		}
		
		return fundingList;
	}

	@Override
	public int selectFundingListTotalContents(Map<String, Object> map) {
		return fundingDao.selectFundingListTotalContents(map);
	}
	
	@Override
	public List<Funding> earlyList() {
		return fundingDao.earlyList();
	}

	//천호현
	/*
	 * @Override public FundingExt selectOneFunding(int fundingNo) { return
	 * fundingDao.selectOneFunding(fundingNo); }
	 */
	
	@Override
	public FundingExt selectOneFunding(int fundingNo) {
		FundingExt funding = fundingDao.selectOneFunding(fundingNo);
		funding.setAttachment(fundingDao.selectOneAttach(fundingNo));
		return funding;
	}
	
	@Override
	public int fundingParticipationCount(int fundingNo) {
		return fundingDao.fundingParticipationCount(fundingNo);
	}
	@Override
	public Map<String, Object> likeCheck(Map<String, Object> map) {
		return fundingDao.likeCheck(map);
	}
	@Override
	public int insertLike(Map<String, Object> map) {
		return fundingDao.insertLike(map);
	}
	@Override
	public int updateLike(Map<String, Object> map) {
		return fundingDao.updateLike(map);
	}
	@Override
	public int likeCount(Map<String, Object> map) {
		return fundingDao.likeCount(map);
	}
	@Override
	public int likeStatusCheck(int memberNo) {
		return fundingDao.likeStatusCheck(memberNo);
	}
	@Override
	public List<Reward> selectRewardList(int fundingNo) {
		return fundingDao.selectRewardList(fundingNo);
	}
	

	

	
	
}
