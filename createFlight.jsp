<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import ="java.sql.*"%>
<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}
String acID = request.getParameter("acID");
String eC = request.getParameter("eC");
String bC = request.getParameter("bC");
String fC = request.getParameter("fC");
String oA = request.getParameter("oA");
String dA = request.getParameter("dA");
String country = request.getParameter("country");
String dtD = request.getParameter("dtD");
String dtA = request.getParameter("dtA");
%>
<%
try {
	String insertstr = "INSERT INTO `assignment1`.`flightschedule` (`aircraftID`, `economyCost`, `businessclassCost`, `firstclassCost`, `originAirport`, `destinationAirport`, `country`, `dateandtimeofDeparture`, `dateandtimeofArrival`) VALUES ('"+acID+"', '"+eC+"', '"+bC+"', '"+fC+"', '"+oA+"', '"+dA+"', '"+country+"', '"+dtD+"', '"+dtA+"')";
	Class.forName("com.mysql.jdbc.Driver");
	String connURL = "jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false";
	Connection conn = DriverManager.getConnection(connURL);
	PreparedStatement pstmt = conn.prepareStatement(insertstr);
	int count = pstmt.executeUpdate(insertstr);
    if (count>0){
    	response.sendRedirect("flightschedule.jsp?msg=success");
    	response.sendRedirect("flightschedule.jsp?count");
    }
	conn.close();
} catch (Exception e) {
   System.err.println("Error :" + e);
}

%>


</body>
</html>