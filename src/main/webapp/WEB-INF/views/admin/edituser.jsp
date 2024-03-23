<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.demo.models.UserModel"%>
<%@page import="com.demo.entities.Users"%>
<!-- Start header section -->
<%
Users user = (Users) request.getAttribute("user");
%>
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Sửa Sinh Viên</div>
						<hr>
						<form
							action=""
							method="post">
							<div class="form-group">
								<label for="input-1">Số Điện Thoại</label> <input type="text"
									class="form-control" id="input-1" 
									placeholder="So dien thoai" value="" name="sdt">
							</div>
							<div class="form-group">
								<label for="input-1">Ngày Sinh</label> <input type="text"
									class="form-control" id="input-2" placeholder="Ngay Sinh"
									value="" name="ngaysinh">
							</div>
							<div class="form-group">
								<label for="input-3">Địa Chỉ</label> <input type="text"
									class="form-control" id="input-4" placeholder="Dia Chi"
									value="" name="diachi">
							</div>
							<div class="form-group">
								<label for="input-3">Giới Tính</label> <input type="text"
									class="form-control" id="input-5" placeholder="Gioi Tinh"
									value="" name="gioitinh">
							</div>
							<div class="form-group">
								<label for="input-5">Email</label> <input type="text"
									class="form-control" id="input-6" placeholder="Email"
									value="" name="email">
							</div>
							<div class="form-group">
								<button class="btn btn-danger">
									<a href="${pageContext.request.contextPath}/admin/user/list">Hủy</a>
								</button>

								<button type="submit" class="btn btn-success">Cập nhật</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>