package com.demo.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.LopHoc;
import com.demo.models.LopHocModel;
@WebServlet("/admin/addcatalog")
public class AddCatalog extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		req.setAttribute("p", "../admin/addcatalog.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
	}
	@Override
	// 7.  Hệ thống xử lý thông tin và gửi cho cơ sở dữ liệu để thêm vào danh sách lớp học.
	// 8. Cơ sở dữ liệu xác nhận và trả lại thông tin đã xử lý.
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		LopHocModel lopHocModel = new LopHocModel();
		String nameTearcher = req.getParameter("catalogname");
		String nameLopHoc = req.getParameter("className");
		if (nameTearcher.isEmpty()) {
			req.setAttribute("message", "Vui Lòng Chọn Giáo Viên");
			req.setAttribute("p", "../admin/addcatalog.jsp");
			req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
		}else if (nameLopHoc.isEmpty()) {
			req.setAttribute("message", "Vui Lòng Đặt Tên Cho Lớp Học");
			req.setAttribute("p", "../admin/addcatalog.jsp");
			req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
		}else if (lopHocModel.addLopHoc(new LopHoc(nameTearcher, nameLopHoc)) == true ) {
    		req.setAttribute("message", "Thêm lớp học thành công");
			req.setAttribute("p", "../admin/addcatalog.jsp");
			req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
		}else {
    		req.setAttribute("message", "Thêm lớp học thất bại");
			req.setAttribute("p", "../admin/addcatalog.jsp");
			req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);		
			}
	}	
}
