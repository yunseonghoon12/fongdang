package kh.spring.fongdang.option.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.option.domain.Option;
import kh.spring.fongdang.option.model.dao.OptionDao;

@Service
public class OptionServiceImpl implements OptionService {
	
	@Autowired
	private OptionDao optionDao;
	
	public int insertOption(Option option) {
		return optionDao.insertOption(option);
	}
	@Override
	public String selectOneGetPNo(String email) {
		return optionDao.selectOneGetPNo(email);
	}
	

}
