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
	
	@GetMapping("/login")
	public void login() {
		
	}
	@GetMapping("/memberEnroll")
	public void memberEnroll() {
		
	}
	@GetMapping("memberEnroll_if")
	public void memberEnroll_if(){
		
	}
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	//이승우
	
	//천호현
}
