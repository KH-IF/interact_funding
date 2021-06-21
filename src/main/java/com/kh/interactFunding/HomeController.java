package com.kh.interactFunding;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Funding;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({ "loginMember" })
public class HomeController {
	@Autowired
	private FundingService fundingService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexfundingList(Model model, HttpSession session,
			@CookieValue(value = "count", defaultValue = "0", required = true) String value,
			HttpServletResponse response, HttpServletRequest request) {
		try {
			// 펀딩 리스트 받아오는 객체입니다
			List<Funding> list = fundingService.indexfundingList();
			// 회원들이 좋아할 프로젝트 받아오는(조회순)객체입니다
			List<Funding> viewlist = fundingService.indexviewlist();
			// 좋아요 리스트 받아오는 객체입니다
			List<Funding> likelist = fundingService.indexlikelist();
			//펀딩 실시간 랭킹 조회순 받아오는 객체 입니다.
			List<Funding>Rankinglist=fundingService.indexRankingviewlist();
			
			
			//카테고리 이름 설정
			model.addAttribute("list", list);
			model.addAttribute("viewlist", viewlist);
			model.addAttribute("likelist", likelist);
			model.addAttribute("Rankinglist",Rankinglist);
		

		} catch (Exception e) {
			log.error("메인페이지 조회가 안됩니다", e);
			throw e;
		}
		// 404 에러 forward 해준다.
		return "forward:/index.jsp";
	}
}
