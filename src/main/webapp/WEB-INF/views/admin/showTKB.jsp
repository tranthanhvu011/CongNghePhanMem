<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.demo.entities.ThoiKhoaBieu"%>
<%@page import="com.demo.models.ThoiKhoaBieuModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <button class="add-catalog" onclick="navigateToCatalog()">Quay lại</button>
<script>
function navigateToCatalog() {
    window.location.href = "<%= request.getContextPath() %>/admin/chuyenmuc";
}
</script>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Thời Khóa Biểu Lớp</h4>
						<h5> Thứ 2 Buổi Sáng</h5>
						<div class="table-responsive">
					<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Tiết</th>
            <th scope="col">Môn</th>
            <th scope="col">Giáo Viên</th>
            <th scope="col">Thời Gian</th>
        </tr>
    </thead>
    <tbody>
        <% 
        String idRequest = (String) request.getAttribute("idRequest");
        int idRe = Integer.parseInt(idRequest); // Parse the String to int
        ThoiKhoaBieuModel thoiKhoaBieu = new ThoiKhoaBieuModel();
            List<ThoiKhoaBieu> thoiKhoaBieus = thoiKhoaBieu.listThoiKhoaBieu(idRe);
            
            for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(2); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        
    </tbody>
</table>
						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 2 Buổi Chiều</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<% for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 1) {
                JSONObject thu2Json = tkb.getThuJson(2); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        			
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 3 Buổi Sáng</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 3</td></tr>");
                }
            }
            }
        %>                        			
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 3 Buổi Chiều</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 1) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 4 Buổi Sáng</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 4 Buổi Chiều</h5>
						<div class="table-responsive">
								<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 1) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>
						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 5 Buổi Sáng</h5>
						<div class="table-responsive">
								<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 5 Buổi Chiều</h5>
						<div class="table-responsive">
								<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 1) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 6 Buổi Sáng</h5>
						<div class="table-responsive">
								<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
				<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5> Thứ 6 Buổi Chiều</h5>
						<div class="table-responsive">
								<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tiết</th>
										<th scope="col">Môn</th>
										<th scope="col">Giáo Viên</th>
										<th scope="col">Thời Gian</th>
									</tr>
								</thead>
								<tbody>
								<%		  
								for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 1) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu3"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    for (int i = 0; i < monHocArray.length(); i++) {
                        JSONObject monHoc = monHocArray.getJSONObject(i);
                        String teacherIdKey = "GiaoVien" + (i + 1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
               <tr>
            <td><%= monHoc.optString("Tiet", "") %></td>
            <td><%= monHoc.optString("TenMon" + (i + 1), "") %></td>
            <td><%= teacherName.getNameGiaoVien() %> || <%=teacherName.getNgaySinh() %></td>
            <td><%= monHoc.optString("ThoiGian" + (i + 1), "") %></td>
        </tr>
        <%              }
                } else {
                    out.println("<tr><td colspan='4'>No data found for Thu 2</td></tr>");
                }
            }
            }
        %>                        				
										</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>