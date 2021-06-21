package com.kh.interactFunding.common.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.interactFunding.member.model.service.MemberService;
import com.kh.interactFunding.member.model.vo.Member;
import com.kh.interactFunding.member.model.vo.Msg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MsgInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	MemberService memberService;
	
	/**
	 * Handler 호출전 실행
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<Msg> receive = memberService.selectReceiveMsg(loginMember);
			List<Msg> send = memberService.selectSendMsg(loginMember);
			session.setAttribute("receive", receive);
			session.setAttribute("send", send);
			
			Boolean b = true;
			for(Msg x : receive) {
				if(b && x.getRead()==false) {
					b=false;
					break;
				}
			}
			log.debug("notReadMsg={}",b);
			session.setAttribute("notReadMsg", b);
		}
		return super.preHandle(request, response, handler); //true 리턴 고정
	}

	/**
	 * Handler 리턴이후
	 * ModelAndView객체 확인가능
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * view단 작업 이후 
	 * (view단 = jsp작업 이후에 여길 한번 더 거치게됨)
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	
}
