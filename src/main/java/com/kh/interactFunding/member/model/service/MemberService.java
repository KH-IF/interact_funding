package com.kh.interactFunding.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.member.model.vo.Coupon;
import com.kh.interactFunding.member.model.vo.Member;
import com.kh.interactFunding.member.model.vo.Msg;

public interface MemberService {

	// 김윤수
	int selectEmailCheck(Map<String, Object> map);

	int insertMemberIf(Member member);

	Member selectOneMember(Member member);

	int insertPoint(Map<String, Object> map);

	Coupon selectOneCoupon(Map<String, Object> map);

	int selectCouponRecordCheck(Map<String, Object> map);

	int insertCoupon(Map<String, Object> map);

	List<Msg> selectReceiveMsg(Member loginMember);

	List<Msg> selectSendMsg(Member loginMember);

	Member selectOneMemberUseNo(int toMemberNo);

	int sendMsg(Msg msg);

	int msgReadStatusChg(int no);

	// 김경태

	// 김주연
	int savePhone(Map<String, Object> map);
	// 박요한

	// 배기원

	// 이승우

	// 천호현
}
