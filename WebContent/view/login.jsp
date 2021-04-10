<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <h1>Đăng nhập vào hệ thống</h1>
      <form action="/ExcerciseT7/check-login" method="post">
      	<table>
      	<tr>
      	<td>UserName:</td>
      	<td><input type="text" name="username"></td>
      	</tr>
      	<tr>
      	<td>Password:</td>
      	<td><input type="password" name="password"></td>
      	</tr>
      	<tr><td><input type="submit" value="Submit"></td></tr>
      	</table>
      </form>
</body>
</html>