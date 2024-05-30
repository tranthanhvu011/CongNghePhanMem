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
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select lophoc.id, giaoVienChuNhiem, tenLopHoc, giaovien.nameGiaoVien from lophoc inner join giaovien on giaoVienChuNhiem= giaovien.id");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				LopHoc lopHoc1 = new LopHoc();
				lopHoc1.setId(resultSet.getInt("id"));
				lopHoc1.setGiaoVienChuNhiem(resultSet.getString("giaoVienChuNhiem"));
				lopHoc1.setTenLopHoc(resultSet.getString("tenLopHoc"));
				lopHoc1.setNameGiaoVien(resultSet.getString("giaovien.nameGiaoVien"));
				lopHoc.add(lopHoc1);
			}
			return lopHoc;
		} catch (Exception e) {
			e.printStackTrace();
		return null;
		}
			}
	public static int countNameLopHoc(String nameLopHoc) {
	    String query = "SELECT count(*) FROM lophoc WHERE tenLopHoc = ?";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setString(1, nameLopHoc);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            return resultSet.getInt(1);
	        }
	        return 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
	public static int countByIDTeacher(int IdNe) {
		String query = "select count(*) from lophoc where giaoVienChuNhiem = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setInt(1, IdNe);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public static int totalLopHoc() {
	    String query = "SELECT COUNT(*) FROM lophoc";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            return resultSet.getInt(1);
	        }
	        return 0;
	    } catch (Exception e) {
	        e.printStackTrace();  // Print the stack trace for debugging
	        return 0;
	    }
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
		System.out.println(countNameLopHoc("12A"));
	}
}
