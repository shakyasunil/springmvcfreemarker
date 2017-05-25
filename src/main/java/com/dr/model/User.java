package com.dr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User extends BaseModel {
   private static final long serialVersionUID = 1L;
   @Id
   @GeneratedValue
   private Long id;
   public Long getId() {
		return id;
   }

   public void setId(Long id) {
		this.id = id;
   }   
   
   @Column
   private String firstName;
   @Column
   private String lastName;
   @Column
   private String email;
   @Column
   private String password;


   public String getFirstName() {
		return firstName;
   }

   public void setFirstName(String firstName) {
	 this.firstName = firstName;
   }
   public String getLastName() {
		return lastName;
   }

   public void setLastName(String lastName) {
	 this.lastName = lastName;
   }
   public String getEmail() {
		return email;
   }

   public void setEmail(String email) {
	 this.email = email;
   }
   public String getPassword() {
		return password;
   }

   public void setPassword(String password) {
	 this.password = password;
   }




}