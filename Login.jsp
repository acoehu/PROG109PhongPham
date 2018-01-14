<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
      <title>Login into your account:</title>
   </head>
   <body>
      
      <form action = "LoginRecord.jsp" method = "POST">
         Username: <input type = "text" name = "username">
         <br />
         Password: <input type = "password" name = "password" />
         <input type = "submit" value = "Login" />
      </form>
      
   </body>
</html>