package com.kh.interactFunding.funding.controller;

import java.beans.PropertyEditor;
import java.io.File;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.kh.interactFunding.common.util.PageBarUtils;
import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.Reward;
import com.kh.interactFunding.member.model.service.MemberService;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller
@RequestMapping("/funding")
@Slf4j
@SessionAttributes({"funding","loginMember"})
public class FundingController {
	
	
	@Autowired
	private FundingService fundingService;
	
	@Autowired
	private MemberService memberService;
	
	//파일 저장시 사용 
	@Autowired
	private ServletContext application;
	

	
	//김윤수(test)
	
	//김경태 졸리다
	
	//김주연
	@GetMapping("/fundingStart1")
	public void fundingStart1(HttpSession session, Model model, HttpServletRequest request) {
		
		//log.debug("session={}",session.getAttribute("loginMember"));
		
		//세션 종료
		request.getSession().removeAttribute("funding");
		model.addAttribute("funding",null);
		
		log.debug("fundingsesion ={}", session.getAttribute("funding"));
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		int memberNo = (int)loginMember.getMemberNo();
		log.debug("memberNo={}",memberNo);
		try {
			log.debug("fundingStart1");
			List<FundingExt> statusYList = fundingService.statusYList(memberNo);
			List<FundingExt> statusNList = fundingService.statusNList(memberNo);
			List<FundingExt> nowList = fundingService.nowList(memberNo);
			List<FundingExt> finishList = fundingService.finishList(memberNo);
			//log.debug("statusYList={}",statusYList);
			//log.debug("statusNList={}",statusNList);
			//log.debug("loginMember={}",loginMember);
			log.debug("nowList={}",nowList);
		
			model.addAttribute("statusYList", statusYList);
			model.addAttribute("statusNList", statusNList);
			model.addAttribute("nowList", nowList);
			model.addAttribute("finishList", finishList);
			model.addAttribute("loginMember",loginMember);
		} catch (Exception e) {
			log.error("펀딩 완료 리스트 불러오기 에러",e);
			throw e;
		}
	}
	
	//최종제출되었을때 알람 전달을 위해서 만듬
	@GetMapping("/fundingStart1/{msg}")
	@ResponseBody
	public ModelAndView fundingStart1(@PathVariable(name="msg") String msg, ModelAndView mav, HttpServletRequest request) {
		log.debug("fundingStart1msg");
		
		RedirectView view = new RedirectView(request.getContextPath()+"/funding/fundingStart1");
		//url관련한 것을 자동으로 붙여주는 속성
		view.setExposeModelAttributes(false); //이 설정을 할려고 view객체를 사용함
		mav.setView(view);
	
		//ModelAndView와 RedirectAttributes 충돌시 FlashMap을 직접 사용
		FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
		flashMap.put("msg",msg);

		return mav;
	}
	
	//jsp로 이동하기 용
	@GetMapping("/fundingStart2")
	public void fundingStart2(@SessionAttribute(name="funding") FundingExt funding,Model model) {
		//log.debug("funding={}",funding);
		model.addAttribute("funding",funding);
	}
	
	//기존에 있는 것을 이어서 시작할 경우
	@GetMapping("/existFunding")
	public String existFunding(@RequestParam(value="fundingNo") int fundingNo, Model model, @SessionAttribute(name ="loginMember") Member loginMember) {
		try {
			log.debug("existFunding");
			//log.debug("fundingNo={}",fundingNo);
			FundingExt funding = fundingService.loadFunding(fundingNo);
			model.addAttribute("funding",funding);
			model.addAttribute("loginMember",loginMember);
		} catch (Exception e) {
			log.error("기존 펀딩 로딩 오류",e);
			throw e;
		}
		return "redirect:/funding/ready1Funding";
	}

	//새로 시작하는 경우	
	@PostMapping("/newFunding")
	public String ready1FundingInsertNo(FundingExt funding, HttpSession session) {
		try {
			log.debug("newFunding");		
			Member loginMember = (Member) session.getAttribute("loginMember");
			funding.setWriterNo(loginMember.getMemberNo());
			
			int result =  fundingService.ready1FundingInsertNo(funding);
			
			session.setAttribute("funding", funding);
			
			//log.debug("result={}",result);
			//log.debug("funding_no={}",funding.getFundingNo());
		} catch (Exception e) {
			log.error("펀딩 start 에러(funding_no 부여)",e);
			throw e;
		}
		return "redirect:/funding/fundingStart2";
	}
	
