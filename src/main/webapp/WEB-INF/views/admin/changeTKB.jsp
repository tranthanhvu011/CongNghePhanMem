<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.demo.entities.*" %>
<%@ page import="com.demo.models.*" %>
<%@ page import="java.util.*" %>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}

%>
<html>      
<head>
    <title>Change Status</title>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/js/select2.min.js"></script>
    
</head>
<body>
<% String idRequest1 =(String) request.getAttribute("idRequest");
int idRequestNe = Integer.parseInt(idRequest1);
%>
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
      <button class="add-catalog" onclick="navigateToCatalog()">Quay lại</button>
<script>
function navigateToCatalog() {
    window.location.href = "<%= request.getContextPath() %>/admin/chuyenmuc";
}
</script>
					<a href="${pageContext.request.contextPath}/admin/changeTKB?id=<%= idRequestNe%>&action=changeBuoiChieu"><button class="add-catalog">
					Sửa Thời Khóa Biểu Buổi Chiều			</button>
					 </a>
<% GiaoVienModel giaoVienModel = new GiaoVienModel();
								List<GiaoVien> liGiaoViens = giaoVienModel.findAllListGiaoVien();%>
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Sửa Thời Khóa Biểu Buổi Sáng</div>
                <hr>	
       <form action="${pageContext.request.contextPath}/admin/changeTKB?id=<%=idRequestNe %>&action=changeBuoiSang" method="post"  accept-charset="UTF-8">
           <input type="hidden" name="idLopHocNe" value="<%=idRequestNe%>"/>
<select class="form-control" id="input-day" name="day">
    <option value="thu2">Thứ 2</option>
</select>
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
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(count);
                        String teacherIdKey = "GiaoVien" + (count + 1);
                        count++;
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                 <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc1" value="<%= monHoc.optString("TenMon" + (1), "")%>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
                          <select class="form-control" name="tengiaovien1">
                          <option value="<%= monHoc.optString("GiaoVien" + (1), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh() %>
                    </option>
                    <%  } %>
                    </select>
                    <label for="input-1">Tiết</label>
                          <select class="form-control" name="tiet1">
                    <option value="1">
                    Tiết 1
                    </option>
                    </select>
                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian1" value="45 Phút" readonly="readonly">      
                   </div>
                   <%      
          }
                } else {
                }
            }
            
        %>                        
                                    <div class="form-group">
                     
                   <label for="input-1">Tên Môn Học 2</label>
                      <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(2); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(1);
                        String teacherIdKey = "GiaoVien" + (2);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc2" value="<%= monHoc.optString("TenMon" + (2), "") %>">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien2">
                             <option value="<%= monHoc.optString("GiaoVien" + (2), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                          
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    
                    </select>                  
                    
                                   <%      
          }
                } else {
                }
            }
            
        %>     
        <label for="input-1">Tiết</label>
 <select class="form-control" name="tiet2">
                  
                     <option value="2">
                    Tiết 2
                    </option>
               
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian2" value="45 Phút" readonly="readonly">      
                    </div>
                         
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                       <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(2); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(2);
                        String teacherIdKey = "GiaoVien" + (3);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc3" value="<%= monHoc.optString("TenMon" + (3), "") %>">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien3">
                             <option value="<%= monHoc.optString("GiaoVien" + (3), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                          
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    
                    </select>                  
                    
                                   <%      
          }
                } else {
                }
            }
            
        %>                 <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian3" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(2); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(3);
                        String teacherIdKey = "GiaoVien" + (4);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc4" value="<%= monHoc.optString("TenMon" + (4), "") %>">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien4">
                             <option value="<%= monHoc.optString("GiaoVien" + (4), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                          
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    
                    </select>                  
                    
                                   <%      
          }
                } else {
                }
            }
            
        %>                    <label for="input-1">Tiết</label>
 <select class="form-control" name="tiet4">
               
                       <option value="4">
                    Tiết 4
                    </option>
               
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian4" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                        <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(2); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(4);
                        String teacherIdKey = "GiaoVien" + (5);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc5" value="<%= monHoc.optString("TenMon" + (5), "") %>">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien5">
                             <option value="<%= monHoc.optString("GiaoVien" + (5), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                          
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    
                    </select>                  
                    
                                   <%      
          }
                } else {
                }
            }
            
        %>       <label for="input-1">Tiết</label>
 <select class="form-control" name="tiet5">
                  
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian5" value="45 Phút" readonly="readonly">      
                    </div>
                 
   <select class="form-control" id="input-day" name="day">
    <option value="thu3">Thứ 3</option>
