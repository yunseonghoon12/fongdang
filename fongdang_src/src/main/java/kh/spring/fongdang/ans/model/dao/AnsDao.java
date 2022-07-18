package kh.spring.fongdang.ans.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.ans.domain.Ans;
import kh.spring.fongdang.ask.domain.Ask;

@Repository
public class AnsDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertAns(Ans ans) {
		return sqlSession.insert("Ans.insertAns",ans);
	}
	public int deleteAns(int ask) {
		return sqlSession.delete("Ans.deleteAns",ask);
	}

}
