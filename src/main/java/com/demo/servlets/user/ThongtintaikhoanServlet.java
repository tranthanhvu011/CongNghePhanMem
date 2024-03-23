package com.demo.servlets.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.demo.entities.Users;
import com.demo.helpers.UploadFileHelper;
import com.demo.models.UserModel;

/**
 * Servlet implementation class CachnuoiServlet
 */
@WebServlet("/thongtintaikhoan")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5 ,
		maxRequestSize = 1024 * 1024 * 10,
		fileSizeThreshold = 1024 * 1024 * 10
)
public class ThongtintaikhoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongtintaikhoanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("p", "../user/thongtintaikhoan.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("update")) {
			doPost_Update(request, response);
		}
	}
	protected void doPost_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserModel userModel = new UserModel();
		Part image = request.getPart("image");
		String newimage = UploadFileHelper.uploadFile("assets/user/image", request, image);
		String address = request.getParameter("address");
		String fullName = request.getParameter("fullName");
		String phoneNumber = request.getParameter("phoneNumber");
		Users user = (Users) request.getSession().getAttribute("user");
		user.setImage(newimage);
		user.setAddress(address);
		user.setFullName(new String(fullName.getBytes("ISO-8859-1"), "UTF-8"));
		user.setPhoneNumber(phoneNumber);
		if(userModel.update(user)) {
			request.getSession().setAttribute("user", user);
			response.sendRedirect("thongtintaikhoan");
		}
	}

}
