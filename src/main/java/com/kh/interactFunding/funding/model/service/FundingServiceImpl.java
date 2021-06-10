package com.kh.interactFunding.funding.model.service;

import java.util.List;
import java.util.Map;

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
	@Override
	public List<Funding> indexfundingList() {
		// TODO Auto-generated method stub
		return fundingDao.indexfundingList();
	}
	
	
	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		return fundingDao.fundingList(map);
	}

	//천호현

	@Override
	public Funding selectOneFunding(int funding_no) {
		return fundingDao.selectOneFunding(funding_no);
	}
	
	
	
}
