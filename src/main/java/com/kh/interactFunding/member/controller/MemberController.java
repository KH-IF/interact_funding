package com.kh.interactFunding.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.interactFunding.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	//김윤수
	
	@GetMapping("memberList")
	public String memberList() {
		log.info("index 페이지 요청");
		return "forward:/index.jsp";
	}
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	//이승우
	
	//천호현
	
	@GetMapping("memberList")
	public String hocheon() {
		log.info("테스트 깃");
		log.info("테스트 충돌테스트");
		log.debug("김윤수님");
		return "forward:/index.jsp";
	}
	
}
