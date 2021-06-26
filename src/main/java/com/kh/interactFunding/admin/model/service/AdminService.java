package com.kh.interactFunding.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.member.model.vo.Member;

public interface AdminService {

	public List<Member> selectMemberList(Map<String, Object> map);

	public int selectMemberListTotalContents(Map<String, Object> map);

}
