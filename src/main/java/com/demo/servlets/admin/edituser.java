package com.demo.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admin/edituser")
public class edituser extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setAttribute("p", "../admin/edituser.jsp");
	req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);
}
}
