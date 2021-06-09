package com.kh.interactFunding.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.funding.model.vo.Funding;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FundingDaoImpl implements FundingDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	//김윤수
	
	//김경태
	
	//김주연
	
	//박요한
	
	//배기원
	
	//이승우
	@Override
	public List<Funding> fundingList(Map<String, Object> map) {
		log.debug("map@dap = {}",map);
		return session.selectList("funding.selectFundingList", map);
	}

	@Override
	public List<Funding> fundingSearchList() {
		return session.selectList("funding.searchFundingList");
	}
	
	//천호현

	@Override
	public Funding selectOneFunding(int funding_no) {
		return session.selectOne("funding.selectOneFunding", funding_no);
	}
	
	
	
}
