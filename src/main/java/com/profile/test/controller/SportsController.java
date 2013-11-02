package com.profile.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MovieController {
	
	@RequestMapping(value = {"/", "movie"}, method = RequestMethod.GET)
	public String home() {
		return "movie";
	}

}
