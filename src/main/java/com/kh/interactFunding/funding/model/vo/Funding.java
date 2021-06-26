package com.kh.interactFunding.funding.model.vo;



import java.sql.Date;
import java.util.Objects;

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
	private int fundingNo;
	private String title;
	private String categoryCode;
	private int nowAmount;
	private int goalAmount;
	private String ratePlanCode;
	private int writerNo;
	private int readCount;
	private int likeCount;
	private Date startDate;
	private Date dDay;
	private Date regDate;
	private String phone;
	private Boolean status;
	
	private Attachment attachment;

	
	//Collection 인터페이스에서 contains를 사용하기 위한 equals, hashCode재정의

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + fundingNo;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Funding other = (Funding) obj;
		if (fundingNo != other.fundingNo)
			return false;
		return true;
	}
}
