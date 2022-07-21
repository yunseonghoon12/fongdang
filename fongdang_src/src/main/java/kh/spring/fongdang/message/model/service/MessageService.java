package kh.spring.fongdang.message.model.service;

import java.util.List;

import kh.spring.fongdang.message.domain.Message;

public interface MessageService {
	/* 문의 메시지 삽입 */
	public int insertMessage(Message message);
	/* 답장 삽입 */
	public int insertReplyMessage(Message message);
	/* 발신 메시지 목록 조회 */
	public List<Message> selectSendList(int currentPage, int messagLimit, String sender);
	/* 수신 메시지 목록 조회 */
	public List<Message> selectReceiveList(int currentPage, int messageLimit, String receiver);
	/* 메시지 조회 */
	public Message selectMessage(String m_no);
	/* 받은 메시지 수 */
	public int countMyReceiveMessage(String receiver);
	/* 보낸 메시지 수 */
	public int countMySendMessage(String sender);
	
	
	
}
