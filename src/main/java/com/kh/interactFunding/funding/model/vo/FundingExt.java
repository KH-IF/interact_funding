package com.kh.interactFunding.funding.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	
}
