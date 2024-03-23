package com.demo.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.LopHoc;
import com.demo.entities.SinhVien;
import com.demo.models.LopHocModel;
import com.demo.models.SinhVienModel;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/admin/chuyenmuc")
public class ChuyenmucServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChuyenmucServlet() {
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
		String action = request.getParameter("action");
		if (action == null) {
			LopHocModel lopHocModel = new LopHocModel();
			List<LopHoc> lopHocs = lopHocModel.findAll();
			request.setAttribute("lopHoc", lopHocs);
			request.setAttribute("p", "../admin/showcatalog.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	
		}
	}

	protected void doGet_SelectById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int idClass = Integer.parseInt(id);
		SinhVienModel sinhVienModel = new SinhVienModel();
		List<SinhVien> sv = sinhVienModel.listSinhVienByIDLopHoc(idClass);
		if (sv != null) {
			request.setAttribute("svListById", sv);
		}else {
			response.sendRedirect("chuyenmuc");
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
