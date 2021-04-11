<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel='stylesheet' type='text/css' href='view/login.css'>
</head>
<body>
	<div class="login"> 
	  <form action="/ExcerciseT7/check-login" method="post">
    	<h1>Login</h1>
		<input type="text" name="username" placeholder="Username" required="required" />
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Let me in.</button>
      </form>
	</div>
</body>
</html>
