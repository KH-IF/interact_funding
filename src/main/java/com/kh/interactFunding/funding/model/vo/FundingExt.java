package com.kh.interactFunding.funding.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class FundingExt extends Funding{
	//김주연
	
	//대표이미지 번호
	private int no;
	private boolean hasAttachment;
	
	private List<Attachment> attachList;
	
	//작성자 이름
	private String name;
	
}
