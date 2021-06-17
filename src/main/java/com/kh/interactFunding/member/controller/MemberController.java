package com.kh.interactFunding.member.controller;



import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
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

import com.kh.interactFunding.member.model.service.MemberService;
import com.kh.interactFunding.member.model.vo.Coupon;
import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes({"loginMember","next"})
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	
	final String username = "interact.funding";
	final String password = "if1234!!!";
	//김윤수
	
	@GetMapping("/login")
	public void login(@SessionAttribute(required = false) String next , @RequestHeader (name = "Referer", required = false) String referer, Model model) {
		log.info("referer@login = {}", referer);
		log.debug("next@login = {}",next);
		//나중에 스프링 시큐리티 사용할때 수정바람, 로그인시 로그인 페이지 못들어오게끔
//		if(referer != null && next==null) {
			model.addAttribute("next", referer);
			log.debug("next 세션값 생성");
//		}
	}
	
	@PostMapping("/login_if")
	public String login_if(
			Member member, 
			@RequestParam(required = false) String remember,
			Model model, 
			@SessionAttribute(required = false) String next,
			RedirectAttributes redirectAttr,
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		log.debug("member = {} ", member);
		log.debug("remember = {}", remember);
		log.debug("next = {}",next);
		
		//로그인 처리
		Member login = memberService.selectOneMember(member);
		
		if(login != null && bCryptPasswordEncoder.matches(member.getPassword(), login.getPassword())) {
			model.addAttribute("next",null);
			request.getSession().removeAttribute("next");
			model.addAttribute("loginMember",login);
			redirectAttr.addFlashAttribute("msg","로그인 성공");
			
			//이메일 기억하기 처리
			Cookie c = new Cookie("saveEmail", member.getEmail());
			c.setPath(request.getContextPath()+"/"); //path 쿠키를 전송할 url
			
			if(remember != null) {
				c.setMaxAge(60 * 60 * 24 * 7); //7일짜리 영속쿠키로 지정 
			}
			else {
				//saveId 체크해제시
				c.setMaxAge(0); //0으로 지정해서 즉시 삭제, 음수로 지정하면 session종료시 제거 
			}
			response.addCookie(c);
		}
		else {
			redirectAttr.addFlashAttribute("msg","로그인 실패");
			return "redirect:/member/login";
		}
		return "redirect:"+ (next != null ? next : "/");
	}
	
	@GetMapping("/logout")
	public String logout(
			HttpServletRequest request,
			Model model
			) {
		request.getSession().removeAttribute("loginMember");
		model.addAttribute("loginMember",null);
		return "redirect:/";
	}
	
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
		return "redirect:/";
	}
	
	@GetMapping("/memberDetails")
	public void memberDetails() {
		
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
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	
	//이승우
	
	//천호현
}
