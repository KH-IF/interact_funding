package com.kh.interactFunding.schedule.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.interactFunding.funding.model.service.FundingService;
import com.kh.interactFunding.funding.model.vo.Funding;
import com.kh.interactFunding.schedule.vo.EarlyStartMessage;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Schedule {
	
	@Autowired
	private FundingService fundingService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void EarlyFundingStartMessage() {
		
		//오늘날짜에 알람신청한 사람 모두 뽑기(오늘 start_date인 펀딩에 알람을 누른사람)
		List<EarlyStartMessage> EarlyMember = fundingService.selectEarlyMemberList();
		
		//EarlyMember =[EarlyStartMessage(no=40, fundingNo=303, memberNo=21, startDate=Wed Jun 30 00:00:00 KST 2021)] 
		
		//해당 명단에 쪽지보내기
		for (int i = 0; i < EarlyMember.size(); i++) {
			
			EarlyStartMessage earlyMember = EarlyMember.get(i);
			
			//펀딩제목 가져오기 위함
			Funding funding = fundingService.selectOneFunding(earlyMember.getFundingNo());
			
			//펀딩제목 넣기
			earlyMember.setTitle(funding.getTitle());
			
			//메세지 보내기
			int result = fundingService.sendAlramMessage(earlyMember);
		}
	}
}
