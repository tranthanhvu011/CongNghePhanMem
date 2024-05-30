package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.GiaoVien;
import com.demo.entities.SinhVien;

import DB.ConnectDB;
import oracle.jdbc.proxy.annotation.Pre;

public class GiaoVienModel {
	public static boolean addGiaoVien(GiaoVien giaoVien) {
		String query = "Insert into giaovien (nameGiaoVien,ngaySinh, gioiTinh, diaChi,soDienThoai, email, anhDaiDien) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setString(1, giaoVien.getNameGiaoVien());
			preparedStatement.setString(2, giaoVien.getNgaySinh());
			preparedStatement.setString(3,  giaoVien.getGioiTinh());
			preparedStatement.setString(4,  giaoVien.getDiaChi());
			preparedStatement.setString(5, giaoVien.getSoDienThoai());
			preparedStatement.setString(6,  giaoVien.getEmail());
			preparedStatement.setString(7,  giaoVien.getAnhDaiDien());
			int row = preparedStatement.executeUpdate();
			return row > 0;
		} catch (Exception e) {
			return false;
		}
	}
	
	public static int totalGiaoVien() {
	    String query = "SELECT COUNT(*) FROM giaovien";
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

	public static List<GiaoVien> findAllListGiaoVien() {
		String query = "select * from giaovien";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			List<GiaoVien> list = new ArrayList<GiaoVien>();
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				GiaoVien giaoVien = new GiaoVien();
				giaoVien.setId(resultSet.getInt("id"));
				giaoVien.setNameGiaoVien(resultSet.getString("nameGiaoVien"));
				giaoVien.setNgaySinh(resultSet.getString("ngaySinh"));
				giaoVien.setGioiTinh(resultSet.getString("gioiTinh"));
				giaoVien.setDiaChi(resultSet.getString("diaChi"));
				giaoVien.setEmail(resultSet.getString("email"));
				giaoVien.setSoDienThoai(resultSet.getString("soDienThoai"));
				giaoVien.setAnhDaiDien(resultSet.getString("anhDaiDien"));
				list.add(giaoVien);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static GiaoVien findGiaoVienById(int idNe) {
		String query = "select * from giaovien where id = ?";
		try {
			GiaoVien giaoVien = new GiaoVien();

			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setInt(1, idNe);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				giaoVien.setId(resultSet.getInt("id"));
				giaoVien.setNameGiaoVien(resultSet.getString("nameGiaoVien"));
				giaoVien.setNgaySinh(resultSet.getString("ngaySinh"));
				giaoVien.setGioiTinh(resultSet.getString("gioiTinh"));
				giaoVien.setDiaChi(resultSet.getString("diaChi"));
				giaoVien.setSoDienThoai(resultSet.getString("soDienThoai"));
				giaoVien.setEmail(resultSet.getString("email"));
				giaoVien.setAnhDaiDien(resultSet.getString("anhDaiDien"));			
				}
			return giaoVien;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	public List<GiaoVien> findGiaoVienByName(String name) {
	    List<GiaoVien> giaoViens = new ArrayList<GiaoVien>();
	    String query = "SELECT * from giaovien WHERE nameGiaoVien LIKE ? ORDER BY id DESC";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setString(1, "%" + name + "%");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            GiaoVien giaoVien = new GiaoVien();
	            giaoVien.setId(resultSet.getInt("id"));
	            giaoVien.setNameGiaoVien(resultSet.getString("nameGiaoVien"));
	            giaoVien.setNgaySinh(resultSet.getString("ngaySinh"));
	            giaoVien.setGioiTinh(resultSet.getString("gioiTinh"));
	            giaoVien.setDiaChi(resultSet.getString("diaChi"));
	            giaoVien.setSoDienThoai(resultSet.getString("soDienThoai"));
	            giaoVien.setEmail(resultSet.getString("email"));
	            giaoVien.setAnhDaiDien(resultSet.getString("anhDaiDien"));
	            giaoViens.add(giaoVien);
	        }
	        return giaoViens;
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	        return null;
	    }
	   
	}
	public static boolean changeGiaoVien(int idNe,String ngaySinhNe,String diaChiNe,String soDienThoaiNe,String emailNe,String anhDaiDienNe) {
		String query = "Update giaovien SET ngaySinh = ?, diaChi = ?, soDienThoai = ?, email = ?, anhDaidien = ? where id = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setString(1, ngaySinhNe);
			preparedStatement.setString(2, diaChiNe);
			preparedStatement.setString(3, soDienThoaiNe);
			preparedStatement.setString(4, emailNe);
			preparedStatement.setString(5, anhDaiDienNe);
			preparedStatement.setInt(6, idNe);
			int row = preparedStatement.executeUpdate();
			return row > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}
	public static boolean deleteGiaoVien(int idGiaoVien) {
		String query = "delete from giaovien where id = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setInt(1, idGiaoVien);
			int row = preparedStatement.executeUpdate();
			return row > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	public static void main(String[] args) {
//		System.out.println(addGiaoVien(new GiaoVien("Vu", "123", "123", "123", "123", "123", "123")));
//		System.out.println(findAllListGiaoVien());
//		System.out.println(findGiaoVienById(3));
		System.out.println(totalGiaoVien());
	}

}
