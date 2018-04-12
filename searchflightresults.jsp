<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="java.sql.*"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="EAD%20CSS.css">
</head>
<body>

<header id="header">
        <p>SP Airlines</p>
        <a href="admin.jsp" class="button" id="UpdateEditDatabase">Back to Admin Page</a>
        <nav id="nav">
            <a href="index.html">Home</a>/
            <a href="Flight.html">Flight Details</a>/
            <a href="Support.html">Support</a>
        </nav>
        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
    </header>

<article class="searchflight">
<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}
int fsID;
String aID;
int eC;
int bC;
int fC;
String oA;
String dA;
String country;
Date dtD;
Date dtA;
String tD;
String tA;
String FlightscheduleID=request.getParameter("flightscheduleID");
String Search=request.getParameter("search");
String Originairport=request.getParameter("originairport");
String Destinationairport=request.getParameter("destinationairport");
String Countrydestination=request.getParameter("countrydestination");
String Dateofdeparture=request.getParameter("dateofdeparture");
String Dateofarrival=request.getParameter("dateofarrival");
    try {

          // Step1: Load JDBC Driver
           Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false"; 

          // Step 3: Establish connection to URL
          Connection conn = DriverManager.getConnection(connURL);
          // Step 4: Create Statement object
          Statement stmt = conn.createStatement();

          // Step 5: Execute SQL Command
          String sqlStr = "SELECT * FROM assignment1.flightschedule WHERE aircraftID='"+Search+"' OR flightscheduleID LIKE '"+FlightscheduleID+"' OR originAirport LIKE '"+Originairport+"' OR destinationAirport LIKE '"+Destinationairport+"' OR country LIKE '"+Countrydestination+"' OR dateofDeparture LIKE '"+Dateofdeparture+"' OR dateofArrival LIKE '"+Dateofarrival+"';";
          ResultSet rs = stmt.executeQuery(sqlStr);

       // Step 6: Process Result
          out.print("<table border = 1>");
          out.print("<tr><td> Flight schedule ID </td><td> Aircraft ID </td><td> Economy cost </td><td> Business class cost </td><td> First class cost </td><td> Origin airport</td><td> Destination airport</td><td> Country </td><td> Date of departure </td><td> Time of departure </td><td> Date of arrival</td><td> Time of arrival</td><td>Options</td><td></td></tr>");
          while (rs.next()) {
              fsID = rs.getInt("flightscheduleID");
              aID = rs.getString("aircraftID");
              eC = rs.getInt("economyCost");
              bC = rs.getInt("businessclassCost");
              fC = rs.getInt("firstclassCost");
              oA = rs.getString("originAirport");
              dA = rs.getString("destinationAirport");
              country = rs.getString("country");
              dtD = rs.getDate("dateofDeparture");
              dtA = rs.getDate("dateofArrival");
              tD = rs.getString("timeofDeparture");
              tA = rs.getString("timeofArrival");

              out.print ("<tr><td>" + fsID + "</td><td>" +aID+ "</td><td>" + eC + "</td><td>" + bC + "</td><td>"+fC+"</td><td>"+oA+"</td><td>"+dA+"</td><td>"+country+"</td><td>"+dtD+"</td><td>"+tD+"</td><td>"+dtA+"</td><td>"+tA+"</td><td><a href='updateFlight.jsp?fsID="+fsID+"&acID="+aID+"&eC="+eC+"&bC="+bC+"&fC="+fC+"&oA="+oA+"&dA="+dA+"&country="+country+"&dtD="+dtD+"&dtA="+dtA+"&tD="+tD+"&tA="+tA+"'> Update</a></td><td><a href='delete.jsp?msg=flightdel&flightID="+fsID+"'> X </a></td></tr>");} 
          out.print("</table>");
          
          // Step 7: Close connection
          conn.close();
     } catch (Exception e) {
        System.err.println("Error :" + e);
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