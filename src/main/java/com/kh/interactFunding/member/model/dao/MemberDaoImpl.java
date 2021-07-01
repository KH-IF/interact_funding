package com.kh.interactFunding.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.member.model.vo.Coupon;
import com.kh.interactFunding.member.model.vo.Member;
import com.kh.interactFunding.member.model.vo.Msg;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate session;

	// 김윤수
	@Override
	public int selectEmailCheck(Map<String, Object> map) {
		log.debug("map@dao = {}", map);
		return session.selectOne("member.selectEmailCheck", map);
	}

	@Override
	public int insertMemberIf(Member member) {
		return session.insert("member.insertMemberIf", member);
	}

	@Override
	public Member selectOneMember(Member member) {
		log.debug("member.email={}",member.getEmail());
		return session.selectOne("member.selectOneMember", member);
	}

	@Override
	public int insertPoint(Map<String, Object> map) {
		return session.insert("member.insertPoint",map);
	}

	@Override
	public Coupon selectOneCoupon(Map<String, Object> map) {
		return session.selectOne("member.selectOneCoupon",map);
	}

	@Override
	public int selectCouponRecordCheck(Map<String, Object> map) {
		return session.selectOne("member.selectCouponRecordCheck",map);
	}

	@Override
	public int insertCoupon(Map<String, Object> map) {
		return session.insert("member.insertCoupon",map);
	}

	@Override
	public List<Msg> selectReceiveMsg(Member loginMember) {
		return session.selectList("member.selectReceiveMsg", loginMember);
	}

	@Override
	public List<Msg> selectSendMsg(Member loginMember) {
		return session.selectList("member.selectSendMsg", loginMember);
	}

	@Override
	public Member selectOneMemberUseNo(int toMemberNo) {
		return session.selectOne("member.selectOneMemberUseNo",toMemberNo);
	}

	@Override
	public int sendMsg(Msg msg) {
		return session.insert("member.sendMsg",msg);
	}

	@Override
	public int msgReadStatusChg(int no) {
		return session.update("member.msgReadStatusChg",no);
	}
	
	@Override
	public int insertCertificationCode(Map<String, Object> param) {
		return session.insert("member.insertCertificationCode", param);
	}
	
	@Override
	public Map<String, String> selectOneCertification(Member member) {
		return session.selectOne("member.selectOneCertification", member);
	}

	@Override
	public int changePassword(Map<String, Object> map) {
		return session.update("member.changePassword",map);
	}

	@Override
	public int deleteCertificationCode(Map<String, Object> map) {
		return session.delete("member.deleteCertificationCode",map);
	}
	
	@Override
	public Member selectOneMemberKakao(Member m) {
		return session.selectOne("member.selectOneMemberKakao",m);
	}
	
	@Override
	public int inserMemberKakao(Member member) {
		return session.insert("member.insertMemberKakao",member);
	}
	
	@Override
	public int selectOneBlackList(Member member) {
		return session.selectOne("member.selectOneBlackList",member);
	}
	
	

	// 김경태

	// 김주연
	@Override
	public int savePhone(Map<String, Object> map) {
		return session.update("member.savePhone",map);
	}
	// 박요한


	// 배기원

	// 이승우

	// 천호현

	@Override
	public String selectOneMemberPoint(int memberNo) {
		return session.selectOne("member.selectOneMemberPoint",memberNo);
	}
	
}
