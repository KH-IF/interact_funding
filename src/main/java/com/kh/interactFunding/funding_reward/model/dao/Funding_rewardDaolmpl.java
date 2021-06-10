package com.kh.interactFunding.funding_reward.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.funding_reward.model.vo.funding_reward;
@Repository
public class Funding_rewardDaolmpl implements Funding_rewardDao {
	@Autowired
	SqlSessionTemplate session;
	@Override
	public List<funding_reward> indexfunding_rewardList() {
		return session.selectList("funding_reward.indexfunding_rewardList");
	}

	
	
}
