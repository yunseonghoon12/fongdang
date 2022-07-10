package kh.spring.fongdang.maker.model.service;

import kh.spring.fongdang.maker.domain.Maker;

public interface MakerService {
	
	/* 메이커등록 */
	public int insertMaker(Maker maker);
	
	/* 메이커등록 된 부분 조회  */
	public Maker selectMaker(String email);
	
	/* 메이커수정 */
	public int updateMaker(Maker maker);
}
