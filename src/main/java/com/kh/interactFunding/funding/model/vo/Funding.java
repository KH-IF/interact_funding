package com.kh.interactFunding.funding.model.vo;



import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class Funding {
	//이승우
	private int fundingNo;
	private String title;
	private String categoryCode;
	private String categoryName;
	private int nowAmount;
	private int goalAmount;
	private String ratePlanCode;
	private int writerNo;
	private int readCount;
	private int likeCount;
	private String content;
	private String earlyContent;

	//이승우 name, attach 추가
	private String name;
	private Attachment attach;
	
	//김주연 start_day date로 변환
	//@DateTimeFormat(pattern = "yyyy-MM-dd")

	private Date startDate;
	private Date dDay;
	
	private Date regDate;
	private String phone;
	
	//김주연 funding작성 완료여부 YN
	private boolean status;			//status ----- 'Y','N' ->커스텀 타입핸들러 필요
	
	
}
