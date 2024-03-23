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
		req.setAttribute("p", "../admin/addcatalog.jsp");
		req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LopHocModel lopHocModel = new LopHocModel();
		String nameTearcher = req.getParameter("catalogname");
		String nameLopHoc = req.getParameter("className");
		if (lopHocModel.addLopHoc(new LopHoc(nameTearcher, nameLopHoc)) == true ) {
			resp.sendRedirect("chuyenmuc");
		}else {
			resp.sendRedirect("chuyenmuc");
		}
	}	
}
