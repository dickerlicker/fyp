<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP airlines</title>
<link rel="stylesheet" href="EAD%20CSS.css">
</head>
<body>
<header id="header">
<p>SP Airlines</p>
<nav id="nav">
            <a href="index.html">Home</a>/
            <a href="Flight.html">Flight Details</a>/
            <a href="Support.html">Support</a>
        </nav>
        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
        </header>

<section id="three" class="wrapper">
<br> Administrator Page </br>
<br>Please select the tables you want to view/edit.<br>
<a href='aircraft.jsp' class="button">Aircraft data</a><a>
<a href='flightschedule.jsp' class="button">Flight schedule</a>
<a href='adminReport.jsp' class="button">View booking report</a>
<a href='index.html#popup1' class="button">Logout</a>
</section>

<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>

        </div>
    </footer>

<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}
%>

</body>
</html>