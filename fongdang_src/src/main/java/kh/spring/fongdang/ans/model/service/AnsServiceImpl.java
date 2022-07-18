package kh.spring.fongdang.ans.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.ans.domain.Ans;
import kh.spring.fongdang.ans.model.dao.AnsDao;


@Service
public class AnsServiceImpl implements AnsService { 

	@Autowired
	private AnsDao dao;
	
	public int insertAns(Ans ans) {
		return dao.insertAns(ans);
		}
	public int deleteAns(int ask_no) {
		return dao.deleteAns(ask_no);
	}
}
