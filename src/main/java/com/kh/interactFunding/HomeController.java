package com.kh.interactFunding;
import java.util.List;

import javax.servlet.http.Cookie;
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
@SessionAttributes({"loginMember"})
public class HomeController {
	@Autowired
	private FundingService fundingService;

	// 펀딩하기
	@RequestMapping(value = "/",method = RequestMethod.GET )
	public String  indexfundingList(Model model ,
									HttpSession session,
									@CookieValue(value="count", defaultValue="0", required=true) String value,
									HttpServletResponse response,
									HttpServletRequest request) {
		try {
			// request getParameter 매서드를 이용
			List<Funding>list =fundingService.indexfundingList();
			//earlyList 페이지 리스트
			//List<Funding>earlylist= fundingService.indexEarlyList();
			//회원님이 좋아할 (쿠키)
			List<Funding>viewlist=fundingService.indexviewlist();
			//likeList 페이지 
			List<Funding>likelist= fundingService.indexlikelist();
			// Cookie값 설정
			try{            int i = Integer.parseInt(value);
			value = Integer.toString(++i);
			}catch(Exception e){
				value = "1";
			}

			 // Cookie 설정
			Cookie cookie = new Cookie("count", value);
			cookie.setMaxAge(60 * 60 * 24 * 365); // 1년간 유지
			cookie.setPath("/"); // /경로 이하에 모두 쿠키 적용
			response.addCookie(cookie);
			
		    model.addAttribute("cookie",cookie);
			model.addAttribute("list",list);
			//model.addAttribute("earlylist",earlylist);
			model.addAttribute("viewlist",viewlist);
			model.addAttribute("likelist",likelist);
			
				
		}catch (Exception e) {
			log.error("메인페이지 조회가 안됩니다",e);
			throw e;
		}
		//404 에러 forward 해준다.
		return "forward:/index.jsp";
	}
}
