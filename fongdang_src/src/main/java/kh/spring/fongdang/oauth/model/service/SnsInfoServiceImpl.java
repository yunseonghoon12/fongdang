package kh.spring.fongdang.oauth.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.oauth.model.dao.SnsInfoDao;
import kh.spring.fongdang.oauth.model.dto.SnsInfo;

@Service
public class SnsInfoServiceImpl implements SnsInfoService{
	@Autowired
	private SnsInfoDao dao;
	
	public int insertSnsUser(SnsInfo userInfo) {
		return dao.insertSnsUser(userInfo);
	};
	
	public SnsInfo selectSnsUser(String sns_email) {
		return dao.selectSnsUser(sns_email);
	}
}
