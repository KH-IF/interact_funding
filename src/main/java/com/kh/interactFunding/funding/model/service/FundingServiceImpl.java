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
        if(funding.getAttachment() != null) {
            Attachment attach = new Attachment();
            attach.setFundingNo(funding.getFundingNo()); //이번에 발급받은 funindg pk|  attach no fk세팅
            result = insertAttachment(attach);
            log.debug("attach={}",attach);
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
	
	// 배기원
	/**
	 * 펀딩 리스트를 받아오는 객체입니다.
	 */
	@Override
	public List<Funding> indexfundingList() {
		List<Funding> fundingList = fundingDao.indexfundingList();

		for (Funding funding : fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));
		}

		return fundingList;
	}
	/**
	 * 회원들이 좋아할 프로젝트 (조회순 리스트 1~4)
	 */
	@Override
	public List<Funding> indexviewlist() {
		List<Funding> fundingList = fundingDao.indexviewlist();

		for (Funding funding : fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));
		}
		return fundingList;
	}
	/**
	 * 좋아요 많이받은 순객체 입니다.
	 */
	@Override
	public List<Funding> indexlikelist() {
		List<Funding> fundingList = fundingDao.indexlikelist();

		for (Funding funding : fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));
		}
		return fundingList;
	}
	/**
	 * 새로고침 버튼 Refresh  실시간 html 으로 변경 합니다
	 */
	@Override
	public List<Funding> indexfundingRefresh() {
		List<Funding> fundingList = fundingDao.indexfundingRefresh();

		for (Funding funding : fundingList) {
			funding.setAttachment(fundingDao.selectOneAttach(funding.getFundingNo()));
		}
		return fundingList;
	}
	/**
	 * 실시간 랭킹 조회순(1~6 조회순)입니다.
	 */
	@Override
	public List<Funding> indexRankingviewlist() {
		List<Funding>fundingList=fundingDao.indexRankingviewlist();
		for (Funding funding : fundingList) {
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
	@Override
	public Funding selectOneFunding(int fundingNo) {
		return fundingDao.selectOneFunding(fundingNo);
	}
	@Override
	public int selectOneFunding2(int fundingNo) {
		return fundingDao.selectOneFunding2(fundingNo);
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
	
	

	

	

	
	
}
