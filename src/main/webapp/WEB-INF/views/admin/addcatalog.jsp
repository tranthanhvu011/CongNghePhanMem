<%@page import="com.demo.models.*"%>
<%@page import="com.demo.entities.*"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!-- Start header section -->

    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row mt-3">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm Lớp Học</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/addcatalog" method="post">
                  <div class="form-group">
                    <label for="input-1">Tên Giáo Viên</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Tên chuyên mục" name="catalogname">
                  </div>
                   <div class="form-group">
                    <label for="input-1">Tên Lớp Học</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Tên lớp học" name="className">
                  </div>
	                    </select>
	                  </div>
	                </div>
                 <div class="form-footer">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-times"></i>Hủy</button>
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