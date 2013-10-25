package com.profile.test.service.impl;

import java.util.List;

import org.hibernate.envers.Audited;
import org.springframework.stereotype.Service;

import com.profile.test.model.ProfileModel;
import com.profile.test.repository.ProfileRepository;
import com.profile.test.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService{
	@Audited private ProfileRepository profileRepository;

	@Override
	public List<ProfileModel> getList() {
		return profileRepository.findAll();
	}

	@Override
	public void save(ProfileModel profileModel) {
		profileRepository.saveAndFlush(profileModel);
	}

	@Override
	public void deleteById(Long id) {
		profileRepository.delete(id);
	}

	@Override
	public ProfileModel updateId(Long id) {
		return profileRepository.findOne(id);
	}

	@Override
	public List<ProfileModel> findByStar(String searchStar) {
		return profileRepository.findByStar(searchStar);
	}
}
