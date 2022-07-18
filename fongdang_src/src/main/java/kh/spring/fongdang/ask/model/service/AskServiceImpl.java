package kh.spring.fongdang.ask.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.ask.domain.Ask;
import kh.spring.fongdang.ask.model.dao.AskDao;


@Service
public class AskServiceImpl implements AskService { 

	@Autowired
	private AskDao dao;
	
	public int insertAsk(Ask ask) {
		return dao.insertAsk(ask);
		}
	public List<Ask> selectAskY(){
	      return dao.selectAskY(); 
	   }
	public List<Ask> selectAskN(){
		return dao.selectAskN(); 
	}
	
	@Override
	   public List<Ask> selectAsk(String email){
	      return dao.selectAsk(email); 
	   }
	@Override
	public List<Ask> selectAsk2(int ask_no){
		return dao.selectAsk2(ask_no); 
	}
	@Override
	public int deleteAsk(int ask_no) {
		return dao.deleteAsk(ask_no); 
	}
	public int updateAsk(int ask_no) {
		return dao.updateAsk(ask_no);  
	}

}
