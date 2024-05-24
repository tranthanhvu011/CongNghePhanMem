<%@page import="java.util.List"%>
<%@page import="com.demo.entities.LopHoc"%>
<%@page import="com.demo.models.LopHocModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% LopHoc lopHoc = new LopHoc(); 
LopHocModel lopHocModel = new LopHocModel();
List<LopHoc> lopHocs = lopHocModel.findAll();
   
%>
<html>      
<head>
    <title>Change Status</title>
</head>
<body>
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
<button class="add-catalog" onclick="navigateToCatalog()">Quay lại</button>
<script>
function navigateToCatalog() {
    window.location.href = "<%= request.getContextPath() %>/admin/chuyenmuc";
}
</script>
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm Giáo Viên</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/addGiaoVien" method="post" enctype="multipart/form-data">
                 <div class="form-group">
                    <label for="input-1">Tên Giáo Viên</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên giáo viên" name="nameGiaoVien">
                  </div>         
                  <div class="form-group">
                    <label for="input-1">Ngày Sinh</label>
                    <input type="date" class="form-control" id="input-1" placeholder="Nhập ngày sinh" name="ngaySinh">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Giới Tính</label>
                    <select class="form-control" name="gioiTinh">
                    <option value="Nam">
                    Nam
                    </option>
                     <option value="Nữ">
                    Nữ
                    </option>
                    </select>
                  </div>
                <div class="form-group">
                    <label for="input-3">Địa Chỉ</label>
                    <input type="text" class="form-control" id="input-3" placeholder="Nhập địa chỉ" name="diaChi">
                  </div>
                     <div class="form-group">
                    <label for="input-3">Email</label>
                    <input type="email" class="form-control" id="input-3" placeholder="Nhập Email" name="email">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Số Điện Thoại</label>
                    <input type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumber">
                  </div>
                    <div class="form-group">
                <label for="input-2">Hình ảnh</label>
                <br>
                        <input type="file" name="teacherImage" />
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-light px-5"><i class="icon-lock"></i> Thêm Giáo Viên </button>
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