package com.kh.interactFunding.funding.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Comment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingBoard;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.FundingParticipation;
import com.kh.interactFunding.funding.model.vo.FundingParticipationCollection;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.vo.Point;
import com.kh.interactFunding.schedule.vo.EarlyStartMessage;
import com.kh.interactFunding.websocket.vo.MessageVo;


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
	int insertNews(FundingBoard fundingBoard);
	int updateNews(FundingBoard fundingBoard);
	int deleteNews(int no);
	int deleteComment(Comment comment);
	List<FundingParticipation> participationSelectOne(int fundingNo);
	int fundingParticipationCountOne(int fundingNo);
	List<FundingParticipation> participationList(int fundingNo);
	
	
	//배기원
	public List<Funding> indexfundingList();
	List<Funding> indexlikelist();
	List<Funding> indexfundingRefresh();
	List<Funding> indexRankingviewlist();
	List<Funding> indexearlyList();
	String selectMyListJson(int memberNo);
	int deleteMyListJson(Map<String, Object> param);
	int insertMyListJson(Map<String, Object> param);
	
		
	//이승우
	public List<Funding> fundingList(Map<String, Object> map);
	public int selectFundingListTotalContents(Map<String, Object> map);
	public List<Funding> fundingListBanner();
	public List<Funding> earlyList(Map<String, Object> map);
	public int selectEarlyListTotalContents();
	public List<Funding> earlyListBanner();

	
	//천호현
	public FundingExt selectOneFunding(int fundingNo);
	
	
	int fundingParticipationCount(int fundinNo);
	Map<String, Object> likeCheck(Map<String, Object> map);
	Map<String, Object> alramCheck(Map<String, Object> map);
	int insertLike(Map<String, Object> map);
	int insertAlram(Map<String, Object> map);
	int updateLike(Map<String, Object> result);
	int updateAlram(Map<String, Object> result);
	int likeCount(Map<String, Object> map);
	int likeStatusCheck(Map<String, Integer> map);
	int alramStatusCheck(int memberNo);
	List<Reward> selectRewardList(int fundingNo);
	int insertFundingParticipation(FundingParticipation fp);
	int insertChat(MessageVo msg);
	List<MessageVo> selectChatList(int fundingNo);
	int fundingViewCountUp(int fundingNo);
	List<EarlyStartMessage> selectEarlyMemberList();
	int sendAlramMessage(EarlyStartMessage earlyMember);
	

}