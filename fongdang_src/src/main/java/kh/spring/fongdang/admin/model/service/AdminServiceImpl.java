package kh.spring.fongdang.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.fongdang.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao dao;
}
