<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import ="assignment2.*"%>
 <%@page import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passenger Information</title>
<link rel="stylesheet" href="EAD%20CSS.css">
</head>
<body>
<h1> Passenger Information </h1>
<!--
The passenger information webpage will display the current passenger eg. passenger 1 and get the passenger to input
his information such as title,name,passport number,email and contact number. After the first passenger is done,
the next passenger eg. passenger 2 will then proceed to input his information.

This values will then be stored into a bookings table and then they will then be redirected into a payment page. 
 -->
<%
int count = (int) session.getAttribute("count");
int an = (int) session.getAttribute("an");
ArrayList<bookingfirst> bf = (ArrayList<bookingfirst>)session.getAttribute("booktrip");
int i;
if(count == 1){
	for(i=1;i<=an; i++){
%>
	<h2> Passenger <%=i %></h2>
	<form action="passengerInfoServlet" method="post">
		Title: <select name="title">
			<option value="Mr">Mr</option>
			<option value="Ms">Ms</option>
			<option value="Dr">Dr</option>
		</select><br>
		Name: <input type="text" name="name<%=i%>" required><br>
		Passport number: <input type="text" name="passportNo<%=i%>" required><br>
		Email: <input type="email" name="email<%=i%>" required placeholder="Enter a valid email address"><br>
		Contact number: <input type="text" name="contactNo<%=i%>" required><br>
		<input type="hidden" name="an" value="<%=an %>">

<%
	}
%>
		<input type="submit" value="submit">
	</form>
<%
}
else if (count == 2){
	
}

else{
out.print("error");
}
%>
</html>