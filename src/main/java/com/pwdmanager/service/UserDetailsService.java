package com.pwdmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pwdmanager.entity.UserDetails;
import com.pwdmanager.repository.UserDetailsRepository;

@Service
@Transactional
public class UserDetailsService {

	@Autowired
	private UserDetailsRepository userDetailsRepository;
	
	public List<UserDetails> getAllUsers() {
		return userDetailsRepository.findAll();
	}

	public void save(UserDetails userDetails) {
		userDetailsRepository.save(userDetails);
	}

	public UserDetails getUser(String userName) {
		return userDetailsRepository.findOne(userName);
	}
}
