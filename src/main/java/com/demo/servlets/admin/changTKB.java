package com.demo.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.demo.entities.ThoiKhoaBieu;
import com.demo.models.ThoiKhoaBieuModel;

import DB.ConnectDB;
@WebServlet("/admin/changeTKB")
public class changTKB extends HttpServlet {
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   String id = req.getParameter("id");
   req.setAttribute("idRequest", id);
   String action = req.getParameter("action");
   System.out.println(action);
   System.out.println("id ne" + id);
	if (action.equalsIgnoreCase("changeBuoiSang")) {
		doGet_changeSang(req, resp);
	}else if (action.equalsIgnoreCase("changeBuoiChieu")) {
		doGet_changeChieu(req, resp);
	}
}
protected void doGet_changeSang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");

	req.setAttribute("p", "../admin/changeTKB.jsp");
	req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);	
}
protected void doGet_changeChieu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");

	req.setAttribute("p", "../admin/changeTKBChieu.jsp");
	req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);	
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("changeBuoiSang")) {
			doPost_changeBuoiSang(req, resp);
		}else if (action.equalsIgnoreCase("xoaBuoiSang")) {
			doPost_delete_BuoiSang(req, resp);
		}else if (action.equalsIgnoreCase("xoaBuoiChieu")) {
			doPost_delete_BuoiChieu(req, resp);
		}else if (action.equalsIgnoreCase("changeBuoiChieu")) {
			doPost_changeBuoiChieu(req, resp);
		}
}
protected void doPost_changeBuoiSang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");
	String buoiHoc = req.getParameter("buoihoc");
	
    JSONArray monHocArray = new JSONArray();
    JSONArray monHocArray1 = new JSONArray();
    JSONArray monHocArray2 = new JSONArray();
    JSONArray monHocArray3 = new JSONArray();
    JSONArray monHocArray4 = new JSONArray();
    String idNe = req.getParameter("idLopHocNe");
    int id = Integer.parseInt(idNe);
    System.out.println(id +  " ne thang ngu");
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhoc" + i);
        String giaoVien = req.getParameter("tengiaovien" + i);
        String tiet = req.getParameter("tiet" + i);
        String thoiGian = req.getParameter("thoigian" + i);
        System.out.println(tenMon + giaoVien + tiet + thoiGian);
        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhocthu3" + i);
        String giaoVien = req.getParameter("tengiaovienthu3" + i);
        String tiet = req.getParameter("tietthu3" + i);
        String thoiGian = req.getParameter("thoigianthu3" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray1.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
		req.setCharacterEncoding("UTF-8");
        String tenMon = req.getParameter("tenmonhocthu4" + i);
        String giaoVien = req.getParameter("tengiaovienthu4" + i);
        String tiet = req.getParameter("tietthu4" + i);
        String thoiGian = req.getParameter("thoigianthu4" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray2.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhocthu5" + i);
        String giaoVien = req.getParameter("tengiaovienthu5" + i);
        String tiet = req.getParameter("tietthu5" + i);
        String thoiGian = req.getParameter("thoigianthu5" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray3.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhocthu6" + i);
        String giaoVien = req.getParameter("tengiaovienthu6" + i);
        String tiet = req.getParameter("tietthu6" + i);
        String thoiGian = req.getParameter("thoigianthu6" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray4.put(monHocDetails);
    }
    ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
    if (thoiKhoaBieuModel.updateThoiKhoaBieu(new ThoiKhoaBieu(monHocArray, monHocArray1, monHocArray2, monHocArray3, monHocArray4), id, Integer.parseInt(buoiHoc))) {
    	resp.sendRedirect("chuyenmuc");
	}else {
    	resp.sendRedirect("chuyenmuc");

	}
}
protected void doPost_changeBuoiChieu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("UTF-8");
	String buoiHoc = req.getParameter("buoihoc");
	
    JSONArray monHocArray = new JSONArray();
    JSONArray monHocArray1 = new JSONArray();
    JSONArray monHocArray2 = new JSONArray();
    JSONArray monHocArray3 = new JSONArray();
    JSONArray monHocArray4 = new JSONArray();
    String idNe = req.getParameter("idLopHocNe");
    int id = Integer.parseInt(idNe);
    System.out.println(id +  " ne thang ngu");
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhoc" + i);
        String giaoVien = req.getParameter("tengiaovien" + i);
        String tiet = req.getParameter("tiet" + i);
        String thoiGian = req.getParameter("thoigian" + i);
        System.out.println(tenMon + giaoVien + tiet + thoiGian);
        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhocthu3" + i);
        String giaoVien = req.getParameter("tengiaovienthu3" + i);
        String tiet = req.getParameter("tietthu3" + i);
        String thoiGian = req.getParameter("thoigianthu3" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray1.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
		req.setCharacterEncoding("UTF-8");
        String tenMon = req.getParameter("tenmonhocthu4" + i);
        String giaoVien = req.getParameter("tengiaovienthu4" + i);
        String tiet = req.getParameter("tietthu4" + i);
        String thoiGian = req.getParameter("thoigianthu4" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray2.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhocthu5" + i);
        String giaoVien = req.getParameter("tengiaovienthu5" + i);
        String tiet = req.getParameter("tietthu5" + i);
        String thoiGian = req.getParameter("thoigianthu5" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray3.put(monHocDetails);
    }
    for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
        String tenMon = req.getParameter("tenmonhocthu6" + i);
        String giaoVien = req.getParameter("tengiaovienthu6" + i);
        String tiet = req.getParameter("tietthu6" + i);
        String thoiGian = req.getParameter("thoigianthu6" + i);

        JSONObject monHocDetails = new JSONObject();
        monHocDetails.put("TenMon" + i, tenMon);
        monHocDetails.put("GiaoVien" + i, giaoVien);
        monHocDetails.put("Tiet", tiet);
        monHocDetails.put("ThoiGian" + i, thoiGian);
        monHocArray4.put(monHocDetails);
    }
    ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
    if (thoiKhoaBieuModel.updateThoiKhoaBieu(new ThoiKhoaBieu(monHocArray, monHocArray1, monHocArray2, monHocArray3, monHocArray4), id, Integer.parseInt(buoiHoc))) {
    	resp.sendRedirect("chuyenmuc");
	}else {
    	resp.sendRedirect("chuyenmuc");

	}

}
protected void doPost_delete_BuoiSang(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
	String idClass = req.getParameter("id");
	System.out.println(idClass + "Lop hoc ne thang ngu oi");
	if (thoiKhoaBieuModel.deleteThoiKhoaBieuSang(Integer.parseInt(idClass), 0)) {
		resp.sendRedirect("chuyenmuc");
		}else {
	    	resp.sendRedirect("chuyenmuc");
	}
}
protected void doPost_delete_BuoiChieu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	ThoiKhoaBieuModel thoiKhoaBieuModel = new ThoiKhoaBieuModel();
	String idClass = req.getParameter("id");
	System.out.println(idClass + "Lop hoc ne thang ngu oi");
	if (thoiKhoaBieuModel.deleteThoiKhoaBieuSang(Integer.parseInt(idClass), 1)) {
		resp.sendRedirect("chuyenmuc");
		}else {
	    	resp.sendRedirect("chuyenmuc");
	}

}

}
