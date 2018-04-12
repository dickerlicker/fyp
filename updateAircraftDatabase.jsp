updateAircraftDatabase.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<% 
String acID = request.getParameter("aircraftid");
String mdl = request.getParameter("aircraftmodel");
String fN = request.getParameter("flightnumber");
String fC = request.getParameter("flightcapacity");
String iP = request.getParameter("imagepath");
%>
 <%
 try{
    String updtstr = "UPDATE assignment1.aircraft SET aircraft_model='"+mdl+"', flight_number='"+fN+"', flight_capacity='"+fC+"', imagepath='"+iP+"' WHERE aircraftID='"+acID+"';";
     // Step1: Load JDBC Driver
     Class.forName("com.mysql.jdbc.Driver");
  // Step 2: Define Connection URL
     String connURL ="jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false"; 

     // Step 3: Establish connection to URL
     Connection conn = DriverManager.getConnection(connURL);

    Statement stmt = conn.createStatement();
     // STEP 5
    int count = stmt.executeUpdate(updtstr);
     // STEP 6
    if (count > 0)
    response.sendRedirect("aircraft.jsp?count="+count+"");
     // STEP 7
    conn.close(); 
}catch (Exception e) {
       System.err.println("Error :" + e);
    }

%>