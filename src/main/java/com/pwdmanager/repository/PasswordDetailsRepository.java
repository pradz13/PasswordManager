package com.pwdmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pwdmanager.entity.PasswordDetails;

public interface PasswordDetailsRepository extends JpaRepository<PasswordDetails, String> {

}
