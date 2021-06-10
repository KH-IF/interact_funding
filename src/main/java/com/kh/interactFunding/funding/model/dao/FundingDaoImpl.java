package com.kh.interactFunding.funding.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.funding.model.vo.Funding;

@Repository
public class FundingDaoImpl implements FundingDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	//김윤수
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	@Override
	public List<Funding> indexfundingList() {
		// TODO Auto-generated method stub
		return session.selectList("funding.indexfundingList");
	}
	
	
	//이승우
	@Override
	public List<Funding> fundingList() {
		return session.selectList("funding.selectFundingList");
	}
	//천호현
	
}
