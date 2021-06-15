package com.kh.interactFunding.funding.controller;

import java.beans.PropertyEditor;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.interactFunding.common.util.HelloSpringUtils;
import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller
@RequestMapping("/funding")
@Slf4j
@SessionAttributes({"funding"})
public class FundingController {
	@Autowired
	private FundingService fundingService;
	
	//파일 저장시 사용 
	@Autowired
	private ServletContext application;
	
	//김윤수(test)
	
	//김경태 졸리다
	
	//김주연
	@GetMapping("/fundingStart1")
	public void fundingStart1(HttpSession session, Model model) {
		
		log.debug("session={}",session.getAttribute("loginMember"));
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		log.debug("fundingStart1");
	
		try {
			List<FundingExt> statusYList = fundingService.statusYList(loginMember);
			List<FundingExt> statusNList = fundingService.statusNList(loginMember);
			log.debug("statusYList={}",statusYList);
			log.debug("statusNList={}",statusNList);
		
			model.addAttribute("statusYList", statusYList);
			model.addAttribute("statusNList", statusNList);
		} catch (Exception e) {
			log.error("펀딩 완료 리스트 불러오기 에러",e);
			throw e;
		}
	}
	@GetMapping("/fundingStart1/{msg}")
	@ResponseBody
	public ModelAndView fundingStart1(@PathVariable String msg, ModelAndView mav, HttpServletRequest request) {
		log.debug("fundingStart1");
		RedirectView view = new RedirectView(request.getContextPath()+"/funding/fundingStart1");
		//url관련한 것을 자동으로 붙여주는 속성
		view.setExposeModelAttributes(false); //이 설정을 할려고 view객체를 사용함
		mav.setView(view);
	
		//ModelAndView와 RedirectAttributes 충돌시 FlashMap을 직접 사용
		FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
		flashMap.put("msg",msg);

		return mav;
	}
	
	//기존에 있는 것을 이어서 시작할 경우
	

	//새로 시작하는 경우
	@GetMapping("/fundingStart2")
	//public void fundingStart2(Funding funding, HttpSession session) {
	public void fundingStart2(Funding funding, HttpSession session) {
		log.debug("fundingStart2");
		Member loginMember = (Member) session.getAttribute("loginMember");
		funding.setWriterNo(loginMember.getMemberNo());
		
		ready1FundingInsertNo(funding);
		log.debug("funding={}",funding);
		//session.setAttribute("funding", funding);
//		Funding funding = new Funding();
//		funding.setFundingNo(18);
		log.debug("funding_no={}",funding.getFundingNo());
	}
	
	public void ready1FundingInsertNo(Funding funding) {
		try {
			log.debug("ready1Funding");
			int result =  fundingService.ready1FundingInsertNo(funding);
			log.debug("result={}",result);
		} catch (Exception e) {
			log.error("펀딩 start 에러(funding_no 부여)",e);
			throw e;
		}
	}
	
