package com.kh.interactFunding.member.model.vo;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements UserDetails{
	
	private int memberNo; 
	private String email;
	private String password; //password
	private String name;
	private String platform;
	private String accessToken;
	private int point;
	private Date regDate;
	private String phone;
	
	//복수개의 권한을 관리
	private List<SimpleGrantedAuthority> authorities;
	
	private boolean enabled; //활성화여부
	
	/**
	 * Collection - List/Set
	 * 
	 * Collection<? extends GrantedAuthority>
	 * Collection<GrantedAuthority>
	 * 
	 * 즉, GrantedAuthority를 상속받는 무엇인가가 제네릭 타입이라는것
	 * 제네릭의 상한(상한선을 정함)
	 * 
	 * 번외, <? super Integer> ==== Integer의 부모타입이면 ok === 하한선을 정함,제네릭의 하한
	 */
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}
	@Override
	public String getUsername() {
		return email;
		/**
		 * 유효기간이 만료되진 않았니?
		 * 잠기진 않았니?
		 * 비밀번호 유효기간이 만료되진 않았니?
		 * 물어보는건데
		 * 
		 * 아래 세개 그냥 true로 해줌
		 */
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
}
