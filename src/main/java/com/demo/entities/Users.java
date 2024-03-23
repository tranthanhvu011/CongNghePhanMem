package com.demo.entities;

public class Users {
	private int id;
	private String userName;
	private String fullName;
	private String email;
	private String phoneNumber;
	private String address;
	private String image;
	private String password;
	private String securityCode;
	private boolean isAdmin;
	private boolean status;

	

	public Users(int id, String userName, String fullName, String phoneNumber) {
		super();
		this.id = id;
		this.userName = userName;
		this.fullName = fullName;
		this.phoneNumber = phoneNumber;
	}

	public Users(int id, String userName, String fullName, String email, String phoneNumber, String address,
			String image, String password, String securityCode, boolean isAdmin, boolean status) {
		super();
		this.id = id;
		this.userName = userName;
		this.fullName = fullName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.image = image;
		this.password = password;
		this.securityCode = securityCode;
		this.isAdmin = isAdmin;
		this.status = status;
	}

	public Users() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", userName=" + userName + ", fullName=" + fullName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", image=" + image + ", password="
				+ password + ", securityCode=" + securityCode + ", isAdmin=" + isAdmin + ", status=" + status + "]";
	}

}
