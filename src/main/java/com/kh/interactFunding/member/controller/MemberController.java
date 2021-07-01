package com.kh.interactFunding.member.controller;



import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.member.model.service.MemberService;
import com.kh.interactFunding.member.model.vo.Coupon;
import com.kh.interactFunding.member.model.vo.Member;
import com.kh.interactFunding.member.model.vo.Msg;
import com.kh.interactFunding.member.model.vo.Point;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({"loginMember","next","receive","send"})
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FundingService fundingService;

	private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	
	final String username = "interact.funding";
	final String password = "if1234!!!";
	
	private final String KAKAO_API_KEY = "df9569096cc5618b81581186dfe78bb2";
	private String KAKAO_REDIRECT_URL = "http://interact-funding.kro.kr/member/auth/kakao";
	//김윤수
	@GetMapping("/login")
	public void login(@SessionAttribute(required = false) String next ,
					  @RequestHeader (name = "Referer", required = false) String referer, 
					  Model model) {
		log.info("referer@login = {}", referer);
		log.debug("next@login = {}",next);
		//나중에 스프링 시큐리티 사용할때 수정바람, 로그인시 로그인 페이지 못들어오게끔
		if(referer != null && next==null) {
			model.addAttribute("next", referer);
			log.debug("next 세션값 생성");
		}
	}
	
	@ResponseBody
	@GetMapping("saveEmail")
	public String saveEmail(@RequestParam Boolean saveEmail, @RequestParam String email, HttpServletResponse response, HttpServletRequest request) {
		String data;
		//이메일 기억하기 처리
		Cookie c = new Cookie("saveEmail", email);
		c.setPath(request.getContextPath()+"/"); //path 쿠키를 전송할 url
		if(saveEmail) {
			c.setMaxAge(60 * 60 * 24 * 7); //7일짜리 영속쿠키로 지정 
			data = "이메일 기억 성공";
		}else {
			c.setMaxAge(0); //0으로 지정해서 즉시 삭제, 음수로 지정하면 session종료시 제거 
			data = "이메일 기억 실패";
		}
		response.addCookie(c);
		return data;
	}
	
	@GetMapping("findid")
	public void findid() {
	}
	
	@PostMapping("findid")
	public String findid(Member member, RedirectAttributes redirectAttr, HttpServletRequest request) {
		log.debug("member@findid = {}", member);
		String name = member.getName(); 
		member = memberService.selectOneMember(member);
		if(member==null || !member.getName().equals(name)) {
			redirectAttr.addFlashAttribute("msg","조회된 회원이 없습니다.");
			return "redirect:/member/findid";
		}
		
		
		//인증코드 생성
		int ran = (int)(Math.random()*1000000);
		DecimalFormat df = new DecimalFormat("000000");
		String code = df.format(ran);
		
		//인증코드를 이전에 발급받은게 있나 확인
		Map<String, String> check = memberService.selectOneCertification(member);
		if(check!=null) {
			code = check.get("certificationCode");
			log.debug("이미존재해서 기존 코드 보내기로함 = {}",code);
		}else {
			//인증코드 db에 저장
			Map<String, Object> param = new HashMap<>();
			param.put("member", member);
			param.put("code", code);
			int result = memberService.insertCertificationCode(param);
		}
		//인증코드 이용한 코드를 담은 email발송
		String url = "http://interact-funding.kro.kr";
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("if"));//
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getEmail()));//받는사람이메일 입력받는곳
			message.setSubject("[이프] 비밀번호 변경링크입니다.","utf-8");//제목
			message.setContent(new MimeMultipart());
			Multipart mp = (Multipart) message.getContent();
			mp.addBodyPart(
					getContents("<a href='"+url+"/member/newPassword?memberNo="+member.getMemberNo()+"&code="+code+"'>비밀번호 변경하기</a>"));
			Transport.send(message);
			log.debug("이메일 발송 성공");
			redirectAttr.addFlashAttribute("msg","비밀번호 변경 링크가발송되었습니다!");

		} catch (Exception e) {
			log.error("이메일발송 실패");
			redirectAttr.addFlashAttribute("msg","링크 발송에 실패 하였습니다");
			return "redirect:/member/findid";
		}
		return "redirect:/member/login";
	}
	
	@GetMapping("/newPassword")
	public String newPassword(@RequestParam(required = false) String code, @RequestParam(required = false) String memberNo, RedirectAttributes redirect, Model model){
		log.debug("code = {}", code);
		log.debug("memberNo = {}", memberNo);
		if(code==null || memberNo==null) {
			redirect.addFlashAttribute("msg","유효하지 않은 링크입니다.");
			return "redirect:/";
		}
		Member member = memberService.selectOneMemberUseNo(Integer.parseInt(memberNo));
		Map<String, String> check = memberService.selectOneCertification(member);
		if(check==null) {
			redirect.addFlashAttribute("msg","유효하지 않은 링크입니다.");
			return "redirect:/";
		}
		
		if(Integer.parseInt(code)!=Integer.parseInt(check.get("certificationCode"))) {
			redirect.addFlashAttribute("msg","유효하지 않은 링크입니다.");
			return "redirect:/";
		}
		
		model.addAttribute("code",code);
		model.addAttribute("memberNo",memberNo);
		return "/member/newPassword";
	}
	
	@PostMapping("/newPassword")
	public String newPassword2(String memberNo, String password, RedirectAttributes redirect, Model model) {
		int memberNoo = Integer.parseInt(memberNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNoo);
		Member member = memberService.selectOneMemberUseNo(memberNoo);
		member.setPassword(password);
		map.put("password", bCryptPasswordEncoder.encode(member.getPassword()));
		
		//changePassword는 두가지일처리를함 비밀번호 변경, 인증코드 삭제
		int result = memberService.changePassword(map);
		if(result==0) {
			redirect.addFlashAttribute("msg","오류발생");
			return "redirect:/";
		}
		redirect.addFlashAttribute("msg","비밀번호 변경이 완료 되었습니다.");
		return "redirect:/member/login";
	}
	
	//시큐리티로 처리하여 MyCustomLoginSuccessHandler 와 @GetMapping("saveEmail")-ajax로 나누어 처리했음
