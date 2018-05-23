<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login page</title>
</head>
<body>

	<form:form action="/login" method="POST">
	
		Email: <input type="text" name="email"> <br>
		Password: <input type="password" name="password"> <br>
		<input type="submit" value="Log In">
		
	</form:form>



</body>
</html>