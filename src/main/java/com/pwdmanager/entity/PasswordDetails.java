package com.pwdmanager.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
@IdClass(PasswordDetailsId.class)
public class PasswordDetails {
	
	@Id
	@Column(name="category")
	private String category;
	
	@Id
	@Column(name="login_name")
	private String loginName;
	
	@Column(name="password")
	private String password;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_name")
	private UserDetails userDetails;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}
	
	
}
