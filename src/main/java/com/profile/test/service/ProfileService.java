package com.profile.test.service;

import java.util.List;

import com.profile.test.model.ProfileModel;

public interface ProfileService {

	List<ProfileModel> getList();

	void save(ProfileModel profileModel);

	void deleteById(Long id);

	ProfileModel updateId(Long id);

	List<ProfileModel> findByStar(String searchStar);

}
