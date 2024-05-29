package com.demo.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.checkerframework.checker.units.qual.g;

import com.demo.models.*;
import com.demo.entities.*;

import com.demo.models.UserModel;
import com.google.gson.Gson;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/admin/quanliuser")
public class QuanliuserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuanliuserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// lấy action từ request
		String action = request.getParameter("action");
		// kiểm tra nếu null thì sẽ đưa về trang mình set ở doGet_Index
		if (action == null) {
			doGet_Index(request, response);
			// ngược lại thì ở doGet_Remove
		} else if (action.equalsIgnoreCase("delete")) {
			doGet_Remove(request, response);
		}
	}
	// Hàm doget đưa về trang /admin/user.jsp
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("p", "../admin/user.jsp");
		SinhVienModel sinhVienModel = new SinhVienModel();
		List<SinhVien> sinhViens = sinhVienModel.findAll();
		request.setAttribute("sinhVien", sinhViens);
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	//4.  Hệ thống xử lý yêu cầu xóa trong cơ sở dữ liệu.
	// 5.  Cơ sở dữ liệu xác nhận và thực hiện yêu cầu xóa.
	protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		SinhVienModel sinhVienModel = new SinhVienModel();
		// xóa cột với id lấy từ request
		if (sinhVienModel.removeHocSinh(Integer.parseInt(id))) {
			response.sendRedirect("quanliuser");
		}else {
			request.setAttribute("p", "../admin/user.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);

		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}