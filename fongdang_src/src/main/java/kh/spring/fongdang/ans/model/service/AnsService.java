package kh.spring.fongdang.ans.model.service;
import java.util.List;

import kh.spring.fongdang.ans.domain.Ans;

public interface AnsService {
		

	/* 문의사항 답변하기 */
	public int insertAns(Ans ans); 
	public int deleteAns(int ask_no); 
	
}