	@GetMapping("/fundingStart3")
	public void fundingStart3() {
		//log.debug("fundingStart3");
	}
	@GetMapping("/fundingStart4")
	public void fundingStart4() {
		//log.debug("fundingStart4");
	}
	@GetMapping("/fundingStart5")
	public void fundingStart5() {
		//log.debug("fundingStart5");
	}

	@GetMapping("/ready1Funding")
	public void ready1Funding(@SessionAttribute(name ="funding") FundingExt funding, Model model) {
		
		log.debug("ready1Funding");
		
		int fundingNo = funding.getFundingNo();
		
		FundingExt fundingR = fundingService.selectCheckFunding(fundingNo);
		List<Reward> rewardList = fundingService.loadReward(fundingNo);
		
		log.debug("rewardList={}",rewardList);
		
		Map<String, Object> writeMap = new HashMap<String, Object>();
		
		//모든 확인은 작성이 되었을 경우를 산정하고 mapper에 작성확인 전달
		//요금제 작성여부 확인
		String ratePlanCode = fundingR.getRatePlanCode();
		if(ratePlanCode!= null && ratePlanCode != "") {
			writeMap.put("ratePlanCode","OK");
		}
		
		//기본정보 작성여부 확인
		String categoryCode = fundingR.getCategoryCode();
		String title = fundingR.getTitle();
		Date dDay = fundingR.getDDay();
		Attachment attachment = fundingR.getAttachment();
		//vo 수정 후 바꿔 줄것
		//Attachment attach =  fundingR.getAttachList();
		
		if(categoryCode != null && categoryCode != "" 
			&&title != null && title != "" 
			&&dDay != null
			&&attachment != null) {
			writeMap.put("basicInfo","OK");
		}
		
		
		//스토리 작성여부 확인
		String content = fundingR.getContent();
		String earlyContent = fundingR.getEarlyContent();
		Date startDate = fundingR.getStartDate();
		if(content != null && content !="" &&content !="<p><br></p>" && earlyContent !="" && earlyContent !="<p><br></p>"&&startDate != null) {
			writeMap.put("story","OK");
		}
		
			
		//리워드 작성여부 확인
		if(!rewardList.isEmpty()) {
			writeMap.put("reward","OK");
		}
		
		model.addAttribute("writeMap",writeMap);
		
	}
	@GetMapping("/ready1Funding/{msg}")
	@ResponseBody
	public ModelAndView ready1Funding(@PathVariable(name="msg") String msg, ModelAndView mav, HttpServletRequest request) {
		log.debug("ready1Funding msg");
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
		//log.debug("ready2Charge");
	}
	
