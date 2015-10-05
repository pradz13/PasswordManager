package com.pwdmanager.entity;

import java.io.Serializable;

public class PasswordDetailsId implements Serializable {

	private static final long serialVersionUID = -8313658097700027896L;
	private String category;
	private String loginName;
	
	

	public PasswordDetailsId() {
	}

	public PasswordDetailsId(String category, String loginName) {
		this.category = category;
		this.loginName = loginName;
	}



	public String getCategory() {
		return category;
	}

	public String getLoginName() {
		return loginName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result
				+ ((loginName == null) ? 0 : loginName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PasswordDetailsId other = (PasswordDetailsId) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (loginName == null) {
			if (other.loginName != null)
				return false;
		} else if (!loginName.equals(other.loginName))
			return false;
		return true;
	}
}
