package kh.spring.fongdang.maker.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.maker.model.dao.MakerDao;


@Service
public class MakerServiceImpl implements MakerService {

	@Autowired
	private MakerDao dao;
	
	public int insertMaker(Maker maker) {
		return dao.insertMaker(maker);
		}
		
	
}