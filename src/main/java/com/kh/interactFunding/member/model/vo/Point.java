package com.kh.interactFunding.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private int no;
	private Date regDate;
	private String point;
	private int memberNo;
	private String memo;
}
