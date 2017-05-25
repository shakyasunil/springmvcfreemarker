package com.dr.services;

import java.util.List;


import com.dr.model.User;

public interface UserService {

	public User create( User user);

	public User delete(Long id) throws Exception;

	public List findAll();

	public User update(User user) throws Exception;

	public User findById(Long id);

}
