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

	@Override
	public int insertCertificationCode(Map<String, Object> param) {
		return memberDao.insertCertificationCode(param);
	}
	
	@Override
	public Map<String, String> selectOneCertification(Member member) {
		return memberDao.selectOneCertification(member);
	}
	
	@Override
	public int changePassword(Map<String, Object> map) {
		int result=0;
		//map에 담긴정보 = (code = int 인증코드 , memberNo = int 멤버넘버, password = 비크립트처리된 비밀번호)
		//비밀번호 변경처리
		result = memberDao.changePassword(map);
		
		//인증코드 삭제 처리
		result = memberDao.deleteCertificationCode(map);
		return result;
	}
	
	@Override
	public Member selectOneMemberKakao(Member m) {
		return memberDao.selectOneMemberKakao(m);
	}
	
	@Override
	public int insertMemberKakao(Member member) {
		return memberDao.inserMemberKakao(member);
	}
	
	@Override
	public int selectOneBlackList(Member member) {
		return memberDao.selectOneBlackList(member);
	}
	
	// 김경태


	// 김주연
	@Override
	public int savePhone(Map<String, Object> map) {
		return memberDao.savePhone(map);
	}
	// 박요한


	// 배기원

	// 이승우

	// 천호현

	@Override
	public String selectOneMemberPoint(int memberNo) {
		return memberDao.selectOneMemberPoint(memberNo);
	}
	

}
