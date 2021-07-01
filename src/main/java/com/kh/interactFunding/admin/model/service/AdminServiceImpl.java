package com.kh.interactFunding.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.admin.model.dao.AdminDao;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	//김윤수
	
	//박요한
		
	//배기원
		
	//이승우
	@Override
	public List<Member> selectMemberList(Map<String, Object> map) {
		return adminDao.selectMemberList(map);
	}

	@Override
	public int selectMemberListTotalContents(Map<String, Object> map) {
		return adminDao.selectMemberListTotalContents(map);
	}

	@Override
	public int addAdminRole(int memberNo) {
		return adminDao.addAdminRole(memberNo);
	}

	@Override
	public int removeAdminRole(int memberNo) {
		return adminDao.removeAdminRole(memberNo);
	}

	@Override
	public int selectCheckAdminRole(int memberNo) {
		return adminDao.selectCheckAdminRole(memberNo);
	}

	@Override
	public int memberDel(int memberNo) {
		return adminDao.memberDel(memberNo);
	}

	@Override
	public List<Member> selectBlackList(Map<String, Object> map) {
		return adminDao.selectBlackList(map);
	}

	@Override
	public int selectBlackListTotalContents() {
		return adminDao.selectBlackListTotalContents();
	}

	@Override
	public int insertBlackList(Member member) {
		return adminDao.insertBlackList(member);
	}

	@Override
	public int deleteBlackList(String email) {
		return adminDao.deleteBlackList(email);
	}
		
	
	
	//천호현
	
}
