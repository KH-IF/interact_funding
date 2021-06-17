package com.kh.interactFunding.member.model.dao;

import java.util.Map;

import com.kh.interactFunding.member.model.vo.Coupon;
import com.kh.interactFunding.member.model.vo.Member;

public interface MemberDao {

	int selectEmailCheck(Map<String, Object> map);

	int insertMemberIf(Member member);

	Member selectOneMember(Member member);

	int insertPoint(Map<String, Object> map);

	Coupon selectOneCoupon(Map<String, Object> map);

	int selectCouponRecordCheck(Map<String, Object> map);

	int insertCoupon(Map<String, Object> map);

	//김윤수
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	//이승우
	
	//천호현
}
