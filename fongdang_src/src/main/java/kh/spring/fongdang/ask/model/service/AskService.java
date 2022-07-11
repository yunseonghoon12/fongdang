package kh.spring.fongdang.ask.model.service;
import java.util.List;

import kh.spring.fongdang.ask.domain.Ask;

public interface AskService {
	
	
	/* 문의사항 불러오기 */
	public List<Ask> selectAsk(String email);
	
	/* 문의사항 작성하기 */
	public int insertAsk(Ask ask); 
	
	/* 문의사항 삭제하기 */
	public int deleteAsk(int ask_no); 
}
