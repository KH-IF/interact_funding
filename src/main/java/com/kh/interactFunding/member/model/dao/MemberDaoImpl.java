package com.kh.interactFunding.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;

	//김윤수
	@Override
	public int selectEmailCheck(Map<String, Object> map) {
		log.debug("map@dao = {}",map);
		return session.selectOne("member.selectEmailCheck", map);
	}

	@Override
	public int insertMemberIf(Member member) {
		return session.insert("member.insertMemberIf", member);
	}

	@Override
	public Member selectOneMember(Member member) {
		return session.selectOne("member.selectOneMember",member);
	}
	
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	//이승우
	
	//천호현
}
