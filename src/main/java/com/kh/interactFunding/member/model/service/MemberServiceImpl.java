package com.kh.interactFunding.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.member.model.dao.MemberDao;
import com.kh.interactFunding.member.model.vo.Coupon;
import com.kh.interactFunding.member.model.vo.Member;
import com.kh.interactFunding.member.model.vo.Msg;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	// 김윤수

	@Override
	public int selectEmailCheck(Map<String, Object> map) {
		return memberDao.selectEmailCheck(map);
	}

	@Override
	public int insertMemberIf(Member member) {
		return memberDao.insertMemberIf(member);
	}

	@Override
	public Member selectOneMember(Member member) {
		return memberDao.selectOneMember(member);
	}

	@Override
	public int insertPoint(Map<String, Object> map) {
		return memberDao.insertPoint(map);
	}

	@Override
	public Coupon selectOneCoupon(Map<String, Object> map) {
		return memberDao.selectOneCoupon(map);
	}

	@Override
	public int selectCouponRecordCheck(Map<String, Object> map) {
		return memberDao.selectCouponRecordCheck(map);
	}

	@Override
	public int insertCoupon(Map<String, Object> map) {
		return memberDao.insertCoupon(map);
	}

	@Override
	public List<Msg> selectReceiveMsg(Member loginMember) {
		return memberDao.selectReceiveMsg(loginMember);
	}

	@Override
	public List<Msg> selectSendMsg(Member loginMember) {
		return memberDao.selectSendMsg(loginMember);
	}

	@Override
	public Member selectOneMemberUseNo(int toMemberNo) {
		return memberDao.selectOneMemberUseNo(toMemberNo);
	}

	@Override
	public int sendMsg(Msg msg) {
		return memberDao.sendMsg(msg);
	}

	@Override
	public int msgReadStatusChg(int no) {
		return memberDao.msgReadStatusChg(no);
	}

	
	
	// 김경태

	// 김주연

	// 박요한

	// 배기원

	// 이승우

	// 천호현

}
