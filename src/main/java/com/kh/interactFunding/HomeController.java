package com.kh.interactFunding;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({ "loginMember" })
public class HomeController {
	@Autowired
	private FundingService fundingService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexfundingList(Model model, HttpSession session,
			HttpServletResponse response, HttpServletRequest request, @SessionAttribute(required = false) Member loginMember) {
		try {
			List<Funding> myList = null;
			if(loginMember !=null) {
				//Google + Json = gson
				Gson gson = new Gson();
				myList=new ArrayList<>();
				String jsonObject = fundingService.selectMyListJson(loginMember.getMemberNo());
				int[] fundingNoArr = gson.fromJson(jsonObject, int[].class);
				if(fundingNoArr != null) {
					for(int x : fundingNoArr) {
						
						Funding fundingTemp = fundingService.selectOneFundingKYS(x);
						if(fundingTemp != null) {
							myList.add(fundingService.selectOneFundingKYS(x));
						}
					}
				}
				Collections.reverse(myList);
				log.debug("myList@HomeController = {}", myList);
				model.addAttribute("myList",myList);
			}
			
			// 펀딩 리스트 받아오는 객체입니다
			List<Funding> list = fundingService.indexfundingList();
			// 좋아요 리스트 받아오는 객체입니다
			List<Funding> likelist = fundingService.indexlikelist();
			//펀딩 실시간 랭킹 조회순 받아오는 객체 입니다.
			List<Funding>Rankinglist=fundingService.indexRankingviewlist();
			//오픈예정 리스트 받아오는 객체입니다.
			List<Funding> earlylist = fundingService.indexearlyList();
			//카테고리 이름 설정
			model.addAttribute("list", list);
			model.addAttribute("likelist", likelist);
			model.addAttribute("Rankinglist",Rankinglist);
			model.addAttribute("earlylist",earlylist);
		} catch (Exception e) {
			log.error("메인페이지 조회가 안됩니다", e);
			throw e;
		}
		// 404 에러 forward 해준다.
		return "forward:/index.jsp";
	}
	
	@GetMapping("/error/accessDenied")
	public void accessDenied() {
	}
}
