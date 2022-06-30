package kh.spring.fongdang.ask.model.service;
import java.util.List;

import kh.spring.fongdang.ask.domain.Ask;

public interface AskService {
	
	public int insertAsk(Ask ask); 
	public List<Ask> selectAsk(Ask ask) throws Exception;
	
}
