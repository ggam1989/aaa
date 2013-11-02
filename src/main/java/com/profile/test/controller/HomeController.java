package com.profile.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.profile.test.model.ProfileModel;
import com.profile.test.model.rest.EntNews;
import com.profile.test.service.ProfileService;

@Controller
public class HomeController {
	@Autowired private ProfileService profileService;
	@Autowired private RestTemplate restTemplate;

	@RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "news", method = RequestMethod.GET)
	public String getNews(ModelMap map) {
		EntNews news = restTemplate.getForObject("http://apis.daum.net/socialpick/search?category=e&output=json", EntNews.class);
		System.out.println(news.getSocialpick().getItem().get(0).getCategory());
		map.put("news", news);
		return "jsonView";
	}

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(ModelMap map) {
		List<ProfileModel> profileList = profileService.getList();
		map.put("profileList", profileList);
		return "jsonView";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String saveprofile(ProfileModel profileModel) {
		profileService.save(profileModel);
		return "jsonView";
	}

	@RequestMapping(value = "profile/{id}", method = RequestMethod.DELETE)
	public String deleteById(@PathVariable Long id) {
		profileService.deleteById(id);
		return "jsonView";
	}

	@RequestMapping(value = "profile/{id}", method = RequestMethod.GET)
	public String updateId(@PathVariable Long id, ModelMap map) {
		ProfileModel updateId = profileService.updateId(id);
		map.put("idKey", updateId);
		return "jsonView";
	}

	@RequestMapping(value = "profile", method = RequestMethod.PUT)
	public String update(ProfileModel profileModel) {
		profileService.save(profileModel);
		return "jsonView";
	}
	@RequestMapping(value = "profile/search", method = RequestMethod.GET)
	public String searchStar(String searchStar,ModelMap map){
		List<ProfileModel> search = profileService.findByStar(searchStar);
		map.put("starKey",search);
		return "jsonView";
	}
}
