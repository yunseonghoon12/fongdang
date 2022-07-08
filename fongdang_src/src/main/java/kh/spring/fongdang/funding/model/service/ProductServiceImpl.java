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

	@Override
	public int insertProduct(Product product ) {
		return productDao.insertProduct(product);
	}

	@Override
	public String selectOneGetMakerName(String makerName) {
		return productDao.selectOneGetMakerName(makerName);
	}
}
