package kh.spring.fongdang.funding.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.funding.model.dao.ProductDao;
import kh.spring.fongdang.option.model.dao.OptionDao;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	/* 상품 등록 */
	@Override
	public int insertProduct(Product product ) {
		return productDao.insertProduct(product);
	}
	
	/* 상품 등록 저장된 내용 조회  */
	@Override
	public Product selectOneGetMakerName(String makerName) {
		return productDao.selectOneGetMakerName(makerName);
	}
	
	/* 상품 등록 수정시 업데이트  */
	@Override
	public int updateProduct(Product product ) {
		return productDao.updateProduct(product);
	}
}
