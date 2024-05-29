<%@page import="com.demo.models.*"%>
<%@page import="com.demo.entities.*"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
<% String message = (String) request.getAttribute("message");%>
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
               <% if(message != null) {%>
              <h4 style="text-align: center"><%= message %></h4>
              <% } %>
              <!-- *nếu thêm lớp học thành công
		9.1. Hệ thống hiễn thị ra thông báo Thêm Lớp Học Thành Công ở trang Thêm Lớp Học sau khi reload lại.
*không thêm được lớp học
		9.2. Hệ thống hiễn thị ra thông báo Thêm lớp học thất bại ở trang Thêm Lớp Học sau khi reload lại.
		10. Kết thúc Use Case -->
                <div class="card-title">Thêm Lớp Học</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/addcatalog" method="post">
                  <div class="form-group">
                    <label for="input-1">Tên Giáo Viên</label>
                    <br>
<!-- 4.  Hiển thị giao diện thêm lớp học
5.  Người dùng chọn tên giáo viên, điền lớp và ấn nút “Thêm”. 
6.  Gửi yêu cầu thêm lớp học cho hệ thống.
-->
               <select class="form-control select2" name="catalogname" >
                 <% GiaoVienModel giaoVienModel = new GiaoVienModel(); 
                     for(GiaoVien giaoVien : giaoVienModel.findAllListGiaoVien()){
                     %>
                    <option value="<%=giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien() %> | | <%= giaoVien.getNgaySinh() %>
                    </option>
                   <% } %>
                    </select> 
                  </div>
                   <div class="form-group">
                   <!-- Nhập tên lớp học để gửi qua servlet -->
                    <label for="input-1">Tên Lớp Học</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Tên lớp học" name="className">
                  </div>
	                    </select>
	                  </div>
	                </div>
                 <div class="form-footer">
                    <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Thêm</button>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
