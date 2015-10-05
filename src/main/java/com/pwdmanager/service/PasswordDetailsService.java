package com.pwdmanager.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pwdmanager.entity.PasswordDetails;
import com.pwdmanager.entity.UserDetails;
import com.pwdmanager.repository.PasswordDetailsRepository;
import com.pwdmanager.repository.UserDetailsRepository;

@Service
@Transactional
public class PasswordDetailsService {
	
	@Autowired
	UserDetailsRepository userDetailsRepository;
	
	@Autowired
	PasswordDetailsRepository passwordDetailsRepository;

	public void save(PasswordDetails passwordDetails, String name) {
		UserDetails userDetails = userDetailsRepository.findOne(name);
		passwordDetails.setUserDetails(userDetails);
		passwordDetailsRepository.save(passwordDetails);
	}
	
	public List<PasswordDetails> getPasswordDetails(String name) {
		List<PasswordDetails> passwordDetails = passwordDetailsRepository.findAll();
		Iterator<PasswordDetails> itr = passwordDetails.iterator();
		while(itr.hasNext()){
			PasswordDetails pwdDetails = itr.next();
			if(!pwdDetails.getUserDetails().getUserName().equals(name)) {
				itr.remove();
			}
		}
		return passwordDetails;
	}
	
}
