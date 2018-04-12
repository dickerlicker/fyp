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

<article class="searchairplane">
<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}
int aircraftid;
String model;
String flightno;
int flightcap;
String imgpath;
String Search=request.getParameter("search");
String SelectAircraft=request.getParameter("selectaircraft");
String Searchflightnumber=request.getParameter("searchflightnumber");
String Searchflightcapacity=request.getParameter("searchflightcapacity");

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
          String sqlStr = "SELECT * FROM assignment1.aircraft WHERE aircraftID LIKE '"+Search+"' OR aircraft_model LIKE '"+SelectAircraft+"' OR flight_number LIKE '"+Searchflightnumber+"' OR flight_capacity LIKE '"+Searchflightcapacity+"';";
          ResultSet rs = stmt.executeQuery(sqlStr);

          // Step 6: Process Result
          out.print("<table border = 1>");
          out.print("<tr><td> Aircraft ID </td><td> Aircraft model </td><td> Flight number </td> <td>Flight capacity</td><td> Image path </td><td>Options</td><td></td></tr>");
          while (rs.next()) {
              aircraftid = rs.getInt("aircraftID");
              model = rs.getString("aircraft_model");
              flightno = rs.getString("flight_number");
              flightcap = rs.getInt("flight_capacity");
              imgpath = rs.getString("imagepath");
              out.print ("<tr><td>" + aircraftid + "</td><td>" +model + "</td><td>" + flightno + "</td><td>" + flightcap + "</td><td>"+imgpath+"</td><td><a href='updateAircraft.jsp?acID="+aircraftid+"&mdl="+model+"&fN="+flightno+"&fC="+flightcap+"&iP="+imgpath+"'> Update</a></td><td><a href='delete.jsp?msg=aircraftdel&acID="+aircraftid+"'> X</a></td></tr>");
              } out.print ("</table>");
          
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