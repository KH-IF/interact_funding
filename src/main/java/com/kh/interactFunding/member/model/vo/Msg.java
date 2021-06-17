package com.kh.interactFunding.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Msg {
	private int no;
	private int toMemberNo;
	private int fromMemberNo;
	private String fromMemberName;
	private String title;
	private String content;
	private Boolean read;
	private String toMemberName;
}
