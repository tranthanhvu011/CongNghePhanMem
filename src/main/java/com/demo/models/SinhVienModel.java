package com.demo.models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.checkerframework.checker.units.qual.s;

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
				sinhVien.setSoDienThoaiPhuHuynh(resultSet.getString("soDienThoaiPhuHuynh"));
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
	public static int totalSinhVien() {
	    String query = "SELECT COUNT(*) FROM sinhvien";
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
	public SinhVien findSinhVienByID(int idSV) {
		String query = "Select * from sinhvien where id = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setInt(1, idSV);
			ResultSet resultSet = preparedStatement.executeQuery();
			 SinhVien sinhVien = new SinhVien();
			if (resultSet.next()) {
				    sinhVien.setId(resultSet.getInt("id"));
		            sinhVien.setMssv(resultSet.getString("MSSV"));
		            sinhVien.setHoVaTen(resultSet.getString("hoVaTen"));
		            sinhVien.setSoDienThoai(resultSet.getString("soDienThoai"));
		            sinhVien.setSoDienThoaiPhuHuynh(resultSet.getString("soDienThoaiPhuHuynh"));
		            sinhVien.setBirthday(resultSet.getString("birthday"));
		            sinhVien.setGioiTinh(resultSet.getString("gioiTinh"));
		            sinhVien.setDiaChi(resultSet.getString("diaChi"));
		            sinhVien.setEmail(resultSet.getString("email"));
		            sinhVien.setIdLopHoc(resultSet.getInt("idLopHoc"));
		            sinhVien.setHinhAnh(resultSet.getString("hinhAnh"));
			}
            return sinhVien;
		} catch (Exception e) {
			return null;
		}
	}
	public List<SinhVien> findSinhVienByName(String name) {
	    List<SinhVien> sinhVienList = new ArrayList<>();
	    String query = "SELECT sinhvien.id, MSSV, hoVaTen, soDienThoai, soDienThoaiPhuHuynh, birthday, gioiTinh, diaChi, email, idLopHoc, hinhAnh, lophoc.tenLopHoc FROM sinhvien inner join lophoc on sinhvien.idLopHoc = lophoc.id WHERE hoVaTen LIKE ? ORDER BY id DESC";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setString(1, "%" + name + "%");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            SinhVien sinhVien = new SinhVien();
	            sinhVien.setId(resultSet.getInt("id"));
	            sinhVien.setMssv(resultSet.getString("MSSV"));
	            sinhVien.setHoVaTen(resultSet.getString("hoVaTen"));
	            sinhVien.setSoDienThoai(resultSet.getString("soDienThoai"));
	            sinhVien.setSoDienThoaiPhuHuynh(resultSet.getString("soDienThoaiPhuHuynh"));
	            sinhVien.setBirthday(resultSet.getString("birthday"));
	            sinhVien.setGioiTinh(resultSet.getString("gioiTinh"));
	            sinhVien.setDiaChi(resultSet.getString("diaChi"));
	            sinhVien.setEmail(resultSet.getString("email"));
	            sinhVien.setIdLopHoc(resultSet.getInt("idLopHoc"));
	            sinhVien.setHinhAnh(resultSet.getString("hinhAnh"));
	            sinhVien.setNameLopHoc(resultSet.getString("lophoc.tenLopHoc"));
	            sinhVienList.add(sinhVien);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    }
	    return sinhVienList;
	}
	public List<SinhVien> findSinhVienBySTT(int sttSv) {
	    List<SinhVien> sinhVienList = new ArrayList<>();
	    String query = "SELECT sinhvien.id, MSSV, hoVaTen, soDienThoai, soDienThoaiPhuHuynh, birthday, gioiTinh, diaChi, email, idLopHoc, hinhAnh, lophoc.tenLopHoc FROM sinhvien  inner join lophoc on sinhvien.idLopHoc = lophoc.id WHERE MSSV LIKE ? ORDER BY id DESC";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setString(1, "%" + sttSv + "%");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	        	SinhVien sinhVien = new SinhVien();
	            sinhVien.setId(resultSet.getInt("id"));
	            sinhVien.setMssv(resultSet.getString("MSSV"));
	            sinhVien.setHoVaTen(resultSet.getString("hoVaTen"));
	            sinhVien.setSoDienThoai(resultSet.getString("soDienThoai"));
	            sinhVien.setSoDienThoaiPhuHuynh(resultSet.getString("soDienThoaiPhuHuynh"));
	            sinhVien.setBirthday(resultSet.getString("birthday"));
	            sinhVien.setGioiTinh(resultSet.getString("gioiTinh"));
	            sinhVien.setDiaChi(resultSet.getString("diaChi"));
	            sinhVien.setEmail(resultSet.getString("email"));
	            sinhVien.setIdLopHoc(resultSet.getInt("idLopHoc"));
	            sinhVien.setHinhAnh(resultSet.getString("hinhAnh"));
	            sinhVien.setNameLopHoc(resultSet.getString("lophoc.tenLopHoc"));
	            sinhVienList.add(sinhVien);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    }
	    return sinhVienList;
	}
	public static boolean updateSinhVien(SinhVien sv) {
		String query = "Update sinhvien set MSSV = ?, hoVaTen = ?, soDienThoai = ?, soDienThoaiPhuHuynh = ?, birthday = ?, diaChi = ?, email = ?, idLopHoc = ?, hinhAnh = ? where id = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setString(1, sv.getMssv());
			preparedStatement.setString(2, sv.getHoVaTen());
			preparedStatement.setString(3, sv.getSoDienThoai());
			preparedStatement.setString(4, sv.getSoDienThoaiPhuHuynh());
		    java.sql.Date sqlDate = new java.sql.Date(sv.getBirDate().getTime());
	        preparedStatement.setDate(5, sqlDate);
	        preparedStatement.setString(6, sv.getDiaChi());
			preparedStatement.setString(7, sv.getEmail());
			preparedStatement.setInt(8, sv.getIdLopHoc());
			preparedStatement.setString(9, sv.getHinhAnh());
			preparedStatement.setInt(10, sv.getId());
			int count = preparedStatement.executeUpdate();
			return count > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public static boolean addSinhVien(SinhVien sv) {
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
	            "INSERT INTO sinhvien(mssv, hoVaTen, soDienThoai,soDienThoaiPhuHuynh, birthday, gioiTinh, diaChi, email, idLopHoc, hinhAnh) VALUES (?,?, ?,?, ?, ?, ?, ?, ?, ?)");
	        preparedStatement.setString(1, sv.getMssv());
	        preparedStatement.setString(2, sv.getHoVaTen());
	        preparedStatement.setString(3, sv.getSoDienThoai());
	        preparedStatement.setString(4, sv.getSoDienThoaiPhuHuynh());
	        java.sql.Date sqlDate = new java.sql.Date(sv.getBirDate().getTime());
	        preparedStatement.setDate(5, sqlDate);
	        preparedStatement.setString(6, sv.getGioiTinh());
	        preparedStatement.setString(7, sv.getDiaChi());
	        preparedStatement.setString(8, sv.getEmail());
	        preparedStatement.setInt(9, sv.getIdLopHoc());
	        preparedStatement.setString(10, sv.getHinhAnh());
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
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select sinhvien.MSSV, sinhvien.id ,hoVaTen,soDienThoai, soDienThoaiPhuHuynh, birthday,gioiTinh, diaChi,email,idLopHoc,tenLopHoc, hinhAnh from "
					+ "sinhvien inner join lophoc on sinhvien.idLopHoc = lophoc.id where idLopHoc = ? ");
	        preparedStatement.setInt(1, idSv);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				SinhVien sinhVien = new SinhVien();
				sinhVien.setId(resultSet.getInt("id"));
				sinhVien.setMssv(resultSet.getString("MSSV"));
				sinhVien.setHoVaTen(resultSet.getString("hoVaTen"));
				sinhVien.setSoDienThoai(resultSet.getString("soDienThoai"));
				sinhVien.setSoDienThoaiPhuHuynh(resultSet.getString("soDienThoaiPhuHuynh"));
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
	public static boolean removeHocSinh(int idHocSinh) {
		String query = "DELETE from sinhvien where id = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement(query);
			preparedStatement.setInt(1, idHocSinh);
			int row = preparedStatement.executeUpdate();
			return row > 0;
		} catch (Exception e) {
			return false;
		}
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
//	    	List<SinhVien> sv = listSinhVienByIDLopHoc(1);
//	    	System.out.println(sv);
//	    	System.out.println(new SinhVienModel().findAll());
//	    	System.out.println(removeHocSinh(43));
	    	SinhVienModel sinhVienModel = new SinhVienModel();
//	    	System.out.println(sinhVienModel.findSinhVienByName("Vu"));
//	    	System.out.println(sinhVienModel.findSinhVienByID(55));
//	    	System.out.println(sinhVienModel.updateSinhVien(new SinhVien("1", "Tran Vu", "0379886918", "0378591358","10/04/2003", "Di An", "lethicuba@gmail.com", 1, "412421421421.jpg", 55)));
//	    	System.out.println(sinhVienModel.findSinhVienBySTT(1));
//	    	System.out.println(sinhVienModel.findSinhVienByName("1"));
	    	}
	
}
