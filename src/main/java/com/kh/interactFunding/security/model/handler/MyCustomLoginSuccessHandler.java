package com.kh.interactFunding.security.model.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MyCustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String next = new String(((String)session.getAttribute("next") !=null ? (String)session.getAttribute("next") : request.getContextPath()+"/"));
		log.debug("next@handler = {}",next);
		Member loginMember = (Member)authentication.getPrincipal();
		session.setAttribute("loginMember", loginMember);
		session.removeAttribute("next");
		
		//이메일 기억하기 처리-ajax로 처리해버렸음
		session.setAttribute("msg", "로그인 완료");
		response.sendRedirect( request.getContextPath()+"/");
	}
}
