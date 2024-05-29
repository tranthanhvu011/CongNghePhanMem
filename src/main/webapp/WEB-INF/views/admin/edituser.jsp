<%@page import="com.demo.entities.LopHoc"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.models.LopHocModel"%>
<%@page import="com.demo.entities.SinhVien"%>
<%@page import="com.demo.models.SinhVienModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.demo.models.UserModel"%>
<%@page import="com.demo.entities.Users"%>
<!-- Start header section -->
<%
Users user = (Users) request.getAttribute("user");
String idEdit = (String) request.getAttribute("idEdit");
SinhVienModel sinhVienModel = new SinhVienModel();
SinhVien sv = sinhVienModel.findSinhVienByID(Integer.parseInt(idEdit));
LopHocModel lopHocs = new LopHocModel();
List<LopHoc> hocs = lopHocs.findAll();
%>
<!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Sửa Học Sinh</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/edituser?id=<%=Integer.parseInt(idEdit)%>" method="post" enctype="multipart/form-data">
                <input value="<%= idEdit%>" type="hidden" name="idNe">
                 <div class="form-group">
                    <label for="input-1">Số thứ tự</label>
                    <input value="<%=sv.getMssv()%>" type="text" class="form-control" id="input-1" placeholder="Nhập Số Thứ Tự" name="mssv">
                  </div>         
                  <div class="form-group">
                    <label for="input-1">Họ và tên</label>
                    <input value="<%=sv.getHoVaTen() %>" type="text" class="form-control" id="input-1" placeholder="Nhập họ tên" name="hoVaTen">
                  </div>
                
                  <div class="form-group">
                    <label for="input-3">Số Điện Thoại</label>
                    <input value="<%=sv.getSoDienThoai()%>" type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumber">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Số Điện Thoại Phụ Huynh</label>
                    <input value="<%=sv.getSoDienThoaiPhuHuynh()%>" type="text" class="form-control" id="input-3" placeholder="Nhập số điện thoại" name="phoneNumberParents">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Ngày Sinh</label>
                    <input value="<%=sv.getBirthday()%>" type="date" class="form-control" id="the-date" placeholder="Nhập Ngày Sinh" name="dateOfBirth">
                  </div>
                  <div class="form-group">
                    <label for="input-4">Địa chỉ</label>
                    <input value="<%=sv.getDiaChi()%>" type="text" class="form-control" id="input-4" placeholder="Nhập địa chỉ" name="address">
                  </div>
                    <div class="form-group">
                    <label for="input-2">Email</label>
                    <input value="<%=sv.getEmail()%>" type="text" class="form-control" id="input-2" placeholder="Nhập địa chỉ Email" name="email">
                  </div>
                 <div class="form-group">
	                  <label for="input-2">Lớp Học</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="className" >
	                    <option value="<%=sv.getIdLopHoc()%>">
	                    <%=lopHocs.findLopHocByID(sv.getIdLopHoc()).getTenLopHoc()%>
	                    </option>
	                    <% 
	                    for(LopHoc lophoc1: hocs){ %>
                            <option value="<%=lophoc1.getId()%>"><%= lophoc1.getTenLopHoc()%></option>
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
                    <button type="submit" name="action" value="change" class="btn btn-success">Sửa Học Sinh</button>
                    <button type="submit"  name="action" value="notChange"  class="btn btn-danger"> Hủy Cập Nhập</button>
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