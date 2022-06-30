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

	@Override
	   public List<Ask> selectAsk(Ask ask) throws Exception {
	      // TODO Auto-generated method stub
	      return dao.selectAsk(ask); 
	   }
		
	
}
