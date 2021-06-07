package com.kh.interactFunding.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.interactFunding.funding.model.service.FundingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/funding")
@Slf4j
public class FundingController {
	@Autowired
	private FundingService fundingService;
	
	//김윤수(test)
	
	//김경태 졸리다
	
	//김주연 commit확인
	
	//박요한 push
	
	//배기원(test 해보겠습니다)
	
	//이승우
	//흠흠
	
	//천호현
	@GetMapping("/funding_detail")
	public void fundingDetail() {
		log.debug("funding_detail페이지접속");
	}
	
	@GetMapping("/funding_reward")
	public void fundingReward() {
		log.debug("funding_reward페이지접속");
	}
	
	
	
	
	
	
}
