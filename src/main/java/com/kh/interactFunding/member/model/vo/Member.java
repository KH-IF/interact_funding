package com.kh.interactFunding.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int memberNo;
	private String email;
	private String password;
	private String name;
	private String platform;
	private String accessToken;
	private int point;
	private Date regDate;
	private String phone;
}
