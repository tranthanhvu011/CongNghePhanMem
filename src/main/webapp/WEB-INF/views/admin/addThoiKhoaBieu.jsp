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
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
      <button class="add-catalog" onclick="navigateToCatalog()">Quay lại</button>
<script>
function navigateToCatalog() {
    window.location.href = "<%= request.getContextPath() %>/admin/chuyenmuc";
}
</script>
<% GiaoVienModel giaoVienModel = new GiaoVienModel();
								List<GiaoVien> liGiaoViens = giaoVienModel.findAllListGiaoVien();%>
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm Thời Khóa Biểu</div>
                <hr>	
       <form action="${pageContext.request.contextPath}/admin/addTKB?id=<%=request.getAttribute("idLopHocChange")%>" method="post"  accept-charset="UTF-8">
           <input type="hidden" name="idLopHocNe" value="<%=request.getAttribute("idLopHocChange")%>"/>
<select class="form-control" id="input-day" name="day">
    <option value="thu2">Thứ 2</option>
</select>
                 <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc1">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
                          <select class="form-control" name="tengiaovien1">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
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
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc2">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien2">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
 <select class="form-control" name="tiet2">
                  
                     <option value="2">
                    Tiết 2
                    </option>
               
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian2" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc3">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien3">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
 <select class="form-control" name="tiet3">
                   
                       <option value="3">
                    Tiết 3
                    </option>
                     
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian3" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc4">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien4">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
 <select class="form-control" name="tiet4">
               
                       <option value="4">
                    Tiết 4
                    </option>
               
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigian4" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhoc5">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovien5">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
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
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu31">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
   <select class="form-control" name="tengiaovienthu31">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                    <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu31">
                    <option value="1">
                    Tiết 1
                    </option>
                 
                    </select>                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu31" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu32">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu32">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                     <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu32">
                    
                     <option value="2">
                    Tiết 2
                    </option>
                 
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu32" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu33">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu33">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                     <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu33">
                
                       <option value="3">
                    Tiết 3
                    </option>
                
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu33" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu34">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu34">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                     <label for="input-1">Tiết</label>
 <select class="form-control" name="tietthu34">
             
                       <option value="4">
                    Tiết 4
                    </option>
               
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu34" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu35">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu35">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                     <label for="input-1">Tiết</label>
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
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu41">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu41">
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
                
                    </select>                     <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu41" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu42">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
  <select class="form-control" name="tengiaovienthu42">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                     <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu42">
                   
                     <option value="2">
                    Tiết 2
                    </option>
                  
                    </select>                                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu42" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu43">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
 <select class="form-control" name="tengiaovienthu43">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu43">
                   
                       <option value="3">
                    Tiết 3
                    </option>
                
                    </select>                                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu43" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu44">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
 <select class="form-control" name="tengiaovienthu44">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu44">
               <option value="4">
                    Tiết 4
                    </option>
                
                    </select>                                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu44" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu45">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
 <select class="form-control" name="tengiaovienthu45">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu45">
                 
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>                                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu45" value="45 Phút" readonly="readonly">      
                    </div>
            
                  <select class="form-control" id="input-day" name="day">
    <option value="thu5">Thứ 5</option>
</select>
                     <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu51">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
 <select class="form-control" name="tengiaovienthu51">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu51">
                    <option value="1">
                    Tiết 1
                    </option>
                 
                    </select>                                   <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu51" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu52">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu52">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu52">
            
                     <option value="2">
                    Tiết 2
                    </option>
                 
                    </select>                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu52" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu53">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu53">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu53">
            
                       <option value="3">
                    Tiết 3
                    </option>
               
                    </select>                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu53" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu54">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu54">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu54">
              
                       <option value="4">
                    Tiết 4
              
                    </select>                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu54" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu55">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu55">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu55">
              
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu55" value="45 Phút" readonly="readonly">      
                    </div>
             
                  <select class="form-control" id="input-day" name="day">
    <option value="thu6">Thứ 6</option>
</select>
                    <div class="form-group">
                    <label for="input-1">Tên Môn Học</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu61">
                     <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu61">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                                    <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu61">
                    <option value="1">
                    Tiết 1
                    </option>
             
                    </select>                                      <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu61" value="45 Phút" readonly="readonly">      
                   </div>
                                    <div class="form-group">
                   <label for="input-1">Tên Môn Học 2</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu62">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu62">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                      <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu62">
              
                     <option value="2">
                    Tiết 2
                    </option>
                
                    </select>                               <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu62" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 3</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu63">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu63">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                      <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu63">
             
                       <option value="3">
                    Tiết 3
                 
                    </select>                               <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu63" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    
                    <label for="input-1">Tên Môn Học 4</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu64">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu64">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                      <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu64">
               
                       <option value="4">
                    Tiết 4
                    </option>
                     
                    </select>                               <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu64" value="45 Phút" readonly="readonly">      
                    </div>
                                     <div class="form-group">
                    <label for="input-1">Tên Môn Học 5</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Nhập tên môn học" name="tenmonhocthu65">
                        <label for="input-1">Giáo Viên Giảng Dạy</label>
<select class="form-control" name="tengiaovienthu65">
                          <% for(GiaoVien giaoVien : liGiaoViens) {%>
                    <option value="<%= giaoVien.getId() %>">
                    <%= giaoVien.getNameGiaoVien()%> || <%=giaoVien.getNgaySinh()  %>
                    </option>
                    <% } %>
                    </select>                      <label for="input-1">Tiết</label>
<select class="form-control" name="tietthu65">
                       <option value="5">
                    Tiết 5
                    </option>
                    </select>                               <label for="input-1">Thời gian</label>
                  <input type="text" class="form-control" id="input-1" placeholder="Nhập thời gian" name="thoigianthu65" value="45 Phút" readonly="readonly">      
                    </div>
         <select class="form-control" id="input-day" name="buoihoc">
  <option value="0">
                  Sáng
                  </option>
                   <option value="1">
                  Tối
                  </option>             
                  </select>
                        <br>
                  <div class="form-group">
                    <button type="submit" class="btn btn-light px-5"><i class="icon-lock"></i>Thêm thời khóa biểu</button>
                  </div>
    </form>
    </div>
                </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
