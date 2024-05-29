<%@page import="com.demo.entities.GiaoVien"%>
<%@page import="com.demo.models.GiaoVienModel"%>
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
											<% 
										Integer user = (Integer) session.getAttribute("user"); 
										if (user == 2) {
										%>
										<% } else { %>
				<button class="add-catalog">
					<a href="${pageContext.request.contextPath}/admin/addGiaoVien">Thêm Giáo Viên</a>
				</button>
				<%} %>
			<div style="display: flex; justify-content: space-between;">
  <div>
   <div style="display: flex; justify-content: space-between; margin: 5px">
  <div>
  <div style="display: flex; justify-content: space-between;">
  <div style="margin-right: 10px;">
    <form style="background-color: #4654e1;
      width: 300px;
      height: 44px;
      border-radius: 2px;
      display: flex;
      flex-direction: row;
      align-items: center;" id="form-left" role="search">
      <input style="  all: unset;
      font: 16px system-ui;
      color: #fff;
      height: 100%;
      width: 100%;
      padding: 2px 10px;" type="search" id="query-left" name="q-left"
      placeholder="Tìm kiếm theo tên"
      aria-label="Search through site content">
   <button class="btn btn-success"
>Tìm Kiếm</button>
    </form>
     <div id="results">
    </div>
  </div>
  </div>
  
<script>
var contextPath = "${pageContext.request.contextPath}";
$(document).ready(function() {
    $('#form-left').submit(function(event) {
        event.preventDefault(); // Ngăn chặn việc gửi form thông qua trình duyệt
        var searchQuery = $('#query-left').val(); // Lấy giá trị từ trường nhập
        var s = '';
        $.ajax({
            url: contextPath + '/autocomplete', // Sử dụng biến contextPath để tạo URL
            type: 'GET',
            data: { action: 'findGiaoVienByName', name: searchQuery },
            success: function(response) {
                for (var i = 0; i < response.length; i++) {
                    s+= '<tr>';
                    s+= '<td>'  + response[i].nameGiaoVien + '</td>';
                    s+= '<td>'  + response[i].ngaySinh + '</td>';
                    s+= '<td>'  + response[i].gioiTinh + '</td>';
                    s+= '<td>'  + response[i].diaChi + '</td>';
                    s+= '<td>'  + response[i].soDienThoai + '</td>';
                    s+= '<td>'  + response[i].email + '</td>';
                    s+= '<td><img src="' + contextPath + '/res/thumball/' + response[i].anhDaiDien + '" style="width: 100px; height: 60px;border: 2px soild red; border-radius: 5px;"></td>></td>';
                    s += '<td>' +
                    '<button class="btn btn-danger delete-user" data-id="' + response[i].id + '">Xóa</button>' +
                    '<button class="btn btn-success" onclick="location.href=\'${pageContext.request.contextPath}/admin/edituser?id=' + response[i].id + '\'">Sửa</button>'
                    '</td>';
                    s+= '</tr>';
                }
                // Nơi hiển thị kết quả, ví dụ như append vào một element nào đó
                $('.table-striped tbody').html(s);
            },
            error: function(xhr, status, error) {
                console.error("An error occurred: " + error);
            }
        });
    });
});
</script>
 </div>
</div>
  </div>
</div>
<br>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách Giáo Viên</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
									   	<th scope="col">Tên Giáo Viên</th>						       
   								        <th scope="col">Ngày Sinh</th>	
   								        <th scope="col">Giới Tính</th>						       	       
										<th scope="col">Địa chỉ</th>
										<th scope="col">Số điện thoại</th>
										<th scope="col">Email</th>
										<th scope="col">Ảnh</th>
										<th scope="col">Hành Động</th>
									</tr>
								</thead>
								<tbody>
								<% GiaoVienModel giaoVienModel = new GiaoVienModel();
								List<GiaoVien> liGiaoViens = giaoVienModel.findAllListGiaoVien();%>
								<% for(GiaoVien giaoVien : liGiaoViens) {
									%>
									<tr>
										<td> <%= giaoVien.getNameGiaoVien() %></td>									
										<td> <%= giaoVien.getNgaySinh() %></td>
										<td> <%= giaoVien.getGioiTinh() %></td>
										<td> <%= giaoVien.getDiaChi() %></td>
										<td> <%= giaoVien.getSoDienThoai() %></td>
										<td> <%=giaoVien.getEmail() %></td>
										<td> <img style="width: 100px; height: 50px; border: 2px soild red; border-radius: 5px" src="${pageContext.request.contextPath}/res/thumball/<%=giaoVien.getAnhDaiDien() %>" alt="logo icon">
										</td>
													<% 
										if (user == 2) {
										%>
										<% } else { %>
										<td>
											<button class="btn btn-danger delete-user" data-id="<%= giaoVien.getId()%> " name="action">Xóa
											</button>
											<a
													href="${pageContext.request.contextPath}/admin/editGiaoVien?id=<%=giaoVien.getId()%>">	
														<button class="btn btn-success">
											Sửa</button></a>
																													<% } %>
											
										</td>
										
									</tr>
								<% } %>
								</tbody>
							</table>
							<script>
var contextPath = "${pageContext.request.contextPath}";
$(document).on('click', '.btn-danger', function() {
    var giaoVienID = $(this).data('id'); // Lấy ID từ thuộc tính data-id của nút
    var url = contextPath + '/admin/quanligiaovien?action=delete&id=' + giaoVienID; // Tạo URL cho yêu cầu AJAX
    console.log(giaoVienID);
    if (confirm('Bạn có chắc chắn muốn xóa sinh viên này không?')) {
        $.ajax({
            url: url,
            type: 'POST', // Nên sử dụng POST cho các hành động thay đổi dữ liệu, điều này yêu cầu thay đổi trên server
            success: function(response) {
                alert('Xóa thành công');
                location.reload();
            },
            error: function() {
                alert('Lỗi khi xóa');
            }
        });
    }
});</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>