//	@PostMapping("/login_if")
//	public String login_if(
//			Member member, 
//			@RequestParam(required = false) String remember,
//			Model model, 
//			@SessionAttribute(required = false) String next,
//			RedirectAttributes redirectAttr,
//			HttpServletRequest request, 
//			HttpServletResponse response) {
//		
//		log.debug("member = {} ", member);
//		log.debug("remember = {}", remember);
//		log.debug("next = {}",next);
//		
//		//로그인 처리
//		Member login = memberService.selectOneMember(member);
//		
//		if(login != null && bCryptPasswordEncoder.matches(member.getPassword(), login.getPassword())) {
//			model.addAttribute("next",null);
//			model.addAttribute("loginMember",login);
//			redirectAttr.addFlashAttribute("msg","로그인 성공");
//			
//			//이메일 기억하기 처리
//			Cookie c = new Cookie("saveEmail", member.getEmail());
//			c.setPath(request.getContextPath()+"/"); //path 쿠키를 전송할 url
//			
//			if(remember != null) {
//				c.setMaxAge(60 * 60 * 24 * 7); //7일짜리 영속쿠키로 지정 
//			}
//			else {
//				//saveId 체크해제시
//				c.setMaxAge(0); //0으로 지정해서 즉시 삭제, 음수로 지정하면 session종료시 제거 
//			}
//			response.addCookie(c);
//		}
//		else {
//			redirectAttr.addFlashAttribute("msg","로그인 실패");
//			return "redirect:/member/login";
//		}
//		return "redirect:"+ (next != null ? next : "/");
//	}
	
	//시큐리티로 전환하여 사용하지 않음
