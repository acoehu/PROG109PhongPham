<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="JDBC.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Getting data</title>
</head>

<body>
	
	<ul>
		<li><p>
				<%
					String username = request.getParameter("username");
					
					PhoneGarden run = new PhoneGarden();
					if (!run.existUser(username)) {
						out.println("Wrong username!");
					}
					else {
						List<String> list = new LinkedList<>();
						list = run.get(username);
						for(String k: list) {
							out.println(k);
							out.println();
						}
					}
				%>
			</p>
			
	</ul>
	Edit info if required: 
	<form action = "EditRecord.jsp" method = "GET">
		<input type="hidden" name="username" value="<%
			out.print(request.getParameter("username"));
		%>"> <br> <br>
         Enter your name: <input type = "text" name = "name"><br><br>
         Enter your email: <input type = "text" name = "email"><br><br>
         Enter your DOB(MM/DD/YY): <input type = "text" name = "DOB" /><br><br>
         <input type = "submit" value = "Edit" />
      </form>

</body>
</html>