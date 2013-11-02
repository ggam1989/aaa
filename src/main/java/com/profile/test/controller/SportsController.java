package com.profile.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class SportsController {
	
	@RequestMapping(value = {"/", "sports"}, method = RequestMethod.GET)
	public String home() {
		return "sports";
	}
}
