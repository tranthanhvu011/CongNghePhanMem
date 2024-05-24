package com.demo.servlets.admin;

import java.io.File;
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

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.SinhVien;
import com.demo.entities.Users;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.SinhVienModel;
import com.demo.models.UserModel;

/**
 * Servlet implementation class LoginAdminServletz	
 */
@WebServlet("/admin/adduser")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10
)
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUserServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if (action == null) {
			doGet_Index(request, response);
		}
	}

	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("p", "../admin/adduser.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("addUser")) {
			doPost_AddUser(request, response);
		}
	}

	protected void doPost_AddUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date birthDate = null;
		SinhVienModel sinhVienModel= new SinhVienModel();
		SinhVien sinhVien = new SinhVien();
		String mssv = request.getParameter("mssv");
		String hoVaTen = request.getParameter("hoVaTen");
		String phoneNumber = request.getParameter("phoneNumber");
		String phoneNumberParents = request.getParameter("phoneNumberParents");
		String dateOfBirth = request.getParameter("dateOfBirth");
		String gioiTinh = request.getParameter("gioiTinh");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String idClass = request.getParameter("className");
	    Part filePart = request.getPart("studentImage"); 
		String newimage = UploadFileHelper.uploadFile("res\\thumball", request, filePart);
		if (newimage != null) {
			System.out.println("Up load thanh cong");
		}
		  try {	
			       int classId = Integer.parseInt(idClass);
	            birthDate = sdf.parse(dateOfBirth);
	        	if (sinhVienModel.addSinhVien(new SinhVien(mssv,hoVaTen, phoneNumber,phoneNumberParents, birthDate, gioiTinh, address, email, classId, newimage)) == true) {
	    			request.getSession().setAttribute("message", "Tao thanh cong");
	    			response.sendRedirect("quanliuser");
	    		} else {
	    			request.getSession().setAttribute("message", "Tao that bai");
	    			response.sendRedirect("quanliuser");
	    		}
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	
	}

}

