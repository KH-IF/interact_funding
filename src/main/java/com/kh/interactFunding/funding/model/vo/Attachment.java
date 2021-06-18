package com.kh.interactFunding.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {
	
	private int no;
	private int fundingNo;
	private String originalFilename;
	private String renamedFilename;
	private Boolean status;	
}
