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
		
	//천호현
	
}
