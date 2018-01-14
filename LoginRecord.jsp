<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login attempt</title>
</head>

<body>
	<h1>Attempting to login..</h1>
	<ul>
		<li><p>
				<%
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					password = new String(JbdcFile.encrypt(password));
					PhoneGarden run = new PhoneGarden();
					if (run.login(username, password, "Account")) {
						out.println("Login sucessfully!");
						session.setAttribute("username", username);
				%>
					<form action = "HomeScreen.jsp" method = "POST">
         				<input type = "submit" value = "Click here to return to homescreen" />
     				 </form>
				<% 	
					} else {
						out.println("Wrong password or username!");
					
				%>
					<form action = "Login.jsp" method = "POST">
         				<input type = "submit" value = "Click here to try again" />
     				 </form>
				
				<%
					}
				%>
			
	</ul>

</body>
</html>