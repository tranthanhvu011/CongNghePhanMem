package com.demo.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.models.GiaoVienModel;

@WebServlet("/admin/quanligiaovien")
public class GiaoVien extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		req.setAttribute("p", "../admin/giaovien.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("delete")) {
			doPost_delete(req, resp);
		}
	}
	protected void doPost_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		GiaoVienModel giaoVienModel = new GiaoVienModel();
		giaoVienModel.deleteGiaoVien(Integer.parseInt(id));
	}
	
}
