package com.kh.interactFunding.websocket.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageVo {
	
	private int no;
	private int fundingNo;
	private String content;
	private int fromMemberNo;
	private String fromMemberName;
	private Date regDate;
    
}
