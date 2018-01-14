<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
      <title>Please create an account:</title>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
     	function checkExist() {
     		
     		var name = document.getElementById("username").value;
     		
     		
     		if (name) {
     			$.ajax({
     				type: 'post',
     				url: 'exist.jsp',
     				data: {
     					username: name,
     				},
     				success: function(response) {
     					
     					$("#status").html(response);	
     				},
     				error: function(response) {
     					
     					$("#status").html(response);
     				}
     			});
     		}
     	}
     	$(function(){
     		$( "#spinner" ).spinner();
     	    $("#datepicker").datepicker();
     	   $( "button" ).button();
     	});
    
     </script>
   </head>
   
   <body>
   		<form action="InsertRecord.jsp" onsubmit="return validateForm()" method="post"  name="regF">
                Enter your username:<input type="text" name="username" id = "username" onblur="checkExist()"/><span id="status"></span><br><br>
                Enter your password:<input type="password" name="password"/><br><br>
                Enter your email:<input type="text" name="email"/><br><br>
                Enter your name: <input type = "text" name = "name"><br><br>
                
         		Enter your DOB(MM/DD/YY): <input type = "text" name = "DOB" id = "datepicker" /><br><br>
                <input type="submit" value="Register" /><br>
            </form>
		
		
     
   </body>
</html>