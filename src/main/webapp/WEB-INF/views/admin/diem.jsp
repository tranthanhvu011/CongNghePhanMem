<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Điểm của học sinh</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Môn Học</th>
										<th scope="col">Điểm</th>
									</tr>
								</thead>
								<tbody>															<tr>
											<td></td>
											<td></td></tbody>
      </table>
      	<div class="col-lg-12">
				<button class="add-catalog">
					<a
						href="${pageContext.request.contextPath}/admin/changeDiem?id=">Sửa Điểm</a>
				</button>
			</div>
    </div>
  </div>
</div>	
											</td>
										</tr>
								</tbody>
								
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>