//	@GetMapping("/logout")
//	public String logout(
//			Model model
//			) {
//		model.addAttribute("loginMember",null);
//		return "redirect:/";
//	}
	
	@GetMapping("/memberEnroll")
	public void memberEnroll() {
		
	}
	@GetMapping("memberEnroll_if")
	public void memberEnroll_if(){
		
	}

	@PostMapping("/memberEnroll_if")
	public String memberEnroll_if(Member member, Model model, RedirectAttributes redirectAttr) {
		//이메일, 비밀번호, 이름 받아옴
		log.debug("member={}",member);
		
		//비밀번호 암호화
		member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
		member.setPlatform("IF");
		
		int result = memberService.insertMemberIf(member);
		redirectAttr.addFlashAttribute("msg","회원가입완료");
		return "redirect:/member/login";
	}
	
	@GetMapping("enrollAuthenticationCode")
	public void enrollAuthenticationCode(@RequestParam String email, HttpServletResponse response) throws IOException {
		log.debug("email = {}",email);
		
		//랜덤 6자리 인증코드 생성
		int rnd = (int)(Math.random()*1000000);
		DecimalFormat df = new DecimalFormat("000000");
		log.debug("code = {}", df.format(rnd));
		
		//response객체를 통해 인증코드 클라이언트로 전송
		response.setContentType("text/plain; charset=utf-8");
		
		//이메일로 인증코드 사용자에게 전송
		// 1. 사용자 이메일아이디 받아오기.
		//String memberEmailId = request.getParameter("memberEamilId");
		//블랙리스트 등록여부 검사
		Member blackMember = new Member();
		blackMember.setEmail(email);
		int black = memberService.selectOneBlackList(blackMember);
		if(black>0) {
			response.getWriter().print("B");
			return;
		}
		
		
		//이메일 중복검사
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		int result = memberService.selectEmailCheck(map);
		log.debug("result = {}",result);
		if(result>0) {
			response.getWriter().print("N");
			return;
		}
		
		response.getWriter().print(df.format(rnd));
		
		//블랙리스트 검사
		
		//문제가 없으면 이메일로 인증코드 발송
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("if"));//
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));//받는사람이메일 입력받는곳
			message.setSubject("[이프] 이메일 인증번호입니다.","utf-8");//제목
			message.setContent(new MimeMultipart());
			Multipart mp = (Multipart) message.getContent();
			mp.addBodyPart(
					getContents("인증코드 : "+df.format(rnd)));
			Transport.send(message);
			log.debug("이메일 발송 성공");

		} catch (Exception e) {
			log.error("이메일발송 실패");
		}
	}
	
	private BodyPart getContents(String html) throws MessagingException {
		BodyPart mbp = new MimeBodyPart();
		// setText를 이용할 경우 일반 텍스트 내용으로 설정된다.
//		 mbp.setText(html);
		// html 형식으로 설정
		mbp.setContent(html, "text/html; charset=utf-8");
		return mbp;
	}
	
	
	//마이페이지
	@GetMapping("/memberDetails")
	public void memberDetails(@SessionAttribute(required = false) Member loginMember, Model model) {
		//임시코드 추후 접근권한 업그레이시 삭제할 코드
		if(loginMember==null) return;
		
		//최근 내가 누른 좋아요 페이지 최대5개 번호 가져오기
		List<Integer> noList = fundingService.selectMyLikeNoList(loginMember.getMemberNo());
		log.debug("내가 좋아요 누른 리스트 : {}",noList);
		
		//해당하는 펀딩 리스트 가져오기
		List<Funding> list = new ArrayList<>();
		for(int x : noList) {
			list.add(fundingService.selectOneFundingKYS(x));
		}
		log.debug("내가 좋아하는 펀딩리스트 = {}",list);
		model.addAttribute("list",list);
		
		//내가 참여한 펀딩의 갯수
		int particiCnt = fundingService.selectMyPartiCnt(loginMember.getMemberNo());
		log.debug("내가 참여한 펀딩의 갯수 : {}", particiCnt);
		model.addAttribute("particiCnt",particiCnt);
		
		//내가 생성한 펀딩의 갯수
		int createCnt = fundingService.selectMyCreateCnt(loginMember.getMemberNo());
		log.debug("내가 생성한 펀딩의 갯수 : {}", createCnt);
		model.addAttribute("createCnt",createCnt);
		
		//포인트 충전 내역
		List<Point> pList = fundingService.selectMyPointList(loginMember.getMemberNo());
		log.debug("pList = {}",pList);
		model.addAttribute("pList", pList);
	}
	
	//마이페이지 포인트충전
	@ResponseBody
	@PostMapping("addPoint")
	public Map<String, Object> addPoint(int memberNo, int point, String memo, @SessionAttribute Member loginMember, Model model) {
		log.debug("memberNo={}",memberNo);
		log.debug("point={}",point);
		log.debug("memo={}",memo);
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("point", point);
		map.put("memo", memo);
		
		int result=memberService.insertPoint(map);
		loginMember.setPoint(loginMember.getPoint()+point);
		model.addAttribute("loginMember", loginMember);
		map.clear();
		map.put("msgg", point+"원 결제 완료");
		return map;
	}
	
	//쿠폰입력 충전
	@ResponseBody
	@PostMapping("inputCoupon")
	public Map<String,Object> inputCoupon(Model model, int memberNo, String couponText, @SessionAttribute Member loginMember) {
		log.debug("memberNo = {}",memberNo);
		log.debug("couponText = {}",couponText);
		Map<String, Object> map = new HashMap<>();
		map.put("couponText", couponText);
		//1. 유효한 쿠폰인지 검사
		Coupon c = memberService.selectOneCoupon(map);
		if(c == null) {
			map.put("status", false);
			map.put("msg", "유효하지 않은 쿠폰");
			return map;
		}
		
		//2. 해당 쿠폰에 대해 사용내역 조회
		map.put("memberNo", memberNo);
		map.put("couponNo", c.getNo());
		int result = memberService.selectCouponRecordCheck(map);
		
		//2.1분기처리 사용한적있음 = 충전안됨, 사용한적 없음 = 사용기록 남기고 충전
		if(result>0) {
			//사용한 기록 있음
			map.put("status", false);
			map.put("msg", "이미 사용한 쿠폰");
			return map;
		}
		
		//coupon_record테이블에 기록추가 - 트리거로 작동시키기
		map.put("point", c.getPoint());
		result = memberService.insertCoupon(map);
		map.put("status", true);
		map.put("msg", c.getPoint()+"포인트 쿠폰 사용 완료");
		
		//현재 로그인 중인 세션에 포인트 추가도 해줌~(다시불러오기 귀찮)
		loginMember.setPoint(loginMember.getPoint()+c.getPoint());
		model.addAttribute("loginMember", loginMember);
		return map;
	}
	
	@ResponseBody
	@PostMapping("sendMsg")
	public Map<String, Object> sendMsg(Msg msg) {
		Map<String, Object> map = new HashMap<>();
		log.debug("msg = {}",msg);
		//전송하는 대상이 유효한지 확인
		Member toMember = memberService.selectOneMemberUseNo(msg.getToMemberNo());
		log.debug("toMember={}",toMember);
		if(toMember==null) {
			map.put("status", false);
			map.put("msgg", "대상이 존재하지 않습니다");
			return map;
		}
		//받는사람 이름 표시
		msg.setToMemberName(toMember.getName());
		//메시지 전송하기
		int result = memberService.sendMsg(msg);
		log.debug("성공여부={}",Boolean.parseBoolean(String.valueOf(result)));
		map.put("status", true);
		map.put("msgg", "쪽지를 전송했습니다");
		return map;
		
	}
	
	@ResponseBody
	@PostMapping("msgReadStatusChg")
	public Map<String, Object> msgReadStatusChg(@RequestParam int no) {
		Map<String, Object> map = new HashMap<>();
		log.debug("no@controller= {}",no);
		//읽음표시 진행
		int result = memberService.msgReadStatusChg(no);
		if(result==0) {
			map.put("status", false);
			return map;
		}
		map.put("status", true);
		return map;
	}
	
	
	
	@GetMapping("/auth/kakao")
	public String kakaoRequest(@RequestParam String code, Model model, RedirectAttributes redirectAttr) throws Exception {
		try {
			log.debug("code = {}", code);
			BufferedReader br = null;
			//인증코드를 통해 accessToeken가져오기
			URL url = new URL("https://kauth.kakao.com/oauth/token");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			conn.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
			String urlParameters = "grant_type=authorization_code&client_id=" + KAKAO_API_KEY + "&redirect_uri="
					+ KAKAO_REDIRECT_URL + "&code=" + code;
			wr.writeBytes(urlParameters);
			wr.flush();
			wr.close();
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			Map<String, String> map = new Gson().fromJson(response.toString(), Map.class);
			log.debug("map = {}", map);
			
			
			
			//accessToken을 통해 사용자 정보 가져오기
			String accessToken = map.get("access_token");
			String refreshToken = map.get("refresh_token");
			log.debug("access_token = {}",accessToken);
			log.debug("refreshToken = {}",refreshToken);
			
			url = new URL("https://kapi.kakao.com/v2/user/me");
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
			responseCode = conn.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			inputLine=null;
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			log.debug("json={}",response.toString());
			
			//값 가져오기
			Map<String, String> map2 = new Gson().fromJson(response.toString(), Map.class);
			log.debug("map = {}",map2);
			
			String temp = new Gson().toJson(map2.get("properties"));
			log.debug("temp = {}",temp);
			
			String name = (String) new Gson().fromJson(temp, Map.class).get("nickname");
			log.debug("name = {}", name);
			
			
			temp = new Gson().toJson(map2.get("kakao_account"));
			String email = (String) new Gson().fromJson(temp, Map.class).get("email");
			log.debug("email = {}",email);
			//1. 회원인지 아닌지 확인
			Member m = new Member();
			m.setEmail(email);
			m.setName(name);
			m.setPlatform("KAKAO");
			Member tempMember = memberService.selectOneMemberKakao(m);
			log.debug("입력받은 멤버 = {}",m);
			log.debug("조회한 멤버 = {}",tempMember);
			//2. 회원이면 바로 로그인 시켜주기
			if(tempMember!=null) {
				//로긴멤버 등록
				model.addAttribute("loginMember",tempMember);
				
				//시큐리티 등록
				Authentication newAuthentication = 
						new UsernamePasswordAuthenticationToken(tempMember, null, tempMember.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(newAuthentication);
				return "redirect:/";
			}
			//3. 비회원이면 회원가입 페이지로 이동
			redirectAttr.addFlashAttribute("msg","회원가입 페이지로 이동");
			redirectAttr.addFlashAttribute("member",m);
			return "redirect:/member/memberEnroll_kakao";
		} catch (Exception e) {
			throw e;
		}
	}
	
	@GetMapping("/memberEnroll_kakao")
	public void memberEnrollKakao() {
	}
	
	@PostMapping("/memberEnroll_kakao")
	public String memberEnrollKakao(Member member, Model model, RedirectAttributes redirectAttr) {
		log.debug("member = {}",member);
		member.setPassword("kakao");
		int result = memberService.insertMemberKakao(member);
		
		member = memberService.selectOneMemberKakao(member);
		//로긴멤버 등록
		model.addAttribute("loginMember",member);
		
		//시큐리티 등록
		Authentication newAuthentication = 
				new UsernamePasswordAuthenticationToken(member, null, member.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		redirectAttr.addFlashAttribute("msg","회원가입완료");
		return "redirect:/";
	}
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	
	//이승우
	
	//천호현
	
	@ResponseBody
	@GetMapping("selectMemberPoint")
	public String selectMemberPoint(@RequestParam int memberNo) {
		String result = memberService.selectOneMemberPoint(memberNo);
		log.debug("result = {}", result);
		return result;
	}
}
