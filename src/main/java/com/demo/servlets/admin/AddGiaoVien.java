package com.demo.servlets.admin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.GiaoVien;
import com.demo.entities.SinhVien;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.GiaoVienModel;
import com.demo.models.SinhVienModel;
@WebServlet("/admin/addGiaoVien")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 10)
public class AddGiaoVien extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		req.setAttribute("p", "../admin/addGiaoVien.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		GiaoVienModel giaoVienModel = new GiaoVienModel();
		String nameGiaoVien = req.getParameter("nameGiaoVien");
		System.out.println(nameGiaoVien);
		String  ngaySinh = req.getParameter("ngaySinh");
		System.out.println(ngaySinh);
		String gioiTinh = req.getParameter("gioiTinh");
		System.out.println(gioiTinh);
		String diaChi = req.getParameter("diaChi");
		System.out.println(diaChi);
		String email = req.getParameter("email");
		System.out.println(email);
		String phoneNumber = req.getParameter("phoneNumber");
		System.out.println(phoneNumber);
	    Part filePart = req.getPart("teacherImage"); 
		String newimage = UploadFileHelper.uploadFile("res\\thumball", req, filePart);
	    System.out.println(newimage);

		if (newimage != null) {
			System.out.println("Up load thanh cong");
		}
		  try {	

	        	if (giaoVienModel.addGiaoVien(new GiaoVien(nameGiaoVien, ngaySinh, gioiTinh,diaChi, phoneNumber, email, newimage))) {
	        		req.setAttribute("message", "Thêm Giáo Viên Thành Công");
	    			req.setAttribute("p", "../admin/addGiaoVien.jsp");
	    			req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);

	    		} else {
	    			req.setAttribute("message", "Thêm Giáo Viên Thất Bại");
	    			resp.sendRedirect("quanligiaovien");
	    		}
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	}
	}

