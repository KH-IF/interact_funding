package com.kh.interactFunding.funding.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.interactFunding.funding.model.service.FundingService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("funding")
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
	
	@PostMapping("/maker/insertMakerInfo")
	public String insertMakerInfo(@RequestBody Object makerInfo, RedirectAttributes d ) {
		try {
			log.debug("makerInfo={}",makerInfo);
			
			//int result = fundingService.insertmakerInfo(makerInfo);
			Map<String,Object> map  = new HashMap<String, Object>();
			map.put("msg", "메뉴등록 성공");
			return "/maker/fundingStart2";
		} catch (Exception e) {
			log.error("makerInfo 등록 오류",e);
			throw e;
		}
	}
	
	@GetMapping("/maker/fundingStart2")
	public void fundingStart2() {}
	
	//박요한 push
	
	//배기원(test 해보겠습니다)
	
	//이승우
	//흠흠
	
	//천호현
	//충돌테스트
}
