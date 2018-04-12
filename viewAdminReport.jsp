<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>
    <%@page import ="java.util.*,assignment2.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
<link rel="stylesheet" href="EAD%20CSS.css">
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
	
	<article class="publicsearch">
<% 

	ArrayList<Bookings> al = (ArrayList<Bookings>)request.getAttribute("searchitems");	
out.print("<table border = 1>");
out.print("<tr><td>Booking ID</td><td> Title</td><td> Name</td><td> Email</td><td> Contact No.</td><td> Cost</td><td> Flight Schedule ID 1</td><td> Flight Schedule ID 2</td><td> Cabin Class</td><td> No. Of Passengers</td></tr>");
	if(al!=null){
		  for(Bookings bookings: al){
			  
			  int bookID = bookings.getBookingID();
			  String title = bookings.getTitle();
			  String name = bookings.getName();
			  String email = bookings.getEmail();
			  int contactno = bookings.getContactNo();
			  int cost = bookings.getCost();
			  String fsid1 = bookings.getFlightScheduleID1();
			  String fsid2 = bookings.getFlightScheduleID2();
			  String cabinclass = bookings.getCabinClass();
			  int passengerno = bookings.getNoOfPassengers();

			  out.print("<tr><td>"+bookID+"</td><td>"+title+"</td><td>"+name+"</td><td>"+email+"</td><td>"+contactno+"</td><td>"+cost+"</td><td>"+fsid1+"</td><td>"+fsid2+"</td><td>"+cabinclass+"</td><td>"+passengerno+"</td><tr>" );
			  
		  }
		  
	} else{
		out.print("error");
	}
%>
</article>

<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>

        </div>
</footer>

</body>
</html>