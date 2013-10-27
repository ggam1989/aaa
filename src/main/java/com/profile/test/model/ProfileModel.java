package com.profile.test.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProfileModel implements Serializable{
	private static final long serialVersionUID = -195188855858606186L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String name;
	private String company;
	private String majorwork;
	private String link;
	
	
	public ProfileModel(Long id, String name, String company, String majorwork,String link) {
		this.id = id;
		this.name = name;
		this.company  = company ;
		this.majorwork = majorwork;
		this.link = link;
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
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company  = company ;
	}
	public String getMajorwork() {
		return majorwork;
	}
	public void setMajorwork(String majorwork) {
		this.majorwork = majorwork;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
}
