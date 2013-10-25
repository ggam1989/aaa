package com.profile.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.profile.test.model.ProfileModel;

public interface ProfileRepository extends JpaRepository<ProfileModel, Long>{
	List<ProfileModel> findByStar (String searchStar);
}
