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

import com.demo.entities.SinhVien;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.SinhVienModel;

@WebServlet("/admin/edituser")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 10)
public class edituser extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		req.setAttribute("idEdit", id);
		System.out.println(id);
		req.setAttribute("p", "../admin/edituser.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("change")) {
			doPost_changeHocSinh(request, response);
		} else if (action.equalsIgnoreCase("notChange")) {
			doPost_notChangeHocSinh(request, response);

		}
	}

	protected void doPost_changeHocSinh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date birthDate = null;
		SinhVienModel sinhVienModel = new SinhVienModel();
		SinhVien sinhVien = new SinhVien();
		String id = request.getParameter("idNe");
		System.out.println(id);
		String mssv = request.getParameter("mssv");
		System.out.println(mssv);
		String hoVaTen = request.getParameter("hoVaTen");
		System.out.println(hoVaTen);
		String phoneNumber = request.getParameter("phoneNumber");
		System.out.println(phoneNumber);
		String phoneNumberParents = request.getParameter("phoneNumberParents");
		System.out.println(phoneNumberParents);
		String dateOfBirth = request.getParameter("dateOfBirth");
		String address = request.getParameter("address");
		System.out.println(address);
		String email = request.getParameter("email");
		System.out.println(email);
		String idClass = request.getParameter("className");
		System.out.println(idClass);
		Part filePart = request.getPart("studentImage");
		String newimage = UploadFileHelper.uploadFile("res\\thumball", request, filePart);
		if (newimage != null) {
			System.out.println("Up load thanh cong");
		}
		try {
			int classId = Integer.parseInt(idClass);
			birthDate = sdf.parse(dateOfBirth);
			System.out.println(birthDate);
			if (sinhVienModel.updateSinhVien(new SinhVien(mssv, hoVaTen, phoneNumber, phoneNumberParents, birthDate,
					address, email, classId, newimage, Integer.parseInt(id))) == true) {
				response.sendRedirect("quanliuser");
			} else {
				request.getSession().setAttribute("message", "Tao that bai");
				response.sendRedirect("quanliuser");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	protected void doPost_notChangeHocSinh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("quanliuser");
	}
}
