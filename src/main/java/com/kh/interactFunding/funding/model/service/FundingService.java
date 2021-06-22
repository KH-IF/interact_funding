package com.kh.interactFunding.funding.model.service;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Comment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingBoard;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.FundingParticipationCollection;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.vo.Point;


public interface FundingService {
	
	//김윤수
	List<Integer> selectMyLikeNoList(int memberNo);
	Funding selectOneFundingKYS(int no);
	int selectMyPartiCnt(int memberNo);
	int selectMyCreateCnt(int memberNo);
	List<Point> selectMyPointList(int memberNo);
	List<Integer> selectMyParticiFunding(int memberNo);
	FundingParticipationCollection selectOneFundingParticipationCollection(Map<String, Object> param);
	int cancelReward(int no);
	
	
	//김경태
	
	//김주연
	List<FundingExt> statusYList(int memberNo);
	List<FundingExt> statusNList(int memberNo);
	List<FundingExt> nowList(int memberNo);
	List<FundingExt> finishList(int memberNo);	
	int ready1FundingInsertNo(Funding funding);
	FundingExt selectCheckFunding(int fundingNo);
	int saveCharge(Map<String, Object> param);
	int saveBasicInfo(FundingExt funding);
	int insertAttachment(Attachment attach);
	int updateAttachment(int fundingNo);
	int saveStory(FundingExt funding);
	List<Reward> loadReward(int fundingNo);
	Reward selectOneReward(int rewardNo);
	int insertReward(Reward reward);
	int updateReward(Reward reward);
	int deleteReward(int rewardNo);
	int finalSubmit(int fundingNo);
	int finalNSubmit(int fundingNo);
	int deleteFunding(int fundingNo);
	FundingExt loadFunding(int fundingNo);
	
	
	
	//박요한
	List<FundingBoard> selectNewsList(int fundingNo);
	FundingBoard selectOneNews(int no);
	List<Comment> selectCommentList(int fundingNo);
	int insertComment(Comment comment);
	
	
	//배기원
	public List<Funding> indexfundingList();
	List<Funding> indexviewlist();
	List<Funding> indexlikelist();
	List<Funding> indexfundingRefresh();
	List<Funding> indexRankingviewlist();
	
		
	//이승우
	public List<Funding> fundingList(Map<String, Object> map);
	public int selectFundingListTotalContents(Map<String, Object> map);
	public List<Funding> earlyList(Map<String, Object> map);
	public int selectEarlyListTotalContents();

	
	//천호현
	public FundingExt selectOneFunding(int fundingNo);
	
	
	int fundingParticipationCount(int fundinNo);
	Map<String, Object> likeCheck(Map<String, Object> map);
	int insertLike(Map<String, Object> map);
	int updateLike(Map<String, Object> result);
	int likeCount(Map<String, Object> map);
	int likeStatusCheck(int membeNo);
	List<Reward> selectRewardList(int fundingNo);
	

}
