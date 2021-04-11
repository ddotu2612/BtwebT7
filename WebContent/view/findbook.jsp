<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhóm 26</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</head>
<body>

	<div class="container mt-4">
		<%boolean update = Boolean.valueOf((String)request.getAttribute("information-update-succees"));
	if(update) {
		%>
		<h5 style="color: red">Cập nhật thông tin thành công</h5>
		<%
	}
	%>
	<h3>Tìm kiếm thông tin sách</h3>
	<form action="/ExcerciseT7/check-find" method="post">
		<div class="row g-3 align-items-center"> 
			<div class="col-auto">
			    <input type="text" class="form-control col-auto" name="search" placeholder="Nhập từ khóa tìm kiếm"> 
  			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary" value="search">Search</button>
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-secondary" onclick="logout()">Logout</button>
			</div>
		</div>
		
	</form>
	
	<%
	String name = request.getAttribute("name1")==null ? "" : (String)request.getAttribute("name1") ;
	List<Book> books = (ArrayList<Book>)request.getAttribute("books");
	%>
	<%
		if(books != null) {
			%>
			<%
			if(!name.equals("")) {
				%>
				<p class="mt-4">Kết quả tìm kiếm sách cho từ khóa "<%=name %>"</p>
				<%
			}
			%>
			<div class="mt-4">
			<table class="table" style="color:#fff;"> 
				<thead>
					<tr>
						<th>Id</th>
						<th>Tên sách</th>
						<th>Nhà xuất bản</th>
						<th>Giá</th>
						<th>Sửa</th>
						<th>Xóa</th>
					</tr>
				</thead>
				<tbody>
			<%
				for(int i = 0; i < books.size(); i++) {
					int id = books.get(i).getId();
					%>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel" style="color: #333;">Xóa</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="color: #333;">
					        Bạn có muốn xóa cuốn sách <strong><%= books.get(i).getName()%></strong> không?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					        <button type="button" class="btn btn-primary" onclick="deleteBook(<%=id%>)">Delete</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- End modal -->
				
					<tr>
						<td> <%= books.get(i).getId()%> </td>
						<td> <%= books.get(i).getName()%> </td>
		            	<td><%=books.get(i).getPublisher()%></td>
		            	<td><%= books.get(i).getPrice()%></td>
		            	<td><button class="btn btn-success" onclick="edit(<%=id%>)">Sửa</button></td>
		            	<td><button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<%=i%>">Xóa</button></td>
		            </tr>
		       
		            <%
						}
					%>
				 </tbody>
			</table>
			<%
				}else if(name == null){
			%>
					<p class="mt-4">Không có thông tin về tên sách bạn tìm kiếm</p>
			<%
			}
			%>
			</div>
			
	</div>
	
	


	<script>
	function edit(Id) {
		location.replace("/ExcerciseT7/view/editbook.jsp?id="+Id);
	}
	function deleteBook(Id) {
		location.replace("/ExcerciseT7/delete-book?id="+Id);
	}
	function logout() {
		<%
		request.getSession().setAttribute("user", null);
		request.getSession().setAttribute("pass", null);
		%>
		location.replace("/ExcerciseT7/check-login");
	}
	</script>
	<style>
		body{
			background: #141E30;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #243B55, #141E30);  
			background: linear-gradient(to right, #243B55, #141E30);
			color: #fff;
		}
	</style>
</body>
</html>