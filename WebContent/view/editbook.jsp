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
<link rel='stylesheet' type='text/css' href='view/find-format.css'>
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
<h1>Sửa thông tin sách có id là <%=book.getId() %></h1>
<form action="/ExcerciseT7/update-book?id=<%=book.getId()%>" method="post">
<table>
<tr><td>ID</td><td><input  type='text' name='id' value="<%=book.getId()%>" disabled></td></tr>
<tr><td>Tên sách: </td><td><input type='text' name='name' value="<%=book.getName() %>"></td></tr>
<tr><td>Tên nhà xuất bản: </td><td><input type='text' name='publisher' value="<%=book.getPublisher() %>"></td></tr>
<tr><td>Giá: </td><td><input type='text' name='price' value="<%=book.getPrice() %>"></td></tr>
<tr><td><input type="submit" value='Cập nhật'></td></tr>
</table>
</form>
</body>
</html>