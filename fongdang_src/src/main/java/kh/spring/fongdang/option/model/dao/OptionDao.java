package kh.spring.fongdang.option.model.dao;

import java.util.List;

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
	public String selectOneGetPNo(String email) {
		return sqlSession.selectOne("Option.selectOneGetPNo", email);
	}
	public int selectOptionNo(int no) {
		return sqlSession.selectOne("Option.selectOptionNo", no);
	}
	public List<Option> selectOptionList(int p_no) {
		return sqlSession.selectList("Option.selectOptionList", p_no);
	}
	
}
