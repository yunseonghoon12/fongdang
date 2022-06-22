package kh.spring.sunea.maker.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.sunea.maker.domain.Maker;
import kh.spring.sunea.maker.model.dao.MakerDao;

@Service
public class MakerServiceImpl {

	@Autowired
	private MakerDao dao;
	
	public int insertMaker(Maker maker) {
	return dao.insertMaker(maker);
	}
	
}
