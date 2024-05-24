<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.demo.entities.*" %>
<%@ page import="com.demo.models.*" %>
<%@ page import="java.util.*" %>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% GiaoVienModel giaoVienModel = new GiaoVienModel();
String idNe =(String) request.getAttribute("idNe");
GiaoVien giaoVien = giaoVienModel.findGiaoVienById(Integer.parseInt(idNe));%>
<!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Sửa Giáo Viên</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/editGiaoVien" method="post" enctype="multipart/form-data">
                <input value="<%= giaoVien.getId()%>" type="hidden" name="idNe">
                 <div class="form-group">
                    <label for="input-1">Tên Giáo Viên</label>
                    <input value="<%=giaoVien.getNameGiaoVien()%>" type="text" class="form-control" id="input-1" name="giaoVienName" readonly="readonly">
                  </div>         
                 <div class="form-group">
                    <label for="input-1">Ngày Sinh</label>
                    <input value="<%=giaoVien.getNgaySinh() %>" type="date" class="form-control" id="input-1" placeholder="Nhập ngày sinh" name="ngaySinh">
                  </div>         
                  <div class="form-group">
                    <label for="input-3">Địa Chỉ</label>
                    <input value="<%=giaoVien.getDiaChi() %>" type="text" class="form-control" id="input-3" placeholder="Nhập địa chỉ" name="diaChi">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Số Điện Thoại</label>
                    <input value="<%=giaoVien.getSoDienThoai() %>" type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumber">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Email</label>
                    <input value="<%=giaoVien.getEmail() %>" type="email" class="form-control" id="the-date" placeholder="Nhập email" name="email">
                  </div>
                    <div class="form-group">
                <label for="input-2">Hình ảnh</label>
                <br>
                        <input value="<%=giaoVien.getAnhDaiDien()%>" type="file" name="giaoVienImage" />
                  </div>
                  <div class="form-group">
                    <button type="submit" name="action" value="changeGiaoVien" class="btn btn-success">Sửa Giáo Viên</button>
                    <button type="submit"  name="action" value="notChangeGiaoVien"  class="btn btn-danger"> Hủy Cập Nhập</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
</body>
</html>