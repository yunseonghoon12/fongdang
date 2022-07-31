package kh.spring.fongdang.option.model.service;

import java.util.List;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.maker.domain.Maker;
import kh.spring.fongdang.option.domain.Option;

public interface OptionService {
	
	/*  옵션 등록 */
	public int insertOption(Option option) ;
	/*  옵션 등록 전 조회  */
	public int selectOneGetPNo(String email);
	/*  옵션 번호 조회 */
	public int selectOptionNo(int no);
	/*  옵션 리스트 조회 */
	public List<Option> selectOptionList(int p_no);
	
	public Option selectOption(Option option);
	/*  옵션 삭제 */
	public int deleteOption(Option option);
}
