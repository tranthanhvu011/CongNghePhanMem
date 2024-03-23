package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Users;

import DB.ConnectDB;

public class UserModel {
	// ham lay ra danh sach cac user
	public List<Users> findAll() {
		List<Users> users = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from users");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setAddress(resultSet.getString("address"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setAdmin(resultSet.getBoolean("isAdmin"));
				user.setStatus(resultSet.getBoolean("status"));
				users.add(user);

			}
		} catch (Exception e) {
			e.printStackTrace();
			users = null;
		} finally {
			ConnectDB.disconnect();
		}
		return users;
	}

// tra ve danh sach dua check isAdmin
	public List<Users> findAllAdmin(boolean isAdmin) {
		List<Users> users = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where isAdmin = ?");
			preparedStatement.setBoolean(1, isAdmin);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setAddress(resultSet.getString("address"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setAdmin(resultSet.getBoolean("isAdmin"));
				user.setStatus(resultSet.getBoolean("status"));
				users.add(user);

			}
		} catch (Exception e) {
			e.printStackTrace();
			users = null;
		} finally {
			ConnectDB.disconnect();
		}
		return users;
	}

// ham dang ky
	public boolean create(Users user) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"insert into users(userName, fullName,email,phoneNumber, address, image, password, isAdmin, status, securityCode) values (?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getFullName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPhoneNumber());
			preparedStatement.setString(5, user.getAddress());
			preparedStatement.setString(6, user.getImage());
			preparedStatement.setString(7, user.getPassword());
			preparedStatement.setBoolean(8, user.isAdmin());
			preparedStatement.setBoolean(9, user.isStatus());
			preparedStatement.setString(10, user.getSecurityCode());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

// ham update
	public boolean update(Users user) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("update users set username = ?, fullname = ?, "
							+ "email = ?, phoneNumber = ?, address = ?, image = ?, password = ? ,isAdmin = ?, status=?, securityCode=?"
							+ " where id = ? ");
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getFullName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPhoneNumber());
			preparedStatement.setString(5, user.getAddress());
			preparedStatement.setString(6, user.getImage());
			preparedStatement.setString(7, user.getPassword());
			preparedStatement.setBoolean(8, user.isAdmin());
			preparedStatement.setBoolean(9, user.isStatus());
			preparedStatement.setString(10, user.getSecurityCode());
			preparedStatement.setInt(11, user.getId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

// ham xoa user
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("delete from users where id = ? ");
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

	// tim user dua vao id
	public Users findUserById(int id) {
		Users user = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where id = ? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setAddress(resultSet.getString("address"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setAdmin(resultSet.getBoolean("isAdmin"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			ConnectDB.disconnect();
		}
		return user;
	}

// ham tim ra user dua vao username
	public Users findUserByUserName(String userName) {
		Users user = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where userName = ? ");
			preparedStatement.setString(1, userName);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setAddress(resultSet.getString("address"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setAdmin(resultSet.getBoolean("isAdmin"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			ConnectDB.disconnect();
		}
		return user;
	}

	// phuong thuc tra ve user dua vao email
	public Users findUserByEmail(String email) {
		Users user = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where email = ? ");
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setAddress(resultSet.getString("address"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setAdmin(resultSet.getBoolean("isAdmin"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			ConnectDB.disconnect();
		}
		return user;
	}

// ham dang nhap
	public boolean checkLogin(String userName, String password) {
		Users user = findUserByUserName(userName);
		if (user != null) {
			if (user.isStatus() == true) {
				return BCrypt.checkpw(password, user.getPassword());
			}
		}
		return false;
	}

	public static void main(String[] args) {
		UserModel userModel = new UserModel();
//		System.out.println(userModel.delete(3));
//		System.out.println(userModel.findAll());
//	    System.out.println(userModel.findUserById(2));
//		System.out.println(userModel.findUserByUserName("admin1"));
//		System.out.println(userModel.checkLogin("admin1", "123"));
//		System.out.println(userModel.findAllAdmin(true));
//		System.out.println(BCrypt.checkpw("123", "$2a$10$GQtaPy7y2Q3gsPhA.QlJueoo0wGjy.hNK5/U/GTqqxXMGEjtDnkRi"));
		System.out.println(BCrypt.hashpw("Truong11232@", BCrypt.gensalt()));
	}
}
