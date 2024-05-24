package com.demo.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.demo.models.ThoiKhoaBieuModel;
@WebServlet("/admin/addTKB")
public class AddThoiKhoaBieu extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		req.setAttribute("idLopHocChange", id);
		req.setAttribute("p", "../admin/addThoiKhoaBieu.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);	
		}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

        String idLopHocNe = req.getParameter("idLopHocNe");
        System.out.println(idLopHocNe);
        JSONArray monHocArray = new JSONArray();
        JSONArray monHocArray1 = new JSONArray();
        JSONArray monHocArray2 = new JSONArray();
        JSONArray monHocArray3 = new JSONArray();
        JSONArray monHocArray4 = new JSONArray();
        ThoiKhoaBieuModel bieu = new ThoiKhoaBieuModel();
        String buoiHoc = req.getParameter("buoihoc");
        System.out.println(buoiHoc);
        for (int i = 1; i <= 5; i++) {  // Giả sử có 5 môn học
            String tenMon = req.getParameter("tenmonhoc" + i);
            String giaoVien = req.getParameter("tengiaovien" + i);
            String tiet = req.getParameter("tiet" + i);
            String thoiGian = req.getParameter("thoigian" + i);

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
        if (bieu.countLopHoc(Integer.parseInt(idLopHocNe), Integer.parseInt(buoiHoc)) <= 0) {
        	bieu.insertMonHoc(monHocArray, monHocArray1, monHocArray2, monHocArray3, monHocArray4, Integer.parseInt(idLopHocNe), Integer.parseInt(buoiHoc));
			resp.sendRedirect("chuyenmuc");
		}else {
			resp.sendRedirect("quanliuser");

		}
	}}
		
	

