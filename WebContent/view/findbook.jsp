<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='view/find-format.css'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>
<body>
	<%boolean update = Boolean.valueOf((String)request.getAttribute("information-update-succees"));
	if(update) {
		%>
		<h5 style="color: red">Cập nhật thông tin thành công</h5>
		<%
	}
	%>
	<h3>Tìm kiếm thông tin sách</h3>
	<form action="/ExcerciseT7/check-find" method="post">
		<input type="search" name="search"> 
		<input type="submit" value="search">
		<input type="button" value="Logout" onclick="logout()">
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
				<h1>Kết quả tìm kiếm sách cho từ khóa " <%=name %> "</h1>
				<%
			}
			%>
			<table> <tr><th>Id</th><th>Name</th><th>Publisher</th><th>Price</th><th>Sửa</th><th>Xóa</th></tr>
			<%
				for(int i = 0; i < books.size(); i++) {
					int id = books.get(i).getId();
					%>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Xóa</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        Do you want to delete book <%=books.get(i).getName()%>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					        <button type="button" class="btn btn-primary" onclick="deleteBook(<%=id%>)">Delete</button>
					      </div>
					    </div>
					  </div>
					</div>
					<tr><td> <%= books.get(i).getId()%></td><td> <%= books.get(i).getName()%>
		            </td><td><%=books.get(i).getPublisher()%></td><td><%= books.get(i).getPrice()%>
		            </td><td><button onclick="edit(<%=id%>)">Sửa</button></td>
		            <td><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=i%>">Xóa</button></td></tr>
		            <%
				}
			%>
			</table>
			<%
		}else if(name == null){
			%>
			<h1>Không có thông tin về tên sách bạn tìm kiếm</h1>
			<%
		}
	%>
	


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
		location.replace("/ExcerciseT7/view/login.jsp");
	}
	</script>
</body>
</html>