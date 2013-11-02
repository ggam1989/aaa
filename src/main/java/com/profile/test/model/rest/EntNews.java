package com.profile.test.model.rest;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class EntNews {
	private Socialpick socialpick;

	public Socialpick getSocialpick() {
		return socialpick;
	}
	public void setSocialpick(Socialpick socialpick) {
		this.socialpick = socialpick;
	}
}
