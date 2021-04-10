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
</head>
<body>
	<%boolean c = Boolean.valueOf((String)request.getAttribute("information-update-succees"));
	if(c) {
		%>
		<h5 style="color: red">Cập nhật thông tin thành công</h5>
		<%
	}
	%>
	<h3>Tìm kiếm thông tin sách</h3>
	<form action="/ExcerciseT7/check-find" method="post">
		<input type="search" name="search"> 
		<input type="submit" value="search">
	</form>
	
	<%
	String name = String.valueOf(request.getAttribute("name1"));
	List<Book> books = (ArrayList<Book>)request.getAttribute("books");
	%>
	<%
		if(books != null) {
			%>
			<h1>Kết quả tìm kiếm sách cho từ khóa " <%=name %> "</h1>
			<table> <tr><th>Id</th><th>Name</th><th>Publisher</th><th>Price</th><th>Sửa</th><th>Xóa</th></tr>
			<%
				for(int i = 0; i < books.size(); i++) {
					%>
					<tr><td> <%= books.get(i).getId()%></td><td> <%= books.get(i).getName()%>
		            </td><td><%=books.get(i).getPublisher()%></td><td><%= books.get(i).getPrice()%>
		            </td><td><button id="<%=books.get(i).getId()%>" onclick="edit(this.id)">Sửa</button></td>
		            <td><button>Xóa</button></td></tr>
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
	</script>
</body>
</html>