	@GetMapping("/fundingStart3")
	public void fundingStart3() {
		log.debug("fundingStart3");
	}
	@GetMapping("/fundingStart4")
	public void fundingStart4() {
		log.debug("fundingStart4");
	}
	@GetMapping("/fundingStart5")
	public void fundingStart5() {
		log.debug("fundingStart5");
	}
	@GetMapping("/ready1Funding")
	public void ready1Funding() {
		
		//요금제 작성여부 확인
		
		//기본정보 작성여부 확인
		
		//스토리 작성여부 확인
		
		//리워드 작성여부 확인
		
		log.debug("ready1Funding");
	}
	@GetMapping("/ready1Funding/{msg}")
	@ResponseBody
	public ModelAndView ready1Funding(@PathVariable String msg, ModelAndView mav, HttpServletRequest request) {
		log.debug("ready1Funding");
		RedirectView view = new RedirectView(request.getContextPath()+"/funding/ready1Funding");
		//url관련한 것을 자동으로 붙여주는 속성
		view.setExposeModelAttributes(false); //이 설정을 할려고 view객체를 사용함
		mav.setView(view);
	
		//ModelAndView와 RedirectAttributes 충돌시 FlashMap을 직접 사용
		FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
		flashMap.put("msg",msg);

		return mav;
	}
	

	
	@GetMapping("/ready2Charge")
	public void ready2Funding() {
		
		log.debug("ready2Charge");
	}
	@PutMapping("/saveCharge/{no}/{charge}")
	@ResponseBody
	public Map<String, Object> saveCharge(@PathVariable String no ,@PathVariable String charge) {
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("no",no);
			param.put("charge",charge);
			log.debug("param={}",param);
			int result =  fundingService.saveCharge(param);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("msg","요금제를 저장하였습니다.");		
			return map;
		} catch (Exception e) {
			log.error("saveCharge 등록 에러",e);
			throw e;
		}
	}
	
	@GetMapping("/ready3BasicInfo")
	public void ready4Funding() {
		log.debug("ready3BasicInfo");
	}
	@PostMapping("/saveBasicInfo")
	public String  saveBasicInfo(
			@ModelAttribute FundingExt funding,
			@RequestParam(name="upFile") MultipartFile[] upFiles,
			RedirectAttributes redirectAttr
			) throws Exception {
		log.debug("funding = {}",funding);
		log.debug("upFiles = {}",upFiles);
		try {
			String saveDirectory = application.getRealPath("/resources/upload/board");
			log.debug("saveDirectory ={}",saveDirectory);
			
			//디렉토리 생성
			File dir = new File(saveDirectory);
			if(!dir.exists())
				dir.mkdirs(); //복수개의 디렉토리를 생성
			
			List<Attachment> attachList = new ArrayList<>();
			
			for(MultipartFile upfile : upFiles) {
				//input[name=upFile]로부터 비어있는 upFile이 넘어온다.
				if(upfile.isEmpty()) continue; 
				
				String renamedFilename = 
						HelloSpringUtils.getRenamedFilename(upfile.getOriginalFilename());
				
				//a. 서버컴퓨터에 저장
									// 부모디렉토리, 파일명
				File dest = new File(saveDirectory, renamedFilename);
				upfile.transferTo(dest); //파일이동
				
				//b. 저장된 데이터를 Attachment객체에 저장 및 list 추가
				Attachment attach = new Attachment();
				attach.setOriginalFilename(upfile.getOriginalFilename());
				attach.setRenamedFilename(renamedFilename);
				attachList.add(attach);
			}
			
			log.debug("attachList = {}" ,attachList);
			//board객체에 설정
			funding.setAttachList(attachList);
			
			//2. 업무로직 : DB 저장 board, attachment
			int result = fundingService.saveBasicInfo(funding);
			
			//3. 사용자피드백 & 리다이렉트
			redirectAttr.addFlashAttribute("msg","기본정보를 저장하였습니다.");
			
			}catch(Exception e){
				log.error("게시물 등록 오류", e);
				throw e;
			}
			return "redirect:/funding/ready1Funding";
	}
	
	@GetMapping("/ready4Story")
	public void ready5Funding(Funding funding) {
		log.debug("ready4Story");
	}
	@PostMapping("/saveStory")
	public String saveStory(Funding funding, RedirectAttributes redirectAttr){
		try {
			log.debug("funding={}",funding);

			String earlyContet = funding.getEarlyContent();
			Date startDay =funding.getDDay();
			
			log.debug("earlyContet ={}, startDay={}",earlyContet,startDay);

			//int result = fundingService.saveStory(funding);
			
			log.debug("funding = {}",funding);
			redirectAttr.addFlashAttribute("msg","스토리를 저장하였습니다.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return "redirect:/funding/ready1Funding";
	}
	@GetMapping("/ready5Reward")
	public void ready6Funding() {
		log.debug("ready5Reward");
	}
	@PutMapping("/insertReward")
	public String insertReward() {
		
		return "redirect:/funding/ready5Reward";
	}
	@PostMapping("/updateReward")
	public String updateReward() {
		
		return "redirect:/funding/ready5Reward";
	}
	
	@PutMapping("/finalSubmit")
	@ResponseBody
	public Map<String, Object> finalSubmit(){
		try {
				//int result =  fundingService.finalSubmit(funding);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("msg","최종 제출하였습니다.");		
				return map;
		} catch (Exception e) {
			log.error("최종제출 status YN등록 에러",e);
			throw e;
		}
	}
	
	@GetMapping("/checkSMS")
	public void checkSMS() {
		
	}
	
	@GetMapping("/checkSMSPhone")
	@ResponseBody
	public Map<String, Object> checkSMSPhone(@RequestParam String phoneNumber) {
	    String api_key = "NCSU1PW70UL1PLML";
	    String api_secret = "BGPK3YEIOVUDDPRLXYM9NWSXIWP5FKZK";
        
	    Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
	    
        //인증번호 전달
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("numStr", numStr);
        
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);
	    params.put("from", "01076561115");
	    params.put("type", "SMS");
	    params.put("text", "이프(IF) 휴대폰인증 메시지: 인증번호는 ["+numStr+"] 입니다");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      log.debug("obj.toString()={}",obj.toString());
	    } catch (CoolsmsException e) {
	    	log.error("error={},{}",e.getCode(),e.getMessage());
	    }
		return map;
	 }
	
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
	
	/**
	 * 커맨드객체 이용시 사용자입력값(String)을 특정필드타입으로 변환할 editor객체를 설정
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		//Member.birthday:java.sql.Date 타입 처리
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//커스텀에디터 생성 : allowEmpty - true (빈문자열을 null로 변환처리 허용)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(java.sql.Date.class, editor);
	}
	
	
	
	//배기원(test 해보겠습니다)
	@ResponseBody
	@GetMapping("fundinglike")
	public List<Funding> indexfundinglike(Model model ,HttpSession session){
		log.debug("1111");
		List<Funding> likeList=null;
		try {
		likeList =fundingService.indexfundinglike();
		log.info("likeList={}",likeList);
		}catch (Exception e) {
			log.error("메인페이지 좋아요가 안됩니다",e);
			throw e;
		}
		return likeList;
	}
	 
	 
	
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
	/*
	* @GetMapping("/fundingDetail") public void fundingDetail(@RequestParam int
	* funding_no, Model model) { //1. 업무로직 Funding funding =
	* fundingService.selectOneFunding(funding_no); log.debug("funding = {}" ,
	* funding); //2. 위임 model.addAttribute("funding", funding);
	*
	* }
	*/

	@GetMapping("/fundingDetail")
	public Map<String, Object> fundingDetail(@RequestParam int funding_no) {
		//1. 업무로직
		List<Funding> list = fundingService.selectFunding(funding_no);

		log.debug("list = {}" , list);
		//2. 위임
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;

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
	