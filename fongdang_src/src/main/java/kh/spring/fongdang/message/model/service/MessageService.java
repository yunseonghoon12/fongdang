package kh.spring.fongdang.message.model.service;

import java.util.List;

import kh.spring.fongdang.message.domain.Message;

public interface MessageService {
	public int insertMessage(Message message);
	/* 메이커와의 메시지 내역 목록 조회 */
	public List<Message> selectMessageList(int currentPage, int messagLimit, String receiver);
}
