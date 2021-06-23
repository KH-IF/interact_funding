package com.kh.interactFunding.funding.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
@Repository
public class FundingDaoImpl implements FundingDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	//김윤수
	@Override
	public List<Integer> selectMyLikeNoList(int memberNo){
		return session.selectList("funding.selectMyLikeNoList",memberNo);
	}
	@Override
	public Funding selectOneFundingKYS(int no) {
		return session.selectOne("funding.selectOneFundingKYS",no);
	}
	@Override
	public Attachment selectOneAttach(int no) {
		return session.selectOne("funding.selectOneAttach",no);
	}
	@Override
	public int selectMyPartiCnt(int memberNo) {
		return session.selectOne("funding.selectMyPartiCnt",memberNo);
	}
	@Override
	public int selectMyCreateCnt(int memberNo) {
		return session.selectOne("funding.selectMyCreateCnt",memberNo);
	}
	@Override
	public List<Point> selectMyPointList(int memberNo) {
		return session.selectList("funding.selectMyPointList",memberNo);
	}
	@Override
	public List<Integer> selectMyParticiFunding(int memberNo) {
		return session.selectList("funding.selectMyParticiFunding",memberNo);
	}
	@Override
	public FundingParticipationCollection selectOneFundingParticipationCollection(Map<String, Object> param) {
		return session.selectOne("funding.selectOneFundingParticipationCollection",param);
	}
	@Override
	public int cancelReward(int no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("no", no);
		return session.update("funding.cancelReward",map);
	}
	//김경태
	//김주연
	@Override
	public List<FundingExt> statusYList(int memberNo) {
		return session.selectList("funding.statusYList",memberNo);
	}
	@Override
	public List<FundingExt> statusNList(int memberNo) {
		return session.selectList("funding.statusNList",memberNo);
	}
	@Override
	public List<FundingExt> nowList(int memberNo) {
		return session.selectList("funding.nowList",memberNo);
	}
	@Override
	public List<FundingExt> finishList(int memberNo) {
		return session.selectList("funding.finishList",memberNo);
	}
	@Override
	public FundingExt loadFunding(int fundingNo) {
		return session.selectOne("funding.loadFunding",fundingNo);
	}

	@Override
	public int ready1FundingInsertNo(Funding funding) {
		return session.insert("funding.ready1FundingInsertNo",funding);
	}
	@Override
	public FundingExt selectCheckFunding(int fundingNo) {
		return session.selectOne("funding.selectCheckFunding",fundingNo);
	}
	@Override
	public int saveCharge(Map<String, Object> param) {
		return session.update("funding.saveCharge",param);
	}
	@Override
	public int saveBasicInfo(FundingExt funding) {
		return session.update("funding.saveBasicInfo",funding);
	}
	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("funding.insertAttachment",attach);
	}
	
	@Override
	public int updateAttachment(int fundingNo) {
		return session.update("funding.updateAttachment",fundingNo);
	}
	@Override
	public int saveStory(FundingExt funding) {
		return session.update("funding.saveStory",funding);
	}
	@Override
	public List<Reward> loadReward(int fundingNo) {
		return session.selectList("funding.loadReward",fundingNo);
	}
	
	@Override
	public Reward selectOneReward(int rewardNo) {
		return session.selectOne("funding.selectOneReward",rewardNo);
	}
	@Override
	public int insertReward(Reward reward) {
		return session.insert("funding.insertReward",reward);
	}
	@Override
	public int updateReward(Reward reward) {
		return session.update("funding.updateReward",reward);
	}
	@Override
	public int deleteReward(int rewardNo) {
		return session.delete("funding.deleteReward",rewardNo);
	}
	@Override
	public int finalSubmit(int fundingNo) {
		return session.update("funding.finalSubmit",fundingNo);
	}
	@Override
	public int finalNSubmit(int fundingNo) {
		return session.update("funding.finalNSubmit",fundingNo);
	}
	@Override
	public int deleteFunding(int fundingNo) {
		return session.delete("funding.deleteFunding",fundingNo);
	}

	
	//박요한
	@Override
	public List<FundingBoard> selectNewsList(int fundingNo) {
		return session.selectList("funding.selectNewsList", fundingNo);
	}
	
	@Override
	public FundingBoard selectOneNews(int no) {
		return session.selectOne("funding.selectOneNews", no);
	}
	
	@Override
	public List<Comment> selectCommentList(int fundingNo) {
		return session.selectList("funding.selectCommentList", fundingNo);
	}
	
	@Override
	public int insertComment(Comment comment) {
		return session.insert("funding.insertComment", comment);
	}
	
	
	
	//배기원
	@Override
	public List<Funding> indexfundingList() {
		return session.selectList("funding.indexfundingList");
	}

	@Override
	public List<Funding> indexviewlist() {
		return session.selectList("funding.indexviewlist");
	}
	
	@Override
	public List<Funding> indexlikelist() {
		return session.selectList("funding.indexlikelist");
	}
	
	@Override
	public List<Funding> indexfundingRefresh() {
		return session.selectList("funding.indexfundingRefresh");
	}
	
	@Override
	public List<Funding> indexRankingviewlist() {
		return session.selectList("funding.indexRankingviewlist");
	}
	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		int offset = (int)map.get("offset");
		int limit = (int)map.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit);
		log.debug("map@dap = {}",map);
		return session.selectList("funding.selectFundingList", map, rowBounds);
	}
	
	@Override
	public List<Funding> earlyList(Map<String, Object> map) {
		int offset = (int)map.get("offset");
		int limit = (int)map.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit);
		log.debug("map@dap = {}", map);
		return session.selectList("funding.selectEarlyList", map, rowBounds);
	}
	
	@Override
	public int selectFundingListTotalContents(Map<String, Object> map) {
		return session.selectOne("funding.selectFundingListTotalContents", map);
	}
	
	@Override
	public int selectEarlyListTotalContents() {
		return session.selectOne("funding.selectEarlyListTotalContents");
	}
	
	
	//천호현

	@Override
	public FundingExt selectOneFunding(int fundingNo) {
		return session.selectOne("funding.selectOneFunding", fundingNo);
	}
	@Override
	public int fundingParticipationCount(int fundingNo) {
		return session.selectOne("funding.fundingParticipationCount", fundingNo);
	}
	@Override
	public Map<String, Object> likeCheck(Map<String, Object> map) {
		return session.selectOne("funding.likeCheck",map);
	}
	@Override
	public int insertLike(Map<String, Object> map) {
		return session.insert("funding.insertLike",map);
	}
	@Override
	public int updateLike(Map<String, Object> map) {
		return session.update("funding.updateLike",map);
	}
	@Override
	public int likeCount(Map<String, Object> map) {
		return session.selectOne("funding.likeCount", map);
	}
	@Override
	public int likeStatusCheck(int memberNo) {
		return session.selectOne("funding.likeStatusCheck", memberNo);
	}
	@Override
	public List<Reward> selectRewardList(int fundingNo) {
		return session.selectList("funding.selectRewardList", fundingNo);
	}

	
	
}
