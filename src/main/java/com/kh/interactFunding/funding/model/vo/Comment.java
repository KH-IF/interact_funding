package com.kh.interactFunding.funding.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int commentNo;
	private int memberNo;
	private int commentLevel;
	private String content1;
	private int commentRef;
	private boolean hasAttachment;
	private List<Attachment> attachList;
}
