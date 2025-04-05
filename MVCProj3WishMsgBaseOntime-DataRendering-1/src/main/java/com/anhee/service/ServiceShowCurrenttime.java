package com.anhee.service;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

@Service
public class ServiceShowCurrenttime  implements IserviceMgm{

	@Override
	public String showLocalTime() {
		
		int hour = LocalDateTime.now().getHour();
		
		String timeZone;
		 if (hour >= 5 && hour < 12) {
	            timeZone = "Morning";
	        } else if (hour >= 12 && hour < 17) {
	            timeZone = "Afternoon";
	        } else if (hour >= 17 && hour < 21) {
	            timeZone = "Evening";
	        } else {
	            timeZone = "Night";
	        }
		 return timeZone;
	}

}
