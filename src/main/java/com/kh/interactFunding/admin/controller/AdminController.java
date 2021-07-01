package com.kh.interactFunding.admin.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.interactFunding.admin.model.service.AdminService;
import com.kh.interactFunding.common.util.PageBarUtils;
import com.kh.interactFunding.member.model.service.MemberService;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
@SessionAttributes({ "loginMember" })
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;

	// 김윤수

	// 박요한

	// 배기원

	// 이승우
	@GetMapping("/memberList")
	public ModelAndView memberList(ModelAndView mav,
			@RequestParam(required = false, defaultValue = "") String searchType,
			@RequestParam(required = false, defaultValue = "") String searchKeyword,
			@RequestParam(required = false, defaultValue = "1") int cPage, HttpServletRequest request) {
		try {
			final int limit = 5;
			final int offset = (cPage - 1) * limit;
			Map<String, Object> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchKeyword", searchKeyword);
			map.put("limit", limit);
			map.put("offset", offset);
			// 업무로직
			List<Member> list = adminService.selectMemberList(map);
			int totalContents = adminService.selectMemberListTotalContents(map);

			for (Member m : list) {
				log.debug("권한 = {}", m.getAuthorities());
			}

			String url = request.getRequestURI() + "?searchType=" + searchType + "&searchKeyword=" + searchKeyword;
			String pageBar = PageBarUtils.getPageBar(totalContents, cPage, limit, url);
			log.debug("map" + map);

			// jsp로 위임
			mav.addObject("list", list);
			mav.addObject("map", map);
			mav.addObject("pageBar", pageBar);
			mav.addObject("totalContents", totalContents);

			return mav;
		} catch (Exception e) {
			log.debug("회원 조회 오류");
			throw e;
		}
	}


	// 회원권한 추가할때
	@PostMapping("addAdminRole")
	public String addAdminRole(@RequestParam int memberNo, Authentication oldAuthentication,
			@SessionAttribute Member loginMember, HttpServletRequest request) {
		int result = adminService.selectCheckAdminRole(memberNo);

		// 어드민롤이 기존에 있을경우
		if (result > 0) {
			return "redirect:/admin/memberList";
		}
		// 권한 dB에 추가
		result = adminService.addAdminRole(memberNo);
		//내정보를 수정할경우
		if (memberNo == loginMember.getMemberNo()) {

			// 기존 권한 불러오기
			List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
			for (GrantedAuthority auth : oldAuthentication.getAuthorities()) {
				SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(auth.getAuthority());
				authorities.add(simpleGrantedAuthority);
			}
			// 로긴멤버에 권한추가
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			loginMember.setAuthorities(authorities);
			request.getSession().setAttribute("loginMember", loginMember);
			// security권한 추가
			Authentication newAuthentication = new UsernamePasswordAuthenticationToken(loginMember,
					oldAuthentication.getCredentials(), authorities);
			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		}
		return "redirect:/admin/memberList";
	}

	// 회원권한 삭제할때
	@PostMapping("removeAdminRole")
	public String removeAdminRole(@RequestParam int memberNo, Authentication oldAuthentication,
			@SessionAttribute Member loginMember, HttpServletRequest request) {

		int result = adminService.removeAdminRole(memberNo);

		//내 정보를수정할 경우
		if(memberNo==loginMember.getMemberNo()) {
			List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
			loginMember.setAuthorities(authorities);
			request.getSession().setAttribute("loginMember", loginMember);
			
			Authentication newAuthentication = new UsernamePasswordAuthenticationToken(loginMember,
					oldAuthentication.getCredentials(), authorities);
			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		}

		return "redirect:/admin/memberList";
	}

	// 회원 추방할때
	@PostMapping("memberDel")
	public String memberDel(@RequestParam int memberNo, HttpServletRequest request, HttpServletResponse response,@SessionAttribute Member loginMember) {
		
		//회원 단순 추방 - > 블랙리스트 사용함으로써 더이상 사용하지 않음
//		int result = adminService.memberDel(memberNo);
		
		Member member = memberService.selectOneMemberUseNo(memberNo);
		int result = adminService.insertBlackList(member);
		
		
		// 본인을 추방할경우.
		if(memberNo==loginMember.getMemberNo()) {
			// loginMember == null; --세션
			request.getSession().setAttribute("loginMember", null);
			// 세션도 삭제
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null && auth.isAuthenticated()) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
		}
		return "redirect:/admin/memberList";
	}

	@GetMapping("blackList")
	public ModelAndView blackList(ModelAndView mav,
			@RequestParam(required = false, defaultValue = "1") int cPage, HttpServletRequest request
			) {
		try {
			final int limit = 5;
			final int offset = (cPage - 1) * limit;
			Map<String, Object> map = new HashMap<>();
			map.put("limit", limit);
			map.put("offset", offset);
			// 업무로직
			List<Member> list = adminService.selectBlackList(map);
			int totalContents = adminService.selectBlackListTotalContents();
			String url = request.getRequestURI();
			
			String pageBar = PageBarUtils.getPageBar(totalContents, cPage, limit, url);
			
			// jsp 위임
			mav.addObject("totalContents", totalContents);
			mav.addObject("pageBar", pageBar);
			mav.addObject("list", list);
			mav.addObject("map", map);
			
			return mav;
		} catch(Exception e) {
			log.debug("블랙리스트 조회 오류");
			throw e;
		}
	}
	
	@PostMapping("blackListDel")
	public String blackListDel(@RequestParam String email, HttpServletRequest request, HttpServletResponse response,@SessionAttribute Member loginMember) {
		
		int result = adminService.deleteBlackList(email);
		
		return "redirect:/admin/blackList";
	}
	// 천호현

}
