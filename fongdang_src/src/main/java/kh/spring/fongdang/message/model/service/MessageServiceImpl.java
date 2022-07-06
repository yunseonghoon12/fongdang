package kh.spring.fongdang.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<Message> selectMessageList(int currentPage, int messageLimit, String receiver) {
		return dao.selectMessageList(currentPage, messageLimit, receiver);
	}

	public Message selectMessage(String m_no) {
		return dao.selectMessage(m_no);
	}
	
	public int countMyMessage(String receiver) {
		return dao.countMyMessage(receiver);
	}

}
