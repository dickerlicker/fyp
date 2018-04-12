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
String fsID = request.getParameter("fsID");
String acID = request.getParameter("acID");
String eC = request.getParameter("eC");
String bC = request.getParameter("bC");
String fC = request.getParameter("fC");
String oA = request.getParameter("oA");
String dA = request.getParameter("dA");
String country = request.getParameter("country");
String dtD = request.getParameter("dtD");
String tD = request.getParameter("tD");
String dtA = request.getParameter("dtA");
String tA = request.getParameter("tA");
%>

 <%
 try{
     String updtstr = "UPDATE assignment1.flightschedule SET aircraftID='"+acID+"', economyCost='"+eC+"', businessclassCost='"+bC+"', firstclassCost='"+fC+"', originAirport='"+oA+"', destinationAirport='"+dA+"', country='"+country+"', dateofDeparture='"+dtD+"', dateofArrival='"+dtA+"', timeofDeparture='"+tD+"', timeofArrival='"+tA+"' WHERE flightscheduleID='"+fsID+"';";
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
    response.sendRedirect("flightschedule.jsp?update=Success&msg1="+count+"");
     // STEP 7
    conn.close(); 
}catch (Exception e) {
       System.err.println("Error :" + e);
    }

%>

</body>
</html>