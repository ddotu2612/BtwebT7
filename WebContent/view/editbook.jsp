<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.Book"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>
<body>
<%
Connection conn = DBConnection.getConnection();
String _id = request.getParameter("id");
String sql = "select * from book where id= " + _id;
Book book=null;
try {
	PreparedStatement preStatement = conn.prepareStatement(sql);
    ResultSet result = preStatement.executeQuery();
	if(result.next()) {
		int id = result.getInt("id");
		String name = result.getString("name");
		String publisher = result.getString("publisher");
		int price = result.getInt("price");
		book = new Book(id, name, publisher, price);
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
	<div class="container mt-4">
		<h3>Sửa thông tin sách: <%=book.getName() %></h3>
		<form action="/ExcerciseT7/update-book?id=<%=book.getId()%>" method="post">
			<div class="mb-3">
  				<label class="form-label">ID</label>
  				<input type="text" class="form-control" name='id' value="<%=book.getId() %>" disabled>
			</div>
			<div class="mb-3">
  				<label class="form-label">Tên sách</label>
  				<input type="text" class="form-control" name='name' value="<%=book.getName() %>">
			</div>
			<div class="mb-3">
  				<label class="form-label">Nhà xuất bản</label>
  				<input type="text" class="form-control" name='publisher' value="<%=book.getPublisher() %>">
			</div>
			<div class="mb-3">
  				<label class="form-label">Giá</label>
  				<input type="text" class="form-control" name='price' value="<%=book.getPrice() %>">
			</div>
			<button type="submit" class="btn btn-primary">Lưu</button>
		</form>
	</div>
	
	<style>
		body{
			background: #141E30;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #243B55, #141E30);  
			background: linear-gradient(to right, #243B55, #141E30);
			color: #fff;
		}
		.form-control{
			width: 40%;
		}
	</style>
</body>
</html>