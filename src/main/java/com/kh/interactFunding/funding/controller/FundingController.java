package com.kh.interactFunding.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.interactFunding.funding.model.service.FundingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FundingController {
	@Autowired
	private FundingService fundingService;
	
	//김윤수(test)
	
	//김경태 졸리다
	
	//김주연
	@GetMapping("/maker/fundingStart1")
	public void fundingStart1() {
		log.debug("1");
	}

	//박요한 push
	
	//배기원(test 해보겠습니다)
	
	//이승우
	//흠흠
	
	//천호현
	//충돌테스트
}
