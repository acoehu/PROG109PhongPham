<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Editting account</title>
</head>

<body>
	<h1>Account editted</h1>
	<ul>
		<li><p>
				<%
				String username = request.getParameter("username");
            	String name = request.getParameter("name");
            	String DOB = request.getParameter("DOB");
            	out.println(username + " " + name + " " + DOB);
				PhoneGarden run = new PhoneGarden();
				run.edit(username, name, DOB);
					
				%>
			</p>
	</ul>

</body>
</html>