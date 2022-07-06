package kh.spring.fongdang.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.spring.fongdang.message.model.service.MessageServiceImpl;

@Controller
public class MessageController {
	@Autowired
	private MessageServiceImpl service;	
	
}
