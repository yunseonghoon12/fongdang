package kh.spring.fongdang.pick.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.pick.domain.Pick;
import kh.spring.fongdang.pick.model.dao.PickDao;

@Service
public class PickServiceImpl implements PickService {
	
  @Autowired
  private PickDao pickDao;
  
  public int insertPick(Pick pick) {
	  return pickDao.insertPick(pick);
  }
  
  public int deletePick(String p_no) {
	  return pickDao.deletePick(p_no);
  }
  
  
}
