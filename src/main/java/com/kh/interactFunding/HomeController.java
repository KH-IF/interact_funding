package com.kh.interactFunding;

import java.util.List;


import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Funding;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class HomeController {
	@Autowired
	private FundingService fundingService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 펀딩하기
	@RequestMapping(value = "/",method = RequestMethod.GET )
	public String  indexfundingList(Model model ,HttpSession session) {
		try {
			List<Funding>list =fundingService.indexfundingList();
			model.addAttribute("list",list);
			// loginMember 세션속성으로 저장하려면, class에 @SessionAttributes로 등록
			log.info("list={}",list);
	
		}catch (Exception e) {
			log.error("메인페이지 조회가 안됩니다",e);
			throw e;
		}
		//404 에러 forward 해준다.
		return "forward:/index.jsp";
	}
}
