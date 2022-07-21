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

	public List<Message> selectSendList(int currentPage, int messageLimit, String sender) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * messageLimit, messageLimit);
		return sqlSession.selectList("Message.selectSendList", sender, rowBounds);		
	}
	
	public List<Message> selectReceiveList(int currentPage, int messageLimit, String receiver) {
		RowBounds rowBounds = new RowBounds((currentPage -1) * messageLimit, messageLimit);
		return sqlSession.selectList("Message.selectReceiveList", receiver, rowBounds);
	}

	public int insertMessage(Message message) {
		return sqlSession.insert("Message.insertMessage", message);
	}
	
	public int insertReplyMessage(Message message) {
		return sqlSession.insert("Message.insertReplyMessage", message);
	}
	
	public int updateMessage(Message message) {
		return sqlSession.update("Message.updateMessage", message);
	}
	
	public Message selectMessage(String m_no) {		
		return sqlSession.selectOne("Message.selectMessage", m_no);
	}
	
	public int countMyReceiveMessage(String receiver) {
		return sqlSession.selectOne("Message.countMyReceiveMessage", receiver);
	}

	public int countMySendMessage(String sender) {
		return sqlSession.selectOne("Message.countMySendMessage", sender);
	}

}
