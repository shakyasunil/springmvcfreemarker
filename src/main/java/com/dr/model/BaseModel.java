package com.dr.model;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class BaseModel {

	 @Id
	 @GeneratedValue
	 private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	 
	 
	 
}