</select>
                 <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                       <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(0);
                        String teacherIdKey = "GiaoVien" + (1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu31" value="<%= monHoc.optString("TenMon" + (1), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovienthu31">
                                <option value="<%= monHoc.optString("GiaoVien" + (1), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>   <%      
          }
                } else {
                }
            }
            
        %>                 <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu31">
                    <option value="1">
                    Tiết 1
                    </option>
                 
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu31" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                      <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(1);
                        String teacherIdKey = "GiaoVien" + (2);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu32" value="<%= monHoc.optString("TenMon" + (2), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovienthu32">
                                <option value="<%= monHoc.optString("GiaoVien" + (2), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>   <%      
          }
                } else {
                }
            }
            
        %>                                         <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu32">
                    
                     <option value="2">
                    Tiết 2
                    </option>
                 
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu32" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                      <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(2);
                        String teacherIdKey = "GiaoVien" + (3);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu33" value="<%= monHoc.optString("TenMon" + (3), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovienthu33">
                                <option value="<%= monHoc.optString("GiaoVien" + (3), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>   <%      
          }
                } else {
                }
            }
            
        %>                                  <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu33">
                
                       <option value="3">
                    Tiết 3
                    </option>
                
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu33" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                       <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(3);
                        String teacherIdKey = "GiaoVien" + (4);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu34" value="<%= monHoc.optString("TenMon" + (4), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovienthu34">
                                <option value="<%= monHoc.optString("GiaoVien" + (4), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>   <%      
          }
                } else {
                }
            }
            
        %>                               <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu34">
             
                       <option value="4">
                    Tiết 4
                    </option>
               
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu34" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                      <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(3); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc1")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc1");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(4);
                        String teacherIdKey = "GiaoVien" + (5);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu35" value="<%= monHoc.optString("TenMon" + (5), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovienthu35">
                                <option value="<%= monHoc.optString("GiaoVien" + (5), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
   
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>   <%      
          }
                } else {
                }
            }
            
        %>                               <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu35">
                   
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu35" value="45 Phút" readonly="readonly">      
                    </div>
            
                  <select class="form-control" id="input-day" name="day">
    <option value="thu4">Thứ 4</option>
</select>
                   <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                             <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(0);
                        String teacherIdKey = "GiaoVien" + (1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu41" value="<%= monHoc.optString("TenMon" + (1), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu41">
                                  <option value="<%= monHoc.optString("GiaoVien" + (1), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                     <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu41">
                    <option value="1">
                    Tiết 1
                    </option>
                
                    </select>  
                     <%      
          }
                } else {
                }
            }
            
        %>                                        <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu41" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                    <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(1);
                        String teacherIdKey = "GiaoVien" + (2);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu42" value="<%= monHoc.optString("TenMon" + (2), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu42">
                                  <option value="<%= monHoc.optString("GiaoVien" + (2), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                        <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu42">
                   
                     <option value="2">
                    Tiết 2
                    </option>
                  
                    </select>            <%      
          }
                } else {
                }
            }
            
        %>                                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu42" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                   <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(2);
                        String teacherIdKey = "GiaoVien" + (3);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu43" value="<%= monHoc.optString("TenMon" + (3), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu43">
                                  <option value="<%= monHoc.optString("GiaoVien" + (3), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                           <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu43">
                   
                       <option value="3">
                    Tiết 3
                    </option>
                
                    </select>     
                             <%      
          }
                } else {
                }
            }
            
        %>                                                    <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu43" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(3);
                        String teacherIdKey = "GiaoVien" + (4);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu44" value="<%= monHoc.optString("TenMon" + (4), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu44">
                                  <option value="<%= monHoc.optString("GiaoVien" + (4), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                 <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu44">
               <option value="4">
                    Tiết 4
                    </option>
                
                    </select>   
                             <%      
          }
                } else {
                }
            }
            
        %>                                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu44" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                    <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(4); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc2")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc2");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(4);
                        String teacherIdKey = "GiaoVien" + (5);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu45" value="<%= monHoc.optString("TenMon" + (5), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu45">
                                  <option value="<%= monHoc.optString("GiaoVien" + (5), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                               <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu45">
                 
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>    
                             <%      
          }
                } else {
                }
            }
            
        %>                                                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu45" value="45 Phút" readonly="readonly">      
                    </div>
            
                  <select class="form-control" id="input-day" name="day">
    <option value="thu5">Thứ 5</option>
