package com.dr.services;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dr.model.User;
import com.dr.repository.UserRepository;



@Service
@Transactional
public class UserServiceImp implements UserService {

	@Inject
	private UserRepository userRepository;

	@Transactional
	public User create(User user) {
		User createdUser = user;
		return userRepository.save(createdUser);
	}

	@Transactional
	public User findById(Long id) {
		return userRepository.findOne(id);
	}

	@Transactional(rollbackFor = Exception.class)
	public User delete(Long id) throws Exception {
		User deletedUser = userRepository.findOne(id);

		if (deletedUser == null)
			throw new Exception();

		userRepository.delete(deletedUser);
		return deletedUser;
	}

	@Transactional
	public List findAll() {
		return userRepository.findAll();
	}
	@Transactional(rollbackFor = Exception.class)
	public User update(User user) throws Exception {
		User updatedUser = userRepository.findOne(user.getId());
		if (updatedUser == null)
			throw new Exception();
        updatedUser.setFirstName(user.getFirstName());
        updatedUser.setLastName(user.getLastName());
        updatedUser.setEmail(user.getEmail());
        updatedUser.setPassword(user.getPassword());
    	return updatedUser;
	}
	public UserRepository getUserRepository() {
		return userRepository;
	}

	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
}
