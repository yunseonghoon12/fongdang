package kh.spring.fongdang.message.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.fongdang.message.domain.Message;


@Repository
public class MessageDao {
	@Autowired
	private SqlSession sqlSession;	

	public List<Message> selectMessageList(int currentPage, int messageLimit, String receiver) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * messageLimit, messageLimit);
		return sqlSession.selectList("Message.selectMessageList", receiver, rowBounds);		
	}

	

	
	
	
}