</select>
                     <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                    <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(0);
                        String teacherIdKey = "GiaoVien" + (1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu51" value="<%= monHoc.optString("TenMon" + (1), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu51">
                                  <option value="<%= monHoc.optString("GiaoVien" + (1), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu51">
                    <option value="1">
                    Tiết 1
                    </option>
                 
                    </select> 
                             <%      
          }
                } else {
                }
            }
            
        %>                                                        <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu51" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                      <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(1);
                        String teacherIdKey = "GiaoVien" + (2);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu52" value="<%= monHoc.optString("TenMon" + (2), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu52">
                                  <option value="<%= monHoc.optString("GiaoVien" + (2), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                         <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu52">
            
                     <option value="2">
                    Tiết 2
                    </option>
                 
                    </select>    
                             <%      
          }
                } else {
                }
            }
            
        %>                                                        <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu52" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                     <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(2);
                        String teacherIdKey = "GiaoVien" + (3);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu53" value="<%= monHoc.optString("TenMon" + (3), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu53">
                                  <option value="<%= monHoc.optString("GiaoVien" + (3), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>     
                                     <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu53">
            
                       <option value="3">
                    Tiết 3
                    </option>
               
                    </select>    
                             <%      
          }
                } else {
                }
            }
            
        %>                                                        <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu53" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(3);
                        String teacherIdKey = "GiaoVien" + (4);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu54" value="<%= monHoc.optString("TenMon" + (4), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu54">
                                  <option value="<%= monHoc.optString("GiaoVien" + (4), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                               <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu54">
              
                       <option value="4">
                    Tiết 4
              
                    </select>  
                             <%      
          }
                } else {
                }
            }
            
        %>                                                          <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu54" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                       <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(5); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc3")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc3");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(4);
                        String teacherIdKey = "GiaoVien" + (5);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu55" value="<%= monHoc.optString("TenMon" + (5), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu55">
                                  <option value="<%= monHoc.optString("GiaoVien" + (5), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu55">
              
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>   
                                                <%      
          }
                } else {
                }
            }
            
        %>                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu55" value="45 Phút" readonly="readonly">      
                    </div>
             
                  <select class="form-control" id="input-day" name="day">
    <option value="thu6">Thứ 6</option>
</select>
                    <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                     <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(0);
                        String teacherIdKey = "GiaoVien" + (1);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu61" value="<%= monHoc.optString("TenMon" + (1), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu61">
                                  <option value="<%= monHoc.optString("GiaoVien" + (1), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                               <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu61">
                    <option value="1">
                    Tiết 1
                    </option>
             
                    </select>  
                             <%      
          }
                } else {
                }
            }
            
        %>                                                          <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu61" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                  <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(1);
                        String teacherIdKey = "GiaoVien" + (2);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu62" value="<%= monHoc.optString("TenMon" + (2), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu62">
                                  <option value="<%= monHoc.optString("GiaoVien" + (2), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                        <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu62">
              
                     <option value="2">
                    Tiết 2
                    </option>
                
                    </select>      
                             <%      
          }
                } else {
                }
            }
            
        %>                                               <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu62" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                     <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(2);
                        String teacherIdKey = "GiaoVien" + (3);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu63" value="<%= monHoc.optString("TenMon" + (3), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu63">
                                  <option value="<%= monHoc.optString("GiaoVien" + (3), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>               <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu63">
             
                       <option value="3">
                    Tiết 3
                 
                    </select>         
                             <%      
          }
                } else {
                }
            }
            
        %>                                            <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu63" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                   <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(3);
                        String teacherIdKey = "GiaoVien" + (4);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu64" value="<%= monHoc.optString("TenMon" + (4), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu64">
                                  <option value="<%= monHoc.optString("GiaoVien" + (4), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>        <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu64">
               
                       <option value="4">
                    Tiết 4
                    </option>
                     
                    </select>  
                             <%      
          }
                } else {
                }
            }
            
        %>                                                   <label for="input-1">Thời gian</label>
                 <%for (ThoiKhoaBieu tkb : thoiKhoaBieus) {
                if (Integer.parseInt(tkb.getBuoi()) == 0) {
                JSONObject thu2Json = tkb.getThuJson(6); // get JSON for "thu2"
                if (thu2Json != null && thu2Json.has("MonHoc4")) { // Check if "MonHoc" key exists
                    JSONArray monHocArray = thu2Json.getJSONArray("MonHoc4");
                    int count = 0;
                        JSONObject monHoc = monHocArray.getJSONObject(4);
                        String teacherIdKey = "GiaoVien" + (5);
                        int teacherId = monHoc.optInt(teacherIdKey, -1);
                        GiaoVien teacherName = GiaoVienModel.findGiaoVienById(teacherId);
    %>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu65" value="<%= monHoc.optString("TenMon" + (5), "") %>">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu65">
                                  <option value="<%= monHoc.optString("GiaoVien" + (5), "")%>"> <%=teacherName.getNameGiaoVien() %> || <%= teacherName.getNgaySinh() %> </option>
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                     <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu65">
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>    
                             <%      
          }
                } else {
                }
            }
            
        %>                                                 <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu65" value="45 Phút" readonly="readonly">      
                    </div>
         <select class="form-control" id="input-day" name="buoihoc">
  <option value="0">
                  Sáng
                  </option>
                  </select>
                        <br>
                  <div class="form-group">
                    <button type="submit" class="btn btn-light px-5"><i class="icon-lock"></i>Thêm thời khóa biểu</button>
                    	
                  </div>
    </form>
    <form action="${pageContext.request.contextPath}/admin/changeTKB?id=<%=idRequestNe%>&action=xoaBuoiSang" method="post">
     <button class="add-catalog"> Xóa Thời Khóa Biểu Buổi Sáng</button>
    </form>
   
    </div>
                </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
