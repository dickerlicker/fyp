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

String aM = request.getParameter("aircraftmodel");
String fN = request.getParameter("flightnumber");
String imgPath = request.getParameter("imagepath");
String fC = request.getParameter("flightcapacity");
%>
<%
try {
	if (aM!=("") && fN!=("") && imgPath!=("")){
	String insertstr = "INSERT INTO `assignment1`.`aircraft` (`aircraft_model`, `flight_number`, `flight_capacity`, `imagepath`) VALUES ('"+aM+"', '"+fN+"', '"+fC+"', '"+imgPath+"')";
	Class.forName("com.mysql.jdbc.Driver");
	String connURL = "jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false";
	Connection conn = DriverManager.getConnection(connURL);
	PreparedStatement pstmt = conn.prepareStatement(insertstr);
	int count = pstmt.executeUpdate(insertstr);
    if (count>0){
    	response.sendRedirect("aircraft.jsp?msg=success");
    	response.sendRedirect("aircraft.jsp?count");
    }
    else{
    	response.sendRedirect("aircraft.jsp?msg=fail");
    }
	conn.close();}
	else { response.sendRedirect("aircraft.jsp?msg=fail");}
} catch (Exception e) {
   System.err.println("Error :" + e);
}

%>


</body>
</html>