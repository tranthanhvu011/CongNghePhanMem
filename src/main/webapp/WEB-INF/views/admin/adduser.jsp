<%@page import="java.util.List"%>
<%@page import="com.demo.entities.LopHoc"%>
<%@page import="com.demo.models.LopHocModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% LopHoc lopHoc = new LopHoc(); 
LopHocModel lopHocModel = new LopHocModel();
List<LopHoc> lopHocs = lopHocModel.findAll();
   
%>
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">

       <% String message = (String) request.getAttribute("message");
%>
        <div class="row mt-3">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
              <!--  8.	Hệ thống hiển thị một thông báo hoặc cảnh báo trên giao diện người dùng để thông báo rằng học sinh đã được thêm vào lớp học thành công.
               -->
               <% if(message != null) {%>
              <h4 style="text-align: center"><%= message %></h4>
              <% } %>
                <div class="card-title">Thêm Học Sinh</div>
                <hr>
<!-- Form để gửi dữ liệu thêm học sinh, sử dụng phương thức POST và hỗ trợ tải lên file -->
<!-- 3.	Người dùng điền thông tin của học sinh cần thêm vào lớp học, bao gồm tên, email, số điện thoại, và bất kỳ thông tin khác cần thiết. -->
<form action="${pageContext.request.contextPath}/admin/adduser?action=addUser" method="post" enctype="multipart/form-data">
  <!-- Nhóm form cho nhập Số thứ tự -->
  <div class="form-group">
    <label for="input-1">Số thứ tự</label>
    <input type="text" class="form-control" id="input-1" placeholder="Nhập số thứ tự" name="mssv">
  </div>

  <!-- Nhóm form cho nhập Họ và Tên -->
  <div class="form-group">
    <label for="input-1">Họ và tên</label>
    <input type="text" class="form-control" id="input-1" placeholder="Nhập họ tên" name="hoVaTen">
  </div>

  <!-- Nhóm form cho nhập Số Điện Thoại Sinh Viên -->
  <div class="form-group">
    <label for="input-3">Số Điện Thoại</label>
    <input type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumber">
  </div>

  <!-- Nhóm form cho nhập Số Điện Thoại Phụ Huynh -->
  <div class="form-group">
    <label for="input-3">Số Điện Thoại Phụ Huynh</label>
    <input type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumberParents">
  </div>

  <!-- Nhóm form cho nhập Ngày Sinh -->
  <div class="form-group">
    <label for="the-date">Ngày Sinh</label>
    <input type="date" class="form-control" id="the-date" name="dateOfBirth">
  </div>

  <!-- Nhóm form cho chọn Giới Tính -->
  <div class="form-group">
    <label for="input-2">Giới Tính</label>
    <select class="form-control" name="gioiTinh">
      <option value="Nam">Nam</option>
      <option value="Nữ">Nữ</option>
    </select>
  </div>

  <!-- Nhóm form cho nhập Địa Chỉ -->
  <div class="form-group">
    <label for="input-4">Địa chỉ</label>
    <input type="text" class="form-control" id="input-4" placeholder="Nhập địa chỉ" name="address">
  </div>

  <!-- Nhóm form cho nhập Email -->
  <div class="form-group">
    <label for="input-2">Email</label>
    <input type="text" class="form-control" id="input-2" placeholder="Nhập địa chỉ Email" name="email">
  </div>

  <!-- Nhóm form cho chọn Lớp Học -->
  <div class="form-group">
    <label for="input-6">Lớp Học</label>
    <select class="form-control" id="input-6" name="className">
      <!-- Lặp qua danh sách lớp học để tạo options cho select -->
      <% for(LopHoc lophoc : lopHocs) { %>
        <option value="<%=lophoc.getId()%>"><%= lophoc.getTenLopHoc() %></option>
      <% } %>
    </select>
  </div>

  <!-- Nhóm form cho tải lên Hình Ảnh -->
  <div class="form-group">
    <label for="input-2">Hình ảnh</label>
    <input type="file" name="studentImage" />
  </div>

  <!-- Nút để gửi form -->
  <div class="form-group">
  <!-- 4.	Người dùng nhấn nút "Thêm học sinh" sau khi đã điền đầy đủ thông tin của học sinh. -->
    <button type="submit" class="btn btn-light px-5"><i class="icon-lock"></i> Thêm Học Sinh</button>
  </div>
</form>

              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
  <script>
      var date = new Date();
      var day = date.getDate();
      var month = date.getMonth() + 1;
      var year = date.getFullYear();
      
      if (month < 10) month = "0" + month;
      if (day < 10) day = "0" + day;
      
      var today = year + "-" + month + "-" + day;
      
      
      document.getElementById('the-date').value = today;
  </script>