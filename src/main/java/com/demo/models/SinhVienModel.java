package com.demo.models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.SinhVien;

import DB.ConnectDB;
public class SinhVienModel {
	public static List<SinhVien> findAll() {
		List<SinhVien> sinhViens = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from sinhvien");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				SinhVien sinhVien = new SinhVien();
				sinhVien.setId(resultSet.getInt("id"));
				sinhVien.setMssv(resultSet.getString("MSSV"));
				sinhVien.setHoVaTen(resultSet.getString("hoVaTen"));
				sinhVien.setSoDienThoai(resultSet.getString("soDienThoai"));
				sinhVien.setBirDate(resultSet.getDate("birthday"));
				sinhVien.setGioiTinh(resultSet.getString("gioiTinh"));
				sinhVien.setDiaChi(resultSet.getString("diaChi"));
				sinhVien.setEmail(resultSet.getString("email"));
				sinhVien.setIdLopHoc(resultSet.getInt("idLopHoc"));
				
				sinhVien.setHinhAnh(resultSet.getString("hinhAnh"));
				sinhViens.add(sinhVien);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sinhViens = null;
		} finally {
			ConnectDB.disconnect();
		}
		return sinhViens;
	}
	public static boolean addSinhVien(SinhVien sv) {
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
	            "INSERT INTO sinhvien(mssv, hoVaTen, soDienThoai, birthday, gioiTinh, diaChi, email, idLopHoc, hinhAnh) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)");
	        preparedStatement.setString(1, sv.getMssv());
	        preparedStatement.setString(2, sv.getHoVaTen());
	        preparedStatement.setString(3, sv.getSoDienThoai());
	        java.sql.Date sqlDate = new java.sql.Date(sv.getBirDate().getTime());
	        preparedStatement.setDate(4, sqlDate);
	        preparedStatement.setString(5, sv.getGioiTinh());
	        preparedStatement.setString(6, sv.getDiaChi());
	        preparedStatement.setString(7, sv.getEmail());
	        preparedStatement.setInt(8, sv.getIdLopHoc());
	        preparedStatement.setString(9, sv.getHinhAnh());
	        int rowsAffected = preparedStatement.executeUpdate();

	        return rowsAffected > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	    }
	}
	public static List<SinhVien> listSinhVienByIDLopHoc(int idSv){
		List<SinhVien> sinhViens = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select sinhvien.MSSV, sinhvien.id ,hoVaTen,soDienThoai,birthday,gioiTinh, diaChi,email,idLopHoc,tenLopHoc, hinhAnh from "
					+ "sinhvien inner join lophoc on sinhvien.idLopHoc = lophoc.id where idLopHoc = ? ");
	        preparedStatement.setInt(1, idSv);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				SinhVien sinhVien = new SinhVien();
				sinhVien.setId(resultSet.getInt("id"));
				sinhVien.setMssv(resultSet.getString("MSSV"));
				sinhVien.setHoVaTen(resultSet.getString("hoVaTen"));
				sinhVien.setSoDienThoai(resultSet.getString("soDienThoai"));
				sinhVien.setBirDate(resultSet.getDate("birthday"));
				sinhVien.setGioiTinh(resultSet.getString("gioiTinh"));
				sinhVien.setDiaChi(resultSet.getString("diaChi"));
				sinhVien.setEmail(resultSet.getString("email"));
				sinhVien.setIdLopHoc(resultSet.getInt("idLopHoc"));
				sinhVien.setNameLopHoc(resultSet.getString("tenLopHoc"));
				sinhVien.setHinhAnh(resultSet.getString("hinhAnh"));
				sinhViens.add(sinhVien);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sinhViens = null;
		} finally {
			ConnectDB.disconnect();
		}
		return sinhViens;
	}
	public static void main(String[] args) {
//	        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//	        java.util.Date birthDate = null;
//	        try {
//	            birthDate = sdf.parse("10-04-2003");
//	        } catch (ParseException e) {
//	            e.printStackTrace();
//	        }
//
//	        if (birthDate != null) {
//	            java.sql.Date sqlDate = new java.sql.Date(birthDate.getTime());
//	            boolean addsv = addSinhVien(new SinhVien("ThanhVu", "123", sqlDate, "Nam", "TPHCM", "email@gmail.com", 0));
//	            if (addsv) {
//	                System.out.println("Sinh viên đã được thêm thành công.");
//	            } else {
//	                System.out.println("Không thể thêm sinh viên.");
//	            }
//	        }
//
//	        List<SinhVien> sinhViens = findAll();
//	        for (SinhVien sv : sinhViens) {
//	            System.out.println(sv);
//	        }
	    	List<SinhVien> sv = listSinhVienByIDLopHoc(1);
	    	System.out.println(sv);
	    	System.out.println(new SinhVienModel().findAll());
	    }
	
}
