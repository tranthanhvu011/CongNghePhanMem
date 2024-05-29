package com.demo.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.helpers.UploadFileHelper;
import com.demo.models.GiaoVienModel;

@WebServlet("/admin/editGiaoVien")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 10)
public class EditGiaoVien extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String id = req.getParameter("id");
		req.setAttribute("idNe", id);
		req.setAttribute("p", "../admin/editGiaoVien.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("changeGiaoVien")) {
			doPost_change(req, resp);
		}else if (action.equalsIgnoreCase("notChangeGiaoVien")) {
			doPost_notChange(req, resp);
		}
	}
	protected void doPost_change(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String idNe = req.getParameter("idNe");
		String ngaySinh = req.getParameter("ngaySinh");
		String diaChi = req.getParameter("diaChi");
		String phoneNumber = req.getParameter("phoneNumber");
		String email = req.getParameter("email");
		String giaoVienImage = req.getParameter("giaoVienImage");
		GiaoVienModel giaoVienModel = new GiaoVienModel();
		Part filePart = req.getPart("giaoVienImage");
		String newimage = UploadFileHelper.uploadFile("res\\thumball", req, filePart);
		if (newimage != null) {
			System.out.println("Up load thanh cong");
		}
		if (giaoVienModel.changeGiaoVien(Integer.parseInt(idNe), ngaySinh, diaChi, phoneNumber, email, newimage)) {
			resp.sendRedirect("quanligiaovien");
		}
	}
	protected void doPost_notChange(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("quanligiaovien");
	}
	

}
