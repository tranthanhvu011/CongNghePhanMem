package com.demo.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entities.GiaoVien;
import com.demo.entities.SinhVien;
import com.demo.models.GiaoVienModel;
import com.demo.models.SinhVienModel;
import com.google.gson.Gson;
@WebServlet("/autocomplete")
public class Autocomplete extends HttpServlet{
	@Override
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("findSinhVienByName".equals(action)) {
            doGet_ByName(req, resp);
        } else if ("findSinhVienBySTT".equals(action)) {
            doGet_BySTT(req, resp);
        }else if ("findGiaoVienByName".equals(action)) {
			doGet_ByNameGiaoVien(req, resp);
		}
    }

	protected void doGet_ByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("application/json; charset=utf-8");
	    String name = req.getParameter("name");
	    SinhVienModel sVienModel = new SinhVienModel();
	    List<SinhVien> sinhVienList = sVienModel.findSinhVienByName(name);
	    Gson gson = new Gson();
	    String jsonResponse = gson.toJson(sinhVienList);

	    PrintWriter out = resp.getWriter();
	    out.print(jsonResponse);
	    out.flush();
	}
	protected void doGet_BySTT(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("application/json; charset=utf-8");
	    int stt = Integer.parseInt(req.getParameter("stt")); // Make sure to handle NumberFormatException
	    SinhVienModel sVienModel = new SinhVienModel();
	    List<SinhVien> sinhVienList = sVienModel.findSinhVienBySTT(stt);
	    Gson gson = new Gson();
	    String jsonResponse = gson.toJson(sinhVienList);
	    PrintWriter out = resp.getWriter();
	    out.print(jsonResponse);
	    out.flush();
	}
	protected void doGet_ByNameGiaoVien(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("application/json; charset=utf-8");
	    String name = req.getParameter("name");
	    GiaoVienModel giaoVienModel = new GiaoVienModel();
	    List<GiaoVien> listGiaoViens = giaoVienModel.findGiaoVienByName(name);
	    Gson gson = new Gson();
	    String jsonResponse = gson.toJson(listGiaoViens);
	    PrintWriter out = resp.getWriter();
	    out.print(jsonResponse);
	    out.flush();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
