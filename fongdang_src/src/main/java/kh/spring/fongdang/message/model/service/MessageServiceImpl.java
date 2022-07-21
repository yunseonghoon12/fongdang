package kh.spring.fongdang.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.fongdang.message.domain.Message;
import kh.spring.fongdang.message.model.dao.MessageDao;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao dao;
	
	@Override
	public int insertMessage(Message message) {
		return dao.insertMessage(message);
	}
	
	@Override
	@Transactional
	public int insertReplyMessage(Message message) {
		dao.insertReplyMessage(message);
		return dao.updateMessage(message);
	}
	
	public List<Message> selectSendList(int currentPage, int messageLimit, String sender) {
		return dao.selectSendList(currentPage, messageLimit, sender);
	}
	
	public List<Message> selectReceiveList(int currentPage, int messageLimit, String receiver) {
		return dao.selectReceiveList(currentPage, messageLimit, receiver);
	}

	public Message selectMessage(String m_no) {
		return dao.selectMessage(m_no);
	}
	
	public int countMyReceiveMessage(String receiver) {
		return dao.countMyReceiveMessage(receiver);
	}
	
	public int countMySendMessage(String sender) {
		return dao.countMySendMessage(sender);
	}
}
