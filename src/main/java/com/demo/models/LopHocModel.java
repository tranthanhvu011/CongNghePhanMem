package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.LopHoc;

import DB.ConnectDB;

public class LopHocModel {
	public static List<LopHoc> findAll() {
		List<LopHoc> lopHoc = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from lophoc");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				LopHoc lopHoc1 = new LopHoc();
				lopHoc1.setId(resultSet.getInt("id"));
				lopHoc1.setGiaoVienChuNhiem(resultSet.getString("giaoVienChuNhiem"));
				lopHoc1.setTenLopHoc(resultSet.getString("tenLopHoc"));
				lopHoc.add(lopHoc1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			lopHoc = null;
		} finally {
			ConnectDB.disconnect();
		}
		return lopHoc;
	}
	public static LopHoc findLopHocByID(int id) {
		LopHoc lopHoc = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from lophoc where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				lopHoc = new LopHoc();
				lopHoc.setId(resultSet.getInt("id"));
				lopHoc.setGiaoVienChuNhiem(resultSet.getString("giaoVienChuNhiem"));
				lopHoc.setTenLopHoc(resultSet.getString("tenLopHoc"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			lopHoc = null;
		} finally {
			ConnectDB.disconnect();
		}
		return lopHoc;
	}
	public static boolean addLopHoc(LopHoc lopHoc) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"insert into lophoc(giaoVienChuNhiem, tenLopHoc) values (?, ?)");
			preparedStatement.setString(1, lopHoc.getGiaoVienChuNhiem());
			preparedStatement.setString(2, lopHoc.getTenLopHoc());
			int rowsAffected = preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
		}
		return false;
	}
	public static void main(String[] args) {
		System.out.println(new LopHocModel().findLopHocByID(1));
	}
}
