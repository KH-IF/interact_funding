package com.kh.interactFunding.funding_reward.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.interactFunding.funding_reward.model.dao.Funding_rewardDao;
import com.kh.interactFunding.funding_reward.model.vo.funding_reward;
@Service
public class Funding_rewardServiceImpl implements Funding_rewardService {
	@Autowired
	private Funding_rewardDao funding_rewardDao;
	@Override
	public List<funding_reward> indexfunding_rewardList() {
		
		return funding_rewardDao.indexfunding_rewardList();
	}
	

}
