package com.kh.interactFunding.funding.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.funding.model.dao.FundingDao;
import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Comment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingBoard;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.FundingParticipationCollection;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.vo.Point;

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
	@Override
	public List<Point> selectMyPointList(int memberNo) {
		return fundingDao.selectMyPointList(memberNo);
	}
	@Override
	public List<Integer> selectMyParticiFunding(int memberNo) {
		return fundingDao.selectMyParticiFunding(memberNo);
	}
	@Override
	public FundingParticipationCollection selectOneFundingParticipationCollection(Map<String, Object> param) {
		return fundingDao.selectOneFundingParticipationCollection(param);
	}
	@Override
	public int cancelReward(int no) {
		return fundingDao.cancelReward(no);
	}
	//김경태
	
	//김주연
	// fundingStart1에서 필요. 작성중인 펀딩 리스트를 불러옴
	@Override
	public List<FundingExt> statusNList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.statusNList(memberNo);
		
		for(FundingExt funding: fundingList) {
			Attachment attach = fundingDao.selectOneAttach(funding.getFundingNo());
			if(attach == null) {				
				attach = new Attachment();
				attach.setRenamedFilename("image-not-found.jpg");					
			}
			funding.setAttachment(attach);
		}
		
		return fundingList;
	}
	// fundingStart1에서 필요. 작성완료한 펀딩리스트를 불러옴
	@Override
	public List<FundingExt> statusYList(int memberNo) {
		
		List<FundingExt> fundingList = fundingDao.statusYList(memberNo);
		
		for(FundingExt funding: fundingList) {
			Attachment attach = fundingDao.selectOneAttach(funding.getFundingNo());
			if(attach == null) {				
				attach = new Attachment();
				attach.setRenamedFilename("image-not-found.jpg");					
			}
			funding.setAttachment(attach);
		}
		
		return fundingList;
	}
	//fundingStart1에서 필요. 현재 진행중인 펀딩 리스트
	@Override
	public List<FundingExt> nowList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.nowList(memberNo);
		
		for(FundingExt funding: fundingList) {
			Attachment attach = fundingDao.selectOneAttach(funding.getFundingNo());
			if(attach == null) {				
				attach = new Attachment();
				attach.setRenamedFilename("image-not-found.jpg");					
			}
			funding.setAttachment(attach);
		}
		
		return fundingList;
	}
	//fundingStart1에서 필요. 진행완료한 펀딩 리스트
	@Override
	public List<FundingExt> finishList(int memberNo) {
		List<FundingExt> fundingList = fundingDao.finishList(memberNo);
		for(FundingExt funding: fundingList) {
			Attachment attach = fundingDao.selectOneAttach(funding.getFundingNo());
			if(attach == null) {				
				attach = new Attachment();
				attach.setRenamedFilename("image-not-found.jpg");					
			}
			funding.setAttachment(attach);
		}
		
		return fundingList;
	}
	//newFunding에서 필요. 펀딩을 새로만들때 FundingNo만 새로 부여
	@Override
	public int ready1FundingInsertNo(Funding funding) {
		return fundingDao.ready1FundingInsertNo(funding);
	}
	//ready1Funding에서 필요. 펀딩 작성이 어디까지 되었는지 확인하기위함.
	@Override
	public FundingExt selectCheckFunding(int fundingNo) {
		FundingExt funding = fundingDao.selectCheckFunding(fundingNo);
		funding.setAttachment(fundingDao.selectOneAttach(fundingNo));
		return funding;
	}
	//saveCharge에서 필요. 요금제 저장
	@Override
	public int saveCharge(Map<String, Object> param) {
		return fundingDao.saveCharge(param);
	}
	
	//saveBasicInfo에서 필요. 기본정보 저장 
	@Override
    public int saveBasicInfo(FundingExt funding) {
        int result = 0;
        result = fundingDao.saveBasicInfo(funding);
        //log.debug("funding = {}",funding);
        
        Attachment attach = funding.getAttachment();
        //attachment 등록 
        if(attach.getNo() != 0) { 
        	//attachment를 등록했던적이 있는 경우
             attach.setFundingNo(funding.getFundingNo()); //이번에 발급받은 funindg pk|  attach no fk세팅
             int fundingNo = attach.getFundingNo();
             //새로 메인 이미지를 등록했을 이전의 이미지의 status를 N으로 바꿈
             result = updateAttachment(fundingNo);
             //새로 메인 이미지를 등록함.
             result = insertAttachment(attach);
        }else {
        	attach.setFundingNo(funding.getFundingNo()); //이번에 발급받은 funindg pk|  attach no fk세팅
        	//등록한 적 없는 경우
        	result = insertAttachment(attach);        	
        }
        
        return result;
    }
	//saveBasicInfo에서 사용되는 메서드
	@Override
	public int updateAttachment(int fundingNo) {
		return fundingDao.updateAttachment(fundingNo);		
	}
	//saveBasicInfo에서 사용되는 메서드
	@Override
	public int insertAttachment(Attachment attach) {
		return fundingDao.insertAttachment(attach);
	}
	//스토리 저장
	@Override
	public int saveStory(FundingExt funding) {
		return fundingDao.saveStory(funding);
	}
	//ready1Funding, ready5Reward에서 필요 리워드 리스트 불러오기
	@Override
	public List<Reward> loadReward(int fundingNo) {
		return fundingDao.loadReward(fundingNo);
	}
	//selectOneReward에서 필요. reward 수정에서 값을 뿌려주기 위한 메소드
	@Override
	public Reward selectOneReward(int rewardNo) {
		return fundingDao.selectOneReward(rewardNo);
	}
	//리워드 값 삽입
	@Override
	public int insertReward(Reward reward) {
		return fundingDao.insertReward(reward);
	}
	//리워드 값 수정
	@Override
	public int updateReward(Reward reward) {
		return fundingDao.updateReward(reward);
	}
	//리워드 삭제
	@Override
	public int deleteReward(int rewardNo) {
		return fundingDao.deleteReward(rewardNo);
	}

	//최종제출시에 status컬럼 Y로 바꿈
	@Override
	public int finalSubmit(int fundingNo) {
		return fundingDao.finalSubmit(fundingNo);
	}
	//최종제출하기 완료를 한 상태에서 수정해서 미완성일때 -> status N으로 바꾸어줌
	@Override
	public int finalNSubmit(int fundingNo) {
		return fundingDao.finalNSubmit(fundingNo);
	}
	//existFunding,ready3BasicInfo,ready4Story에서 필요
	//fundingNo로 펀딩정보 불러오기
	@Override
	public FundingExt loadFunding(int fundingNo) {
		FundingExt funding = fundingDao.loadFunding(fundingNo);
		funding.setAttachment(fundingDao.selectOneAttach(fundingNo));
		return funding;
	}
	//펀딩 삭제하기
	@Override
	public int deleteFunding(int fundingNo) {
		return fundingDao.deleteFunding(fundingNo);
	}
	

	
	
	
	
	
	//박요한
	@Override
	public List<FundingBoard> selectNewsList(int fundingNo){
		return fundingDao.selectNewsList(fundingNo);
	}
	
	@Override
	public FundingBoard selectOneNews(int no) {
		return fundingDao.selectOneNews(no);
	}
	
	@Override
	public List<Comment> selectCommentList(int fundingNo) {
		return fundingDao.selectCommentList(fundingNo);
	}
	
	@Override
	public int insertComment(Comment comment) {
		return fundingDao.insertComment(comment);
	}
	
	
	
	// 배기원
	/**
	 * 펀딩 리스트를 받아오는(1~3) 객체입니다.
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
	public List<Funding> earlyList(Map<String, Object> map) {
		return fundingDao.earlyList(map);
	}

	@Override
	public int selectEarlyListTotalContents() {
		return fundingDao.selectEarlyListTotalContents();
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
