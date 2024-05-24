<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.demo.entities.*" %>
<%@ page import="com.demo.models.*" %>
<%@ page import="java.util.*" %>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
List<LopHoc> lopHoc = (List<LopHoc>) request.getAttribute("lopHoc");
LopHocModel lopHocModel= new LopHocModel();
List<SinhVien> sv = (List<SinhVien>) request.getAttribute("svListById");
SinhVienModel sinhVienModel = new SinhVienModel();
if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}

%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a
						href="${pageContext.request.contextPath}/admin/addcatalog">Thêm Lớp Học</a>
				</button>
				
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách lớp học</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Giáo Viên Chủ Nhiệm</th>
										<th scope="col">Tên Lớp</th>
										<th scope="col">Hiễn Thị</th>
										<th scope="col">Thời Khóa Biểu</th>
									</tr>
								</thead>
								<tbody>
								<% for(LopHoc lopHoc1: lopHoc){ %>
										<tr>
											<td><%= lopHoc1.getNameGiaoVien()%></td>
											<td><%= lopHoc1.getTenLopHoc()%></td>
											<td>
											
									<button class="btn btn-primary" data-toggle="modal" data-target="#modal_<%= lopHoc1.getId() %>">
									Xem Sinh Viên</button>
																				<td>
								<a
													href="${pageContext.request.contextPath}/admin/addTKB?id=<%=lopHoc1.getId()%>">	<button class="btn btn-danger">
												Thêm Thời Khóa Biểu
											</button>
</a>
								<a
													href="${pageContext.request.contextPath}/admin/changeTKB?id=<%=lopHoc1.getId()%>&action=changeBuoiSang"><button class="btn btn-success">
												
											Sửa Thời Khóa Biểu</button></a>
											<a
													href="${pageContext.request.contextPath}/admin/getMonHoc?id=<%=lopHoc1.getId()%>"><button class="btn btn-info">
												
											Xem Thời Khóa Biểu</button></a>
					<td>		
									<%List<SinhVien> svList1 = SinhVienModel.listSinhVienByIDLopHoc(lopHoc1.getId()); %>
<div class="modal fade" id="modal_<%= lopHoc1.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div style=" margin-right: 750px" class="modal-dialog modal-lg">
            <div style=" margin-right: 550px" class="modal-content">
                    <table style="background-color: #496989; margin-right: 500px" class="table table-striped">
								<thead>
									<tr>
										<th scope="col">STT</th>										
										<th scope="col">Họ Và Tên</th>
										<th scope="col">Tên Lớp</th>
										<th scope="col">Số điện thoại</th>
										<th scope="col">Số điện thoại phụ huynh</th>
										<th scope="col">Ngày Sinh</th>
										<th scope="col">Giới tính</th>
										<th scope="col">Địa chỉ</th>
										<th scope="col">Email</th>
										<th scope="col">Hình Ảnh</th>
									</tr>
								</thead>
								<tbody>
								<% for(SinhVien listSv: svList1){ %>
										<tr>
											<td><%= listSv.getMssv() %></td>										
											<td><%= listSv.getHoVaTen() %></td>
											<td><%=listSv.getNameLopHoc() %></td>
											<td><%= listSv.getSoDienThoai() %></td>
											<td><%= listSv.getSoDienThoaiPhuHuynh()%></td>
											<td><%=listSv.getBirDate() %></td>
											<td><%= listSv.getGioiTinh() %></td>
											<td><%=listSv.getDiaChi() %></td>
											<td><%= listSv.getEmail() %></td>
											<td><img style="width: 100px; height: 50px" src="${pageContext.request.contextPath}/res/thumball/<%= listSv.getHinhAnh()%>" alt="logo icon"></td>
											</tr>
											<% } %>

											</tbody>
      </table>
    </div>
  </div>
</div>	
									</td>
										</tr>
										<% } %>
								</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>