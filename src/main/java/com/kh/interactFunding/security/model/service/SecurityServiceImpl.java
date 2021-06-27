package com.kh.interactFunding.security.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.security.model.dao.SecurityDao;

import lombok.extern.slf4j.Slf4j;

@Service("securityService")//아이디 직접명시, 안해주면 securityServiceImpl이라고 이름이되었을거임
@Slf4j
public class SecurityServiceImpl implements SecurityService{

	@Autowired
	private SecurityDao securityDao;
	
	/**
	 * security AthenticationManager에서 호출할녀석
	 */
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		UserDetails member = securityDao.loadUserByUsername(email);
		log.debug("security를 통한 로그인 정보 : {}",member);
		if(member == null)
			throw new UsernameNotFoundException(email);
		return member;
	}
	
}
