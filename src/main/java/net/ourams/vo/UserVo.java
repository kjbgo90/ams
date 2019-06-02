package net.ourams.vo;

public class UserVo {
	int userNo;
	String email;
	String password;
	String userName;
	int userType;
	String logoPath;
	String phoneNumber;

	public UserVo() {
	}

	public UserVo(int userNo, String email, String password, String userName, int userType, String logoPath,
			String phoneNumber) {
		this.userNo = userNo;
		this.email = email;
		this.password = password;
		this.userName = userName;
		this.userType = userType;
		this.logoPath = logoPath;
		this.phoneNumber = phoneNumber;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", email=" + email + ", password=" + password + ", userName=" + userName
				+ ", userType=" + userType + ", logoPath=" + logoPath + ", phoneNumber=" + phoneNumber + "]";
	}

}
