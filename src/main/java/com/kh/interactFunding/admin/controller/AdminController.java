package com.kh.interactFunding.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.interactFunding.admin.model.service.AdminService;
import com.kh.interactFunding.common.util.PageBarUtils;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
@SessionAttributes({"loginMember"})
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//김윤수
	
	//박요한
	
	//배기원
	
	//이승우
	@GetMapping("/memberList")
	public ModelAndView memberList(
			ModelAndView mav,
			@RequestParam(required = false, defaultValue="") String searchType,
			@RequestParam(required = false, defaultValue="") String searchKeyword,
			@RequestParam(required = false, defaultValue="1") int cPage,
			HttpServletRequest request
			) {
		try {
			final int limit = 5;
			final int offset = (cPage - 1) * limit;
			Map<String, Object> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchKeyword", searchKeyword);
			map.put("limit", limit);
			map.put("offset", offset);
			//업무로직
			List<Member> list = adminService.selectMemberList(map);
			int totalContents = adminService.selectMemberListTotalContents(map);
			
			String url = request.getRequestURI() + "?searchType=" + searchType + "&searchKeyword=" + searchKeyword;
			String pageBar = PageBarUtils.getPageBar(totalContents, cPage, limit, url);
			log.debug("map" + map);
			
			//jsp로 위임
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
	
	//천호현
	
}
