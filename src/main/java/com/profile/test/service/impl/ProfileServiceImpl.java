package com.profile.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.profile.test.model.ProfileModel;
import com.profile.test.repository.ProfileRepository;
import com.profile.test.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService{
	@Autowired private ProfileRepository profileRepository;

	
	@Override
	@Cacheable(value="listCache")
	public List<ProfileModel> getList() {
		return profileRepository.findAll();
	}

	@Override
	@CacheEvict(value="listCache", allEntries = true)
	public void save(ProfileModel profileModel) {
		profileRepository.saveAndFlush(profileModel);
	}

	@Override
	@CacheEvict(value="listCache", allEntries = true)
	public void deleteById(Long id) {
		profileRepository.delete(id);
	}

	@Override
	@CacheEvict(value="listCache", allEntries = true)
	public ProfileModel updateId(Long id) {
		return profileRepository.findOne(id);
	}

	@Override
	public List<ProfileModel> findByStar(String searchStar) {
		return profileRepository.findByNameLike("%"+searchStar+"%");
	}
}
