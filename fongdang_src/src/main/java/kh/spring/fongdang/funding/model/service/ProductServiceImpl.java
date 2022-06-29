package kh.spring.fongdang.funding.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.funding.domain.Product;
import kh.spring.fongdang.funding.model.dao.ProductDao;
import kh.spring.fongdang.option.model.dao.OptionDao;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private OptionDao optionDao;
	
	
	
	public void insertProduct(Product product ) {
		 // optionDao.insertOption(option);  // 옵션Dao  호출  ToDo 
		productDao.insertProduct(product);
		
		
	}

}
