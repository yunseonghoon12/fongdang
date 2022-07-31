package kh.spring.fongdang.option.model.service;

import java.util.List;

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
	public int selectOneGetPNo(String email) {
		return optionDao.selectOneGetPNo(email);
	}
	
	public int selectOptionNo(int no) {
		return optionDao.selectOptionNo(no);
	}

	public List<Option> selectOptionList(int p_no){
		return optionDao.selectOptionList(p_no);
	}
	public Option selectOption(Option option) {
		return optionDao.selectOption(option);
	}
	@Override
	public int deleteOption(Option option) {
		return optionDao.deleteOption(option);
	}
	
	

}
