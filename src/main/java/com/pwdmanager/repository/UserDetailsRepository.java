package com.pwdmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pwdmanager.entity.UserDetails;

public interface UserDetailsRepository extends JpaRepository<UserDetails, String>{

}
