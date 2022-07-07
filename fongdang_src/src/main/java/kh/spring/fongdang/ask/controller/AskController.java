package kh.spring.fongdang.ask.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customerCenter")
public class AskController {
	
	@GetMapping("/ask")
	public String pageAsk() {
		return "customerCenter/ask";
	}
	@GetMapping("/doAsk")
	public String pagedoAsk() {
		return "customerCenter/doAsk";
	}

}