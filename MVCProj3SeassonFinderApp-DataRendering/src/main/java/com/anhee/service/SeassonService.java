package com.anhee.service;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

@Service("sessonService")
public class SeassonService implements ISeassonFinderService {

	@Override
	public String findSeason() {
		//b.logic to find the current seasson name
		//get system data;
		LocalDate date = LocalDate.now();
		int m=date.getMonthValue();
		
		//find the sasson 
		
		if (m>=3 && m<=6) {
			return "Summer Seasson";
		} else if(m>=7 && m<=10) {
			return "Rainy Seasson";
		}else {
			return "winter Seasson";
		}
		
	}

}
