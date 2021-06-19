package com.kh.interactFunding.funding.model.service;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.vo.Member;


public interface FundingService {
	
	//김윤수
	List<Integer> selectMyLikeNoList(int memberNo);
	Funding selectOneFundingKYS(int no);
	
	//김경태
	
	//김주연
	List<FundingExt> statusYList(Member loginMember);
	List<FundingExt> statusNList(Member loginMember);
	int ready1FundingInsertNo(Funding funding);
	FundingExt selectCheckFunding(String fundingNo);
	int saveCharge(Map<String, Object> param);
	int saveBasicInfo(FundingExt funding);
	int insertAttachment(Attachment attach);
	int saveStory(Funding funding);
	List<Reward> loadReward(String fundingNo);
	Reward selectOneReward(String rewardNo);
	int insertReward(Reward reward);
	int updateReward(Reward reward);
	int deleteReward(int rewardNo);
	int finalSubmit(Funding funding);
	int deleteFunding(String fundingNo);
	FundingExt loadFunding(String fundingNo);
	
	//박요한
	List<Funding> fundingNews(int funding_no);
	
	
	//배기원
	public List<Funding> indexfundingList();
	public List<Funding> indexfundinglike();
	//List<Funding> indexEarlyList();
	List<Funding> indexviewlist();
	List<Funding> indexlikelist();
	List<Funding> indexfundingRefresh();
	int indexTotalContents();
	
		
	//이승우
	public List<Funding> fundingList(Map<String, Object> map);
	public int selectFundingListTotalContents(Map<String, Object> map);
	public List<Funding> earlyList();

	
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
