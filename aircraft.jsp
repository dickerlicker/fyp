<%@page import ="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SP Airlines</title> 
	<link rel="stylesheet" href="EAD%20CSS.css">
</head>
<body>
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
    
    <form action="searchresults.jsp" class="searchform">
                        Search Aircraft ID: <input type="text" name="search" />
                        Search Aircraft Model<select name="selectaircraft">

<option value="-1">-Select Aircraft-</option>

<option value="Boeing 777">Boeing 777</option>

<option value="Boeing 747">Boeing 747</option>

<option value="Airbus 360">Airbus 360</option>

<option value="Airbus 330">Airbus 330</option>
</select>

                        Search Flight Number: <input type="text" name="searchflightnumber" />
                        Search Flight Capacity: <input type="text" name="searchflightcapacity" />                        
                        <input type="submit" value="Search" class="searchResults"/>
                    </form>

    
    <article class="AircraftTable">
<h1>Aircraft data</h1>

<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}

String msg = request.getParameter("msg");
String count = request.getParameter("count");
if (msg!=null && msg.equals("fail")){
    out.print("<br>Please enter a valid entry for all fields");
}
if (msg!=null && msg.equals("success")){
    out.print("Your entry has been recorded<br>");
    }
%>

<%
    int aircraftid;
    String model;
    String flightno;
    int flightcap;
    String imgpath;
    try {

          // Step1: Load JDBC Driver
           Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/assignment1?user=root&password=12345678&useSSL=false"; 
          String storeProc = "{call db1.new_procedure(?)}";
          // Step 3: Establish connection to URL
          Connection conn = DriverManager.getConnection(connURL);
          // Step 4: Create Statement object
          Statement stmt = conn.createStatement();

          // Step 5: Execute SQL Command
          String sqlStr = "SELECT * FROM aircraft ";
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
<br>
</article>

<form action="createAircraft.jsp" class="aircraftform">
    Aircraft Model:<input type="text" name="aircraftmodel"><br>
    Flight Number: <input type="text" name="flightnumber"><br>
    Flight Capacity: <input type="text" name="flightcapacity"><br>
    Image path: <input type="text" name ="imagepath"><br><br>
    <input type="submit" name="btnSubmit" value="submit"/>
</form><br>

<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>

        </div>
</footer>

</body>
</html>
