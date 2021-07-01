package com.kh.interactFunding.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.interactFunding.member.model.vo.Member;

public interface AdminService {

	public List<Member> selectMemberList(Map<String, Object> map);

	public int selectMemberListTotalContents(Map<String, Object> map);

	public int addAdminRole(int memberNo);

	public int removeAdminRole(int memberNo);

	public int selectCheckAdminRole(int memberNo);

	public int memberDel(int memberNo);

	public List<Member> selectBlackList(Map<String, Object> map);

	public int selectBlackListTotalContents();

	public int insertBlackList(Member member);

	public int deleteBlackList(String email);

}
