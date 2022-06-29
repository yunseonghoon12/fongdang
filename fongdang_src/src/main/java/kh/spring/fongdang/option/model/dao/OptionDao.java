package kh.spring.fongdang.option.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.option.domain.Option;

@Repository
public class OptionDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertOption(Option option) {
		return sqlSession.insert("Option.insertOption", option);
	}

}
