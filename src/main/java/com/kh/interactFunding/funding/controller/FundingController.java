package com.kh.interactFunding.funding.controller;

import java.beans.PropertyEditor;
import java.io.File;
import java.net.URI;
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
import javax.xml.ws.spi.http.HttpHandler;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Attachment;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.funding.model.vo.FundingExt;
import com.kh.interactFunding.funding.model.vo.Reward;
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
			log.debug("loginMember={}",loginMember);
		
			model.addAttribute("statusYList", statusYList);
			model.addAttribute("statusNList", statusNList);
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
	
	//jsp로 이동하기 용
	@GetMapping("/fundingStart2")
	public void fundingStart2(@SessionAttribute FundingExt funding,Model model) {
		log.debug("funding={}",funding);
		model.addAttribute("funding",funding);
	}
	
	//기존에 있는 것을 이어서 시작할 경우
	@GetMapping("/existFunding")
	public String fundingStart2(@RequestParam(value="fundingNo") String fundingNo, Model model, @SessionAttribute Member loginMember) {
		try {
			log.debug("fundingNo={}",fundingNo);
			FundingExt funding = fundingService.loadFunding(fundingNo);
			model.addAttribute("funding",funding);
			model.addAttribute("loginMember",loginMember);
		} catch (Exception e) {
			log.error("기존 펀딩 로딩 오류",e);
			throw e;
		}
		return "redirect:/funding/fundingStart2";
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
			
			log.debug("result={}",result);
			log.debug("funding_no={}",funding.getFundingNo());
		} catch (Exception e) {
			log.error("펀딩 start 에러(funding_no 부여)",e);
			throw e;
		}
		return "redirect:/funding/fundingStart2";
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
	public void ready1Funding(@SessionAttribute FundingExt funding, RedirectAttributes redirectAttr) {
		
		String fundingNo = String.valueOf(funding.getFundingNo());
		
		FundingExt fundingR = fundingService.selectCheckFunding(fundingNo);
		List<Reward> rewardList = fundingService.loadReward(fundingNo);
		
		//요금제 작성여부 확인
		fundingR.getRatePlanCode();
		
		//기본정보 작성여부 확인
		fundingR.getCategoryCode();
		fundingR.getTitle();
		fundingR.getDDay();
		fundingR.getAttachList();
		
		//스토리 작성여부 확인
		fundingR.getContent();
		fundingR.getEarlyContent();
		fundingR.getStartDate();
		
		//리워드 작성여부 확인
		for(Reward reward:rewardList) {
			reward.getRewardNo();
			reward.getTitle();
			reward.getContent();
			reward.getPrice();
			reward.getLimitAmount();
			reward.getShippingPrice();
			reward.getShippingDate();
		}
		
		log.debug("ready1Funding");
	}
	@GetMapping("/ready1Funding/{msg}")
	@ResponseBody
	public ModelAndView ready1Funding(@PathVariable(name="msg") String msg, ModelAndView mav, HttpServletRequest request) {
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
	public Map<String, Object> saveCharge(@PathVariable(name="no") String no ,@PathVariable(name="charge") String charge) {
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
	public void ready4Funding(@SessionAttribute FundingExt funding, Model model) {
		try {
			String fundingNo = String.valueOf(funding.getFundingNo());
			FundingExt fundingR = fundingService.loadFunding(fundingNo);
			model.addAttribute("funding",fundingR);
			log.debug("ready3BasicInfo");
		} catch (Exception e) {
			log.error("basicinfo 불러오기 에러",e);
			throw e;
		}
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
			String saveDirectory = application.getRealPath("/resources/upload");
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
	public void ready4Story() {
		log.debug("ready4Story");
	}
	
	@GetMapping("/ready4StoryLoad")
	@ResponseBody
	public Map<String, Object> ready4Story(@SessionAttribute FundingExt funding) {
		try {
			log.debug("funding={}",funding);
			String fundingNo = String.valueOf(funding.getFundingNo());
			FundingExt fundingR = fundingService.loadFunding(fundingNo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("funding",fundingR);
			log.debug("ready4StoryLoad");
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
			Date startDayCompare =funding.getDDay();
			
			Date nowTime = new Date();
			
			//얼리버드 선택안했을 경우 값이 null로 들어가게
			if(startDayCompare == nowTime) {
				earlyContent = null;
				funding.setEarlyContent(earlyContent);
			}
						
			log.debug("earlyContent ={}, startDay={}",earlyContent,funding.getDDay());

			int result = fundingService.saveStory(funding);
			
			log.debug("funding = {}",funding);
			redirectAttr.addFlashAttribute("msg","스토리를 저장하였습니다.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return "redirect:/funding/ready1Funding";
	}
	
	@GetMapping("/selectOneReward/{rewardNo}")
	@ResponseBody
	public Map<String, Object> selectOneReward(@PathVariable(name="rewardNo") String rewardNo) {
		try {
			log.debug("selectOneReward");
			Reward chReward = fundingService.selectOneReward(rewardNo);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("chReward", chReward);
			log.debug("chReward={}",chReward);
			return map;
		} catch (Exception e) {
			log.error("reward 하나 불러오기 에러",e);
			throw e;
		}
		
	}
	
	
	@GetMapping("/ready5Reward")
	public void ready5Reward(@SessionAttribute FundingExt funding, Model model) {
		try {
			String fundingNo = String.valueOf(funding.getFundingNo());
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
		log.debug("reward={}",reward);
		try {
			
			int result = fundingService.updateReward(reward);
			
			return "redirect:/funding/ready5Reward";
		} catch (Exception e) {
			log.error("reward 수정 에러",e);
			throw e;
		}
	}
	
	@PostMapping("/deleteReward")
	public String deleteReward(Reward reward, RedirectAttributes redirectAttr, Model model) {
		log.debug("reward={}",reward.getRewardNo());
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
	public Map<String, Object> finalSubmit(@SessionAttribute FundingExt funding){
		try {
				log.debug("funding={}",funding);
				//int result =  fundingService.finalSubmit(funding);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("msg","최종 제출하였습니다.");		
				return map;
		} catch (Exception e) {
			log.error("최종제출 status YN등록 에러",e);
			throw e;
		}
	}
	
	//펀딩 삭제하기
	@PostMapping("/deleteFunding")
	public String deleteFunding(
			@RequestParam(value="fundingNo") String fundingNo,
			RedirectAttributes redirectAttr,
			HttpServletRequest request,
			Model model){
		try {
			log.debug("deleteFunding");
			log.debug("fundingNo={}",fundingNo);
			int result =  fundingService.deleteFunding(fundingNo);
			redirectAttr.addFlashAttribute("msg","펀딩을 삭제하였습니다.");
			log.debug("result={}",result);
			
			//세션 종료
			request.getSession().removeAttribute("funding");
			model.addAttribute("funding",null);
			
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
	public Map<String, Object> checkSMSPhone(@RequestParam(value="phoneNumber") String phoneNumber) {
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
	public void news(@RequestParam(value="no", defaultValue="1") int no, Model model) {
		try {
			log.debug("no = {}", no);
			Map<String, Object> param = new HashMap<>();
			param.put("no", no);
			//1.업무로직
			List<Funding> list = fundingService.news(param);
			
			//2.jsp위임
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			log.error("새소식 조회 오류!", e);
			throw e;
		}
		
	}
	
	@GetMapping("newsView.do")
	public void newsView(@RequestParam(value="no", defaultValue="1") int no, Model model) {
		try {
			log.debug("no = {}", no);
			Map<String, Object> param = new HashMap<>();
			param.put("no", no);
			//1.업무로직
			List<Funding> list = fundingService.news(param);
			
			//2.jsp위임
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			log.error("새소식 조회 오류!", e);
			throw e;
		}
	}
	
	@GetMapping("/community.do")
	public void community(@RequestParam(value="no", defaultValue="1") int comment_no, Model model) {
		try {
			log.debug("comment_no = {}", comment_no);
			Map<String, Object> param = new HashMap<>();
			param.put("comment_no", comment_no);
			//1.업무로직
			List<Funding> list = fundingService.community(param);
			
			//2.jsp위임
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			log.error("새소식 조회 오류!", e);
			throw e;
		}
	}
	
	@GetMapping("/supporter.do")
	public void supporter(@RequestParam(value="no", defaultValue="1") int no, Model model) {
		try {
			log.debug("no = {}", no);
			Map<String, Object> param = new HashMap<>();
			param.put("no", no);
			//1.업무로직
			List<Funding> list = fundingService.supporter(param);
			
			//2.jsp위임
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			log.error("새소식 조회 오류!", e);
			throw e;
		}
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
			@RequestParam(defaultValue="") String searchKeyword,
			@RequestParam(defaultValue="") String searchSelect1,
			@RequestParam(defaultValue="") String searchSelect2,
			@RequestParam(defaultValue="") String category
		) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchKeyword", searchKeyword);
		map.put("searchSelect1", searchSelect1);
		map.put("searchSelect2", searchSelect2);
		map.put("category", category);
		
		try {
			// 카테고리 업무로직
			List<Map<String, String>> categoryList = fundingService.selectCategoryList();
			
			// 검색 업무로직
			List<Funding> list = fundingService.fundingList(map);
			log.debug("searchTitle = {}", searchKeyword);
			System.out.println("list"+list);
			log.debug("list = {}", list);
			
			//jsp에 위임
			mav.addObject("list", list);
			mav.addObject("categoryList", categoryList);
			
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
		Map<String, Object> map = new HashMap<>();
		
		List<Funding> list = fundingService.fundingList(map);
		return mav;
	}
	
	//천호현
	
	@GetMapping("/fundingDetail") 
	public void fundingDetail(@RequestParam int	funding_no, Model model) { //1. 업무로직 
		Funding funding = fundingService.selectOneFunding(funding_no);
		int funding2 = fundingService.selectOneFunding2(funding_no);//funding_participation
		log.debug("funding = {}" , funding); 
		log.debug("funding2 = {}" , funding2); 
		//2. 위임 
		model.addAttribute("funding", funding);
		model.addAttribute("funding2", funding2);
	}

	
	@GetMapping("/fundingReward")
	public void fundingReward(@RequestParam int	funding_no, Model model) {
		Funding funding = fundingService.selectOneFunding(funding_no);
		log.debug("funding = {}" , funding); 
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
	
	@GetMapping("/loginMembberClickLike")
	public void loginMembberClickLike() {
		//Member memeber = fundingService.selectLoginMember();
	}
	
	
}
	