	@PutMapping("/saveCharge/{no}/{charge}")
	@ResponseBody
	public Map<String, Object> saveCharge(@PathVariable(name="no") String no ,@PathVariable(name="charge") String charge) {
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("no",no);
			param.put("charge",charge);
			//log.debug("param={}",param);
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
	public void ready4Funding(@SessionAttribute(name="funding") FundingExt funding, Model model) {
		try {
			int fundingNo = funding.getFundingNo();
			FundingExt fundingR = fundingService.loadFunding(fundingNo);
			model.addAttribute("funding",fundingR);
			//log.debug("ready3BasicInfo");
		} catch (Exception e) {
			log.error("basicinfo 불러오기 에러",e);
			throw e;
		}
	}
	@PostMapping("/saveBasicInfo")
	public String  saveBasicInfo(
			@ModelAttribute FundingExt funding,
			@RequestParam(name="upFile") MultipartFile upFile,
			RedirectAttributes redirectAttr
			) throws Exception {
		log.debug("funding = {}",funding);
		log.debug("upFile = {}",upFile.isEmpty());
		try {
			String saveDirectory = application.getRealPath("/resources/upload");
			log.debug("saveDirectory ={}",saveDirectory);
			
			
			//업로드할 파일이 있을 경우에만
			if(!upFile.isEmpty()) {
				
			
			//디렉토리 생성
			File dir = new File(saveDirectory);
			if(!dir.exists())
				dir.mkdirs(); //복수개의 디렉토리를 생성
							
				String renamedFilename = 
						HelloSpringUtils.getRenamedFilename(upFile.getOriginalFilename());
				
				//a. 서버컴퓨터에 저장
									// 부모디렉토리, 파일명
				File dest = new File(saveDirectory, renamedFilename);
				upFile.transferTo(dest); //파일이동
				
				//b. 저장된 데이터를 Attachment객체에 저장 
				Attachment attach = new Attachment();
				attach.setOriginalFilename(upFile.getOriginalFilename());
				attach.setRenamedFilename(renamedFilename);
				funding.setAttachment(attach);
				log.debug("attach = {}" ,attach);
			}
			
		
			
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
	public void ready4Story() {
		//log.debug("ready4Story");
	}
	
	@GetMapping("/ready4StoryLoad")
	@ResponseBody
	public Map<String, Object> ready4Story(@SessionAttribute(name="funding") FundingExt funding) {
		try {
			//log.debug("funding={}",funding);
			int fundingNo = funding.getFundingNo();
			FundingExt fundingR = fundingService.loadFunding(fundingNo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("funding",fundingR);
			//log.debug("ready4StoryLoad");
			return map;
		} catch (Exception e) {
			log.error("story 불러오기 에러",e);
			throw e;
		}
	}
	
	@PostMapping("/saveStory")
	public String saveStory(FundingExt funding, RedirectAttributes redirectAttr){
		try {
			log.debug("funding={}",funding);

			String earlyContent = funding.getEarlyContent();
			Date startDayCompare =funding.getStartDate();
			
			Date nowTime = new Date();
			
			//얼리버드 선택안했을 경우 ealyContent 값이 null로 들어가게
			if(startDayCompare.before(nowTime)) {
				earlyContent = null;
				funding.setEarlyContent(earlyContent);
			}
						
			//log.debug("earlyContent ={}, startDay={}",earlyContent,funding.getDDay());

			int result = fundingService.saveStory(funding);
			
			//log.debug("funding = {}",funding);
			redirectAttr.addFlashAttribute("msg","스토리를 저장하였습니다.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/funding/ready1Funding";
	}
	
	//reward 수정에서 값을 뿌려주기 위한 메소드
	@GetMapping("/selectOneReward/{rewardNo}")
	@ResponseBody
	public Map<String, Object> selectOneReward(@PathVariable(name="rewardNo") int rewardNo) {
		try {
			log.debug("selectOneReward");
			Reward chReward = fundingService.selectOneReward(rewardNo);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("chReward", chReward);
			//log.debug("chReward={}",chReward);
			
			return map;
		} catch (Exception e) {
			log.error("reward 하나 불러오기 에러",e);
			throw e;
		}
		
	}
	
	
	@GetMapping("/ready5Reward")
	public void ready5Reward(@SessionAttribute FundingExt funding, Model model) {
		try {
			int fundingNo = funding.getFundingNo();
			List<Reward> rewardList = fundingService.loadReward(fundingNo);
			model.addAttribute("rewardList", rewardList);
			log.debug("ready5Reward");
		} catch (Exception e) {
			log.error("reward 불러오기 에러",e);
			throw e;
		}
	}
	
	@PostMapping("/insertReward")
	public String  insertReward(Reward reward, RedirectAttributes redirectAttr) {
		log.debug("reward={}",reward);
		try {	
			int result = fundingService.insertReward(reward);	
			return "redirect:/funding/ready5Reward";
		} catch (Exception e) {
			log.error("reward 등록 에러",e);
			throw e;
		}
	}
	
	@PostMapping("/updateReward")
	public String updateReward(Reward reward, RedirectAttributes redirectAttr, Model model) {
		//log.debug("reward={}",reward);
		try {
			int result = fundingService.updateReward(reward);
			//작동확인필요
			model.addAttribute("reward",reward);
			return "redirect:/funding/ready5Reward";
		} catch (Exception e) {
			log.error("reward 수정 에러",e);
			throw e;
		}
	}
	
	@PostMapping("/deleteReward")
	public String deleteReward(Reward reward, RedirectAttributes redirectAttr, Model model) {
		//log.debug("reward={}",reward.getRewardNo());
		try {
			int rewardNo = reward.getRewardNo();
			int result = fundingService.deleteReward(rewardNo);
			redirectAttr.addFlashAttribute("msg","리워드를 삭제하였습니다.");
			model.addAttribute("reward",reward);
			return "redirect:/funding/ready5Reward";
		} catch (Exception e) {
			log.error("reward 삭제 에러",e);
			throw e;
		}
	}
	
	@PutMapping("/finalSubmit")
	@ResponseBody
	public Map<String, Object> finalSubmit(@SessionAttribute(name="funding") FundingExt funding){
		try {
				int fundingNo = funding.getFundingNo();
				log.debug("funding={}",funding);
				int result =  fundingService.finalSubmit(fundingNo);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("msg","최종 제출하였습니다.");		
				return map;
		} catch (Exception e) {
			log.error("최종제출 status YN등록 에러",e);
			throw e;
		}
	}
	
	@GetMapping("/finalYSubmit")
	@ResponseBody
	public Map<String, Object> finalYSubmit(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg","최종 제출된 펀딩을 수정하였습니다.");		
		return map;	
	}
	@PutMapping("/finalNSubmit")
	@ResponseBody
	public Map<String, Object> finalNSubmit(@SessionAttribute(name="funding") FundingExt funding){
		log.debug("finalNSubmit");
		try {
			int fundingNo = funding.getFundingNo();
			//log.debug("funding={}",funding);
			int result =  fundingService.finalNSubmit(fundingNo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("msg","최종 제출된 펀딩을 수정하였습니다.");		
			return map;
		} catch (Exception e) {
			log.error("최종제출 status YN등록 에러",e);
			throw e;
		}
	}
	
	//펀딩 삭제하기
	@PostMapping("/deleteFunding")
	public String deleteFunding(
			@RequestParam(value="fundingNo") int fundingNo,
			RedirectAttributes redirectAttr){
		try {
			log.debug("deleteFunding");
			//log.debug("fundingNo={}",fundingNo);
			int result =  fundingService.deleteFunding(fundingNo);
			redirectAttr.addFlashAttribute("msg","펀딩을 삭제하였습니다.");
			//log.debug("result={}",result);
			
			
		} catch (Exception e) {
			log.error("펀딩 삭제 에러",e);
			throw e;		
		}
		return "redirect:/funding/fundingStart1";
	}
	
	
	@GetMapping("/checkSMS")
	public void checkSMS() {
		
	}
	
	@GetMapping("/checkSMSPhone")
	@ResponseBody
	public Map<String, Object> checkSMSPhone(@RequestParam(value="phone") String phone) {
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
	    params.put("to", phone);
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
	
	@PutMapping("/savePhone")
	@ResponseBody
	public void savePhone(@RequestBody String phone, @SessionAttribute(name="loginMember") Member loginMember, HttpSession session) {
		//log.debug("savePhone");
		//log.debug("phone={}",phone);
		log.debug("savePhoneloginMember={}",loginMember);
	
		String phoneSub = phone.substring(6);
		
		try {
			int memberNo = loginMember.getMemberNo();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberNo", memberNo);
			map.put("phone",phoneSub);
			int result = memberService.savePhone(map);
			loginMember.setPhone(phoneSub);
			log.debug("savePhoneloginMember={}",loginMember);
			
			session.setAttribute("loginMember", loginMember);
			
		} catch (Exception e) {
			log.error("전화번호 저장 에러",e);
			throw e;		
		}
		
	}

	
	
	//박요한 push
	@GetMapping("/news.do")
	public void news(@RequestParam int funding_no, Model model) {
		log.debug("funding_no = {}" , funding_no);
		//업무로직
		List<Funding> News = fundingService.fundingNews(funding_no);
		log.debug("News = {}" , News);
		model.addAttribute("News", News);
	}
	
	@GetMapping("newsView.do")
	public void newsView() {
		
	}
	
	@GetMapping("/community.do")
	public void community() {
		
	}
	
	@PostMapping("/communityEnroll.do")
	public String communityEnroll() { 
		
		return "";
	}
	
	@GetMapping("/supporter.do")
	public void supporter() {
		
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
		}catch (Exception e) {
			log.error("좋아요 페이지가 안됩니다.",e);
			throw e;
		}
		return likeList;
	}
	@ResponseBody
	@GetMapping("fundingRefresh")
	public  List<Funding>indexfundingRefresh(Model model,HttpSession session){
			List<Funding>Refreshlist=null;
			try {
				Refreshlist=fundingService.indexfundingRefresh();
				log.info("Refreshlist={}",Refreshlist);
			}catch (Exception e) {
				log.error("새로고침 예제",e);
				throw e;
			}
		return Refreshlist;
	}	
	//이승우
	//흠흠
	@GetMapping("/fundingList")
	public ModelAndView fundingList(
			ModelAndView mav,
			@RequestParam(defaultValue="" ,required = false) String category,
			@RequestParam(defaultValue="" ,required = false) String searchSelect1,
			@RequestParam(defaultValue="" ,required = false) String searchSelect2,
			@RequestParam(defaultValue="" ,required = false) String searchKeyword,
			@RequestParam(required = false, defaultValue = "1") int cPage,
			HttpServletRequest request
		) {
		
		log.debug("category ={}",category);
		log.debug("cPage ={}",cPage);
		
		try {
//			log.debug("cPage = {}", cPage); // 페이지 구현
			final int limit = 6; // 최대생성수
			final int offset = (cPage - 1) * limit;
			Map<String, Object> map = new HashMap<>();
			map.put("searchKeyword", searchKeyword);
			map.put("searchSelect1", searchSelect1);
			map.put("searchSelect2", searchSelect2);
			map.put("category", category);
			map.put("limit", limit);
			map.put("offset", offset);
			
			// 검색 업무로직
			List<Funding> list = fundingService.fundingList(map);
			int totalContents = fundingService.selectFundingListTotalContents(map);
			String url = request.getRequestURI() + "?category=" + category + "&searchSelect1=" + searchSelect1 + "&searchSelect2=" + searchSelect2 + "&searchKeyword=" + searchKeyword;
			
			
//			log.debug("totalContents = {}, url = {}", totalContents, url);
			String pageBar = PageBarUtils.getPageBar(totalContents, cPage, limit, url);
			
			//jsp에 위임
			mav.addObject("list", list); 
			mav.addObject("pageBar", pageBar); // 페이지
			mav.addObject("map", map);
			
//			log.debug("searchTitle = {}", searchKeyword);
//			log.debug("list = {}", list);
			return mav;
			}
		
		catch(Exception e){
			log.error("fundingList 조회 오류");
			throw e;
		}
	}
	
	@GetMapping("/earlyList")
	public ModelAndView earlyList(
			ModelAndView mav,
			@RequestParam(defaultValue="") String early
			) {
		
		List<Funding> list = fundingService.earlyList();
		
		mav.addObject("list", list);
		return mav;
	}
	
	//천호현
	
	@GetMapping("/fundingDetail") 
	public void fundingDetail(@RequestParam int	fundingNo, Model model) { //1. 업무로직 
		
		FundingExt funding = fundingService.selectOneFunding(fundingNo);
		String wirterName = memberService.selectOneMemberUseNo(funding.getWriterNo()).getName();
		List<Reward> reward = fundingService.selectRewardList(fundingNo);

		int fundingParticipationCount = fundingService.fundingParticipationCount(fundingNo);//funding_participation
		
		//2. 위임 
		model.addAttribute("funding", funding);
		model.addAttribute("wirterName", wirterName);
		model.addAttribute("reward", reward);
		model.addAttribute("fundingParticipationCount", fundingParticipationCount);
	}

	
	@GetMapping("/fundingReward")
	public void fundingReward(@RequestParam int	fundingNo, Model model) {
		Funding funding = fundingService.selectOneFunding(fundingNo);
		//2. 위임 
		model.addAttribute("funding", funding);
		
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
	
	@ResponseBody
	@PostMapping("/loginMemberClickLike")
	public Map<String, Object> loginMemberClickLike(@RequestParam int memberNo, @RequestParam int fundingNo) {
		
		//0. 값 처리
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("fundingNo", fundingNo);
		
		//ajax like숫자 실시간조회 + 리턴할 결과값 (likeCount + fillHeart.png 등등)
		Map<String, Object> returnResult = new HashMap<>();
		
		
		//1. 요청한 사용자가 좋아요를 누른 적이 있는지 확인
		Map<String, Object> result  = fundingService.likeCheck(map);
		
		//2.1 좋아요 누른적이 없음 -> like테이블에 status Y로 insert   (fillHeart.png)
		if(result==null || result.size()==0) {
			//인설트
			fundingService.insertLike(map); //funding_no, member_no
			int likeCount = fundingService.likeCount(map);
			returnResult.put("likeCount", likeCount);
			returnResult.put("heart", "on");
			return returnResult;
			
		}

		//둘다 뒤집어서 업데이트 해야되서 위로 뺌
		result.put("status", !(Boolean)result.get("status"));
		
		//2.2 좋아요 누른적이 있음, 현재 status = Y -> status = N  (좋아요 취소)     (emptyHeart.png)
		//2.3 좋아요 누른적이 있음, 현재 status = N -> status = Y (다시 좋아요)   (fillHeart.png)
		//업데이트
		fundingService.updateLike(result);
		
		//성공
		if((Boolean) result.get("status")) {
			int likeCount = fundingService.likeCount(map);
			returnResult.put("likeCount", likeCount);
			returnResult.put("heart", "on");
			return returnResult;
		}
		//실패
		int likeCount = fundingService.likeCount(map);
		returnResult.put("heart", "off");
		returnResult.put("likeCount", likeCount);
		return returnResult;
	}
	
	//좋아요 클릭여부확인
	@ResponseBody
	@GetMapping("/likeStatusCheck")
	public int likeStatusCheck(@RequestParam int memberNo) {
		int result = fundingService.likeStatusCheck(memberNo);
		
		return result;
	}
	
	
}
	