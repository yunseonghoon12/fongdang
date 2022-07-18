package kh.spring.fongdang.pick.model.service;

import kh.spring.fongdang.pick.domain.Pick;

public interface PickService {

	/* 좋아요 input */
	  public int insertPick(Pick pick);
	  
	/* 좋아요 output */
	  public int updatePick(Pick pick);
	  
	  public int countPick(Pick pick);
	  
	  public String selectPick(Pick pick);
}
