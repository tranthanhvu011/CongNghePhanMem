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

        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm Học Sinh</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/adduser?action=addUser" method="post" enctype="multipart/form-data">
                 <div class="form-group">
                    <label for="input-1">Số thứ tự</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập số thứ tự" name="mssv">
                  </div>         
                  <div class="form-group">
                    <label for="input-1">Họ và tên</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập họ tên" name="hoVaTen">
                  </div>
                
                  <div class="form-group">
                    <label for="input-3">Số Điện Thoại</label>
                    <input type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumber">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Số Điện Thoại Phụ Huynh</label>
                    <input type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumberParents">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Ngày Sinh</label>
                    <input type="date" class="form-control" id="the-date" placeholder="Nhập Ngày Sinh" name="dateOfBirth">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Giới Tính</label>
                    <select class="form-control" name="gioiTinh">
                    <option value="Nam">
                    Nam
                    </option>
                     <option value="Nam">
                    Nữ
                    </option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label for="input-4">Địa chỉ</label>
                    <input type="text" class="form-control" id="input-4" placeholder="Nhập địa chỉ" name="address">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Email</label>
                    <input type="text" class="form-control" id="input-2" placeholder="Nhập địa chỉ Email" name="email">
                  </div>
                 <div class="form-group">
	                  <label for="input-2">Lớp Học</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="className" >
	                    <% 
	                    for(LopHoc lophoc1: lopHocs){ %>
                            <option value="<%=lophoc1.getId()%>"><%= lophoc1.getTenLopHoc() %></option>
                            <% } %>
                            </select>
                                              </div>
                                                                      </div>
                    <div class="form-group">
                <label for="input-2">Hình ảnh</label>
                <br>
                        <input type="file" name="studentImage" />
                  </div>
                  <div class="form-group">
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