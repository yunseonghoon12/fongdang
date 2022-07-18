package kh.spring.fongdang.pick.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.fongdang.pick.domain.Pick;
import kh.spring.fongdang.pick.model.service.PickService;


@Controller
@RequestMapping("/pick")
public class PickController {
	
	@Autowired
	private PickService pickService;
	
	
	// pick insert 
	@PostMapping("/insert") 
	public ResponseEntity<String> insertPick(Pick pick) {
		try {	
			pickService.insertPick(pick);	
			JSONObject jo = new JSONObject();
			jo.put("pick_yn", "Y");
			jo.put("pick_cnt", pickService.countPick(pick));
			jo.put("pick_update_yn", "Y");
			
			String result = jo.toString();
            return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
	    }
	}
	
	// pick delete 
	@PostMapping("/update")
	public ResponseEntity<String> updatePick(Pick pick){
		try {	
			pickService.updatePick(pick);
			JSONObject jo = new JSONObject();
			jo.put("pick_yn", pick.getPick_yn());
			jo.put("pick_cnt", pickService.countPick(pick));
			jo.put("pick_update_yn", "Y");
			String result = jo.toString(); 
            return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_ACCEPTABLE);
	    }
	}
	

}

