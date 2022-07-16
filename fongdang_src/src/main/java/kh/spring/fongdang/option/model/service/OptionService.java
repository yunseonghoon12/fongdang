package kh.spring.fongdang.option.model.service;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.option.domain.Option;

public interface OptionService {
	
	/*  옵션 등록 */
	public int insertOption(Option option) ;
	/*  옵션 등록 전 조회  */
	public String selectOneGetPNo(String email);
}
