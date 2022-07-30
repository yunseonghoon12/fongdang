package kh.spring.fongdang.oauth.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.oauth.model.dto.SnsInfo;

@Repository
public class SnsInfoDao {	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSnsUser(SnsInfo userInfo) {
		return sqlSession.insert("Oauth.insertSnsUser", userInfo);
	}

	public SnsInfo selectSnsUser(String sns_email) {
		return sqlSession.selectOne("Oauth.selectSnsUser", sns_email);
	}

}
