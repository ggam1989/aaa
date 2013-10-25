package com.profile.test.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProfileModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String name;
	private int age;
	private String majorwork;
	public ProfileModel(Long id, String name, int age, String majorwork) {
		this.id = id;
		this.name = name;
		this.age = age;
		this.majorwork = majorwork;
	}
	public ProfileModel() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getMajorwork() {
		return majorwork;
	}
	public void setMajorwork(String majorwork) {
		this.majorwork = majorwork;
	}
	
}
