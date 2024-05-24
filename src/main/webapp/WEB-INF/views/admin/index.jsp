<%@page import="com.demo.models.SinhVienModel"%>
<%@page import="com.demo.models.LopHocModel"%>
<%@page import="com.demo.models.GiaoVienModel"%>
<%@page import="com.demo.entities.GiaoVien"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Order"%>
<%@page import="com.demo.models.UserModel"%>

<%@page import="com.google.api.client.http.HttpRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma" , "no-cache");
  response.setHeader("Expires" , "0");
 
  
  if (session.getAttribute("admin-username") == null){
	  response.sendRedirect(request.getContextPath() + "/admin/login"); 
  }

  NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN"));

  
  %>
  
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
     
        <div class="row">
          <div class="col-20 col-lg-4 col-xl-4">
            <div class="card">
              <div class="card-header">Bảng Tính Tổng Quản Lý
              </div>
              
              <div class="table-responsive">
                <table class="table align-items-center">
                  <tbody>
                  <% GiaoVienModel giaoVienModel = new GiaoVienModel();
                  LopHocModel lopHocModel = new LopHocModel();
                  SinhVienModel sinhVienModel = new SinhVienModel();
                  int count = sinhVienModel.totalSinhVien();
                  int count1 = lopHocModel.totalLopHoc();
                  int count2 = giaoVienModel.totalGiaoVien();
                  %>
                    <tr>
                      <td><i class="fa fa-circle text-white mr-2"></i>Tổng Lớp Học</td>
                      <td><%=count1 %></td>
                    </tr>
                     <tr>
                      <td><i class="fa fa-circle text-light-1 mr-2"></i>Tổng Giáo Viên</td>
                      <td><%=count2 %></td>
                    </tr>
                    <tr>
                      <td><i class="fa fa-circle text-light-1 mr-2"></i>Tổng Sinh Viên</td>
                      <td><%=count %></td>
                    </tr>
<%--                    <tr>--%>
<%--                      <td><i class="fa fa-circle text-light-2 mr-2"></i>Hạt</td>--%>
<%--                      <td>215.500 VNĐ</td>--%>
<%--                      <td>+15%</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                      <td><i class="fa fa-circle text-light-3 mr-2"></i>Mật ong</td>--%>
<%--                      <td>310.000 VNĐ</td>--%>
<%--                      <td>+5%</td>--%>
<%--                    </tr>--%>
                  </tbody>                </table>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   
  </div>