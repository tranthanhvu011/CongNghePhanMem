package com.demo.models;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.demo.entities.ThoiKhoaBieu;
import com.demo.entities.Users;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import DB.ConnectDB;

public class ThoiKhoaBieuModel {
	public boolean insertMonHoc(JSONArray monHocArray, JSONArray monHocArray1, JSONArray monHocArray2, JSONArray monHocArray3, JSONArray monHocArray4, int idLop, int buoiNao) {
	    String jsonStr = new JSONObject().put("MonHoc", monHocArray).toString();
	    String jsonStr1 = new JSONObject().put("MonHoc1", monHocArray1).toString();
	    String jsonStr2 = new JSONObject().put("MonHoc2", monHocArray2).toString();
	    String jsonStr3 = new JSONObject().put("MonHoc3", monHocArray3).toString();
	    String jsonStr4 = new JSONObject().put("MonHoc4", monHocArray4).toString();
	    String query = "INSERT INTO thoikhoabieu (thu2, thu3, thu4, thu5, thu6, idLopHoc, buoi) VALUES (?,?,?,?,?,?,?)";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setString(1, jsonStr); // Set the values starting from index 1
	        preparedStatement.setString(2, jsonStr1);
	        preparedStatement.setString(3, jsonStr2);
	        preparedStatement.setString(4, jsonStr3);
	        preparedStatement.setString(5, jsonStr4);
	        preparedStatement.setInt(6, idLop);
	        preparedStatement.setInt(7, buoiNao);
	        int result = preparedStatement.executeUpdate();
	        return result > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public boolean deleteThoiKhoaBieuSang(int idClass, int buoiHoc) {
		String query = "delete from thoikhoabieu where idLopHoc = ? AND buoi = ?";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
			preparedStatement.setInt(1, idClass);
			preparedStatement.setInt(2, buoiHoc);
			int result = preparedStatement.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			return false;
		}
	}
	public int countLopHoc(int idClass, int buoiHoc) {
	    String query = "SELECT COUNT(*) FROM thoikhoabieu WHERE idLopHoc = ? AND buoi = ?";
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setInt(1, idClass);
	        preparedStatement.setInt(2, buoiHoc);
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
	public static int totalThoiKhoaBieu() {
	    String query = "SELECT COUNT(*) FROM thoikhoabieu";
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
	public boolean updateThoiKhoaBieu(ThoiKhoaBieu thoiKhoaBieu, int idTKB, int buoiHoc) {
	    String jsonStr = new JSONObject().put("MonHoc", thoiKhoaBieu.getThu2()).toString();
	    String jsonStr1 = new JSONObject().put("MonHoc1", thoiKhoaBieu.getThu3()).toString();
	    String jsonStr2 = new JSONObject().put("MonHoc2", thoiKhoaBieu.getThu4()).toString();
	    String jsonStr3 = new JSONObject().put("MonHoc3", thoiKhoaBieu.getThu5()).toString();
	    String jsonStr4 = new JSONObject().put("MonHoc4", thoiKhoaBieu.getThu6()).toString();
	    
	    System.out.println("JSON String for thu2: " + jsonStr);
	    System.out.println("JSON String for thu3: " + jsonStr1);
	    System.out.println("JSON String for thu4: " + jsonStr2);
	    System.out.println("JSON String for thu5: " + jsonStr3);
	    System.out.println("JSON String for thu6: " + jsonStr4);
	    
	    String query = "UPDATE thoikhoabieu SET thu2 = ?, thu3 = ?, thu4 = ?, thu5 = ?, thu6 = ? WHERE idLopHoc = ? AND buoi = ?";
	    System.out.println("SQL Query: " + query);
	    
	    try (Connection connection = ConnectDB.connection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        
	        preparedStatement.setString(1, jsonStr);
	        preparedStatement.setString(2, jsonStr1);
	        preparedStatement.setString(3, jsonStr2);
	        preparedStatement.setString(4, jsonStr3);
	        preparedStatement.setString(5, jsonStr4);
	        preparedStatement.setInt(6, idTKB);
	        preparedStatement.setInt(7, buoiHoc);
	        System.out.println("Parameters:");
	        System.out.println("1: " + jsonStr);
	        System.out.println("2: " + jsonStr1);
	        System.out.println("3: " + jsonStr2);
	        System.out.println("4: " + jsonStr3);
	        System.out.println("5: " + jsonStr4);
	        System.out.println("6: " + idTKB);
	        
	        int result = preparedStatement.executeUpdate();
	        System.out.println("Update result: " + result);
	        
	        return result > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("SQL Exception: " + e.getMessage());
	        return false;
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Exception: " + e.getMessage());
	        return false;
	    }
	}

	public List<com.demo.entities.ThoiKhoaBieu> listThoiKhoaBieu(int idLopHoc) {
	    String query = "SELECT thu2, thu3, thu4, thu5, thu6, buoi FROM thoikhoabieu WHERE idLopHoc = ?";
	    List<com.demo.entities.ThoiKhoaBieu> thoiKhoaBieuList = new ArrayList<>();
	    try {
	        PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(query);
	        preparedStatement.setInt(1, idLopHoc);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            com.demo.entities.ThoiKhoaBieu tkb = new com.demo.entities.ThoiKhoaBieu();
	            tkb.setThu2(resultSet.getString("thu2"));
	            tkb.setThu3(resultSet.getString("thu3"));
	            tkb.setThu4(resultSet.getString("thu4"));
	            tkb.setThu5(resultSet.getString("thu5"));
	            tkb.setThu6(resultSet.getString("thu6"));
	            tkb.setBuoi(resultSet.getString("buoi"));
	            thoiKhoaBieuList.add(tkb); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return thoiKhoaBieuList;
	}

	public static void main(String[] args) {
		ThoiKhoaBieuModel thoiKhoaBieu = new ThoiKhoaBieuModel();
		System.out.println(thoiKhoaBieu.listThoiKhoaBieu(41).toString());
		System.out.println(thoiKhoaBieu.countLopHoc(41, 1));
	}

}
