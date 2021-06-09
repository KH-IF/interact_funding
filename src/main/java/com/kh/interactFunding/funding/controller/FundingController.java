package com.kh.interactFunding.funding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Funding;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/funding")
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
	@GetMapping("/news.do")
	public void news() {
		
	}
	
	@GetMapping("/community.do")
	public void community() {
		
	}
	
	@GetMapping("/supporter.do")
	public void supporter() {
		
	}
	
	@GetMapping("newsView.do")
	public void newsView() {
		
	}
	
	//배기원(test 해보겠습니다)
	
	//이승우
	//흠흠
	@GetMapping("/fundingList")
	public ModelAndView fundingList(
			ModelAndView mav,
			@RequestParam(required = false, defaultValue = "") String searchKeyword,
			@RequestParam(required = false, defaultValue = "") String searchSelect1,
			@RequestParam(required = false, defaultValue = "") String searchSelect2
		) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchSelect1", searchSelect1);
		map.put("searchSelect2", searchSelect2);
		log.debug("searchTitle = {}", searchKeyword);
		
		// 업무로직
		try {
			List<Funding> list = fundingService.fundingList(map);
			System.out.println("list"+list);
			log.debug("list = {}", list);
			//jsp에 위임
			mav.addObject("list", list);
			
			return mav;
		}
		catch(Exception e){
			log.error("fundingList 조회 오류");
			throw e;
		}
	}
	
	@GetMapping("/earlyList")
	public void earlyList() {
		
	}
	
	//천호현
	@GetMapping("/fundingDetail")
	public void fundingDetail(@RequestParam int funding_no, Model model) {
		//1. 업무로직
		Funding funding = fundingService.selectOneFunding(funding_no);
		log.debug("funding = {}" , funding);
		//2. 위임
		model.addAttribute("funding", funding);
		
	}
	
	
	@GetMapping("/fundingReward")
	public void fundingReward() {
	}
	@GetMapping("/fundingChatMaker")
	public void fundingChatMaker() {
	}
	@GetMapping("/fundingPayment")
	public void fundingPayment() {
	}
	@GetMapping("/fundingFindAddress")
	public void fundingFindAddress() {
	}
	
	
}
