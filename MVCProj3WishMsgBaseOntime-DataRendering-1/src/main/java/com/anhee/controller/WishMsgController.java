package com.anhee.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anhee.service.IserviceMgm;

@Controller
public class WishMsgController {
	
	@Autowired
	private IserviceMgm service;
@RequestMapping("/")
public String showHomePage(){
	return "welcome";
	}

@RequestMapping("/wish")
public String wish(Map<String, Object> map){
	String timeZone =service.showLocalTime();
	map.put("msg", timeZone);
	
return "WishMsg";
}

}
