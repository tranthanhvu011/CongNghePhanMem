<%@page import="com.demo.models.LopHocModel"%>
<%@page import="com.demo.entities.SinhVien"%>
<%@page import="com.demo.models.SinhVienModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.demo.models.UserModel"%>
<%@page import="com.demo.entities.Users"%>
<%@page import="java.util.*"%>

<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
SinhVienModel sinhVienModel = new SinhVienModel();
List<SinhVien> sinhViens = (List<SinhVien>) request.getAttribute("sinhVien");

if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}
LopHocModel lopHocModel = new LopHocModel();
%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a href="${pageContext.request.contextPath}/admin/adduser">Thêm
						Sinh Viên</a>
				</button>
				<form style="background-color: #4654e1;
  width: 300px;
  height: 44px;
  border-radius: 5px;
  display: flex;
  flex-direction: row;
  align-items: center;" id="form" role="search">
  <input style="  all: unset;
  font: 16px system-ui;
  color: #fff;
  height: 100%;
  width: 100%;
  padding: 6px 10px;" type="search" id="query" name="q"
   placeholder="Search..."
   aria-label="Search through site content">
  <button style="
  background-color: #824D74;
  cursor: pointer;
  width: 60px;
  height: 44px;
  border: 2px soild red;
  border-radius: 10px;
 ">Search</button>
</form>
<br>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách Sinh Viên</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
                                        <th scope="col">MSSV</th>
										<th scope="col">Họ và tên</th>
										<th scope="col">Số điện thoại</th>
   								        <th scope="col">Ngày sinh</th>
   								        <th scope="col">Giới tính</th>						       
										<th scope="col">Địa chỉ</th>
										<th scope="col">Email</th>
										<th scope="col">Lớp Học</th>
										<th scope="col">Ảnh</th>

									</tr>
								</thead>
								<tbody>
									<%
									for (SinhVien sv : sinhViens) {
									%>
									<tr>
										<td><%=sv.getMssv()%></td>									
										<td><%=sv.getHoVaTen()%></td>
										<td><%=sv.getSoDienThoai()%></td>
										<td><%=sv.getBirDate()%></td>
										<td><%=sv.getGioiTinh()%></td>
									    <td><%=sv.getDiaChi()%></td>
										<td><%=sv.getEmail()%></td>
										<td><%=lopHocModel.findLopHocByID(sv.getIdLopHoc()).getTenLopHoc()%></td>
										<td><img style="width: 100px; height: 50px" src="${pageContext.request.contextPath}/res/thumball/<%= sv.getHinhAnh()%>" alt="logo icon">
										</td>
										<td>
											<button class="btn btn-danger">
												<a
													href="${pageContext.request.contextPath}/admin/quanliuser?action=delete&id=<%= sv.getId() %>">Xóa</a>
											</button>

											<button class="btn btn-success">
												<a
													href="${pageContext.request.contextPath}/admin/edituser">Sửa</a>
											</button>
											
								
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>