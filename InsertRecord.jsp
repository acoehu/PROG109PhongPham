<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Activating account</title>
</head>

<body>
	<h1></h1>
	<ul>
		<li>
				<%
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String email = request.getParameter("email");
					String name = request.getParameter("name");
					String DOB = request.getParameter("DOB");
					password = new String(JbdcFile.encrypt(password));
					PhoneGarden run = new PhoneGarden();
					if (!run.existUser(username)) {
						run.insertUser(username, password, email, name, DOB);
					}
				%>
					
			
	</ul>

</body>
</html>