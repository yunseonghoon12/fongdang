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
	public int selectOneGetPNo(String email) {
		int i;
		try {
			i=sqlSession.selectOne("Option.selectOneGetPNo", email);
		} catch (NullPointerException e) {
			i=0;
		}
		return i;
	}
	public int selectOptionNo(int no) {
		return sqlSession.selectOne("Option.selectOptionNo", no);
	}
	public List<Option> selectOptionList(int p_no) {
		return sqlSession.selectList("Option.selectOptionList", p_no);
	}
	public Option selectOption(Option option ) {
		return sqlSession.selectOne("Option.selectOption", option);
	}
	
	public int deleteOption(Option option) {
		return sqlSession.delete("Option.deleteOption", option);
	}
}
