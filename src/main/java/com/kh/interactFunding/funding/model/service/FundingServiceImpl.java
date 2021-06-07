package com.kh.interactFunding.funding.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.funding.model.dao.FundingDao;
import com.kh.interactFunding.funding.model.vo.Funding;

@Service
public class FundingServiceImpl implements FundingService{
	
	@Autowired
	private FundingDao fundingDao;
	
	//김윤수
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	//이승우
	@Override
	public List<Funding> fundingList() {
		return fundingDao.fundingList();
	}
	//천호현
	
}
