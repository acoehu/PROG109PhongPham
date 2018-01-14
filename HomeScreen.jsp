<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
      <title>Welcome to the home screen</title>
   </head>
   <h1>Please select your action:</h1>
   <body>
      <%
      	if (session.isNew()) {
      		
      %>
      <form action = "NewRegister.jsp" method = "POST">
         <input type = "submit" value = "Register new account" />
      </form>
      <%
      	}
      	else {

      %>
      <form action = "EditRecord.jsp" method = "POST">
         <input type = "submit" value = "Edit your account" />
      </form>
      <%
      	}
      %>
      <%
      	if (!session.isNew()) {
      		
      %>
      <form action = "Get.jsp" method = "POST">
         <input type = "submit" value = "Find account information" />
      </form>
      
      <%
      	}
      	if (session.isNew()) {
      		
      %>
      <form action = "Login.jsp" method = "POST">
         <input type = "submit" value = "Log in in your account" />
      </form>
      <%
      	}
      	else {

      %>
      <form action = "Logout.jsp" method = "POST">
         <input type = "submit" value = "Logout" />
      </form>
      <%
      	}
      %>
      
      
   </body>
</html>