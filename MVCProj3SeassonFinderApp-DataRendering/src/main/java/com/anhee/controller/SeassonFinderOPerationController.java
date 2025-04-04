package com.anhee.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anhee.service.ISeassonFinderService;

@Controller
public class SeassonFinderOPerationController {

	
	@Autowired
	private ISeassonFinderService service;
	
	@RequestMapping("/")
	public String showHomePage() {
		
		
		return "welcome";//LVN
	}
	@RequestMapping("/season")
	public String showSeaason(Map<String,Object> map) {
		String msg=service.findSeason();
		//keep the result in module attribute 
		map.put("resultMsg",msg);
		
		return "Show_Result";
		
	}
}
