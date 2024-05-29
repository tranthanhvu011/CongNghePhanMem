package com.demo.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import DB.ConnectDB;
@WebServlet("/admin/getMonHoc")
public class getMonHoc extends HttpServlet {
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   String id = req.getParameter("id");
   req.setAttribute("idRequest", id);
   System.out.println("id ne" + id);
	req.setAttribute("p", "../admin/showTKB.jsp");
	req.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(req, resp);	
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
