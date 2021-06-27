package com.kh.interactFunding.security.model.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.kh.interactFunding.member.model.vo.Member;

public class RememberMeSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		request.getSession().setAttribute("loginMember", (Member)(authentication.getPrincipal()));
		String next = request.getHeader("Referer");
		if(next==null) {
			next = request.getContextPath()+"/";
		}
		response.sendRedirect(next);
	}
	

}
