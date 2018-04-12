<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="assignment2.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="EAD%20CSS.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
<link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
</head>
<body>

<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}
%>

<header id="header">
        <p>SP Airlines</p>
		<a href="admin.jsp" class="button" id="EditDatabase">Back to Admin Page</a>
        <nav id="nav">
            <a href="index.html">Home</a>/
            <a href="Flight.html">Flight Details</a>/
            <a href="Support.html">Support</a>
        </nav>
        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
    </header>

<form action="AdminReportServlet" class="publicsearchform" method="post">

		Search Flight Schedule ID: <input type="text" name="flightscheduleID" />
		
		<br>Select Class<select name="seatclass">
		<option value="Economy">Economy Class</option>
		<option value="Business">Business Class</option>
		<option value="FirstClass">First Class</option>
		</select>
		
		<br>

	<input type="submit" name="btnSubmit" value="View Report"/>
	
</form>

<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>
        </div>
        
</footer>

</body>
</html>