<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd%22%3E
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP airlines</title>
<link rel="stylesheet" href="EAD%20CSS.css">
        <link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
        $(function() {
        		$("#departing").datepicker({
        	dateFormat: 'yy-mm-dd'
        		});
        });
        
        $(function() {
    		$("#returning").datepicker({
    	dateFormat: 'yy-mm-dd'
    		});
    	});
       
        </script>
      
</head>
<body>
<%@page import ="java.sql.*"%>
<header id="header">
        <p>SP Airlines</p>
        <a href="admin.jsp" class="button" id="EditDatabase">Edit Aircraft Database</a>
        <nav id="nav">
            <a href="index.html">Home</a>/
            <a href="Flight.html">Flight Details</a>/
            <a href="Support.html">Support</a>
        </nav>
        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
    </header>

<form action="searchflightresults.jsp" class="searchform">
                        Search Flight Schedule ID: <input type="text" name="flightscheduleID" />
                        Search Aircraft ID: <input type="text" name="search" />
                        Search Airport of Origin<select name="originairport">
		<option value="-1">-Select Airport of Origin-</option>
		<option value="Changi Airport">Changi Airport</option>
		<option value="Frankfurt Airport">Frankfurt Airport</option>
		<option value="Narita International Airport">Narita International Airport</option>
		<option value="Tan Son Nhat Airport">Tan Son Nhat Airport</option>
		<option value="Taoyuan International Airport">Taoyuan International Airport</option>
		<option value="Incheon International Airport">Incheon International Airport</option>
		<option value="Heathrow Airport">Heathrow Airport</option>
		<option value="Melbourne Airport">Melbourne Airport</option>
</select>
					Search Airport of Destination<select name="destinationairport">
		<option value="-1">-Select Airport of destination-</option>
		<option value="Changi Airport">Changi Airport</option>
		<option value="Frankfurt Airport">Frankfurt Airport</option>
		<option value="Narita International Airport">Narita International Airport</option>
		<option value="Tan Son Nhat Airport">Tan Son Nhat Airport</option>
		<option value="Taoyuan International Airport">Taoyuan International Airport</option>
		<option value="Incheon International Airport">Incheon International Airport</option>
		<option value="Heathrow Airport">Heathrow Airport</option>
		<option value="Melbourne Airport">Melbourne Airport</option>
</select>

Search Destination Country<select name="countrydestination">
		<option value="-1">-Select country of destination-</option>
		<option value="Singapore">Singapore</option>
		<option value="Germany">Germany</option>
		<option value="Japan">Japan</option>
		<option value="Vietnam">Vietnam</option>
		<option value="Taiwan">Taiwan</option>
		<option value="South Korea">South Korea</option>
		<option value="England">England</option>
		<option value="Australia">Australia</option>
</select>

Select Date of Departure: <input type="text" name="dateofdeparture" id="departing">
Select Date of Arrival: <input type="text" name="dateofarrival" id="returning">

<input type="submit" value="Search" class="searchResults"/>
                        
                    </form>


<article class="FlightTable">
<h1>Flight data</h1>

<%
String redirect = (String)session.getAttribute("login-status");
if (redirect == null){
	response.sendRedirect("index.html");
}

String msg = request.getParameter("msg");
String count = request.getParameter("count");
String msg1 = request.getParameter("msg1");
String update = request.getParameter("update");
if (msg!=null && msg.equals("fail")){
    out.print("<br>Please enter a valid entry for all fields");
}
else if (msg!=null && msg.equals("success")){
    out.print("Your entry has been recorded<br>");
    }
else if (msg1!=null && update.equals("Success")){
    out.print(msg1+"&nbsp;entry updated<br>");
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
          String sqlStr = "SELECT * FROM assignment1.flightschedule;";
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
          String sqlStr1 = "SELECT aircraftID FROM assignment1.aircraft;";
          ResultSet rs1 = stmt.executeQuery(sqlStr1);
          %>
          </article>
          
          <form action="createFlight.jsp" class="FlightForm">
 Aircraft ID:<select name="acID">
                  <%  while(rs1.next()){ %>
                        <option><%= rs1.getInt("aircraftID")%></option>
                    <% } %>
</select><br>
            Economy cost:<input type="text" name="eC"><br>
            Business class cost:<input type="text" name="bC"><br>
            First class cost:<input type="text" name="fC"><br>
            Origin airport:<input type="text" name ="oA"><br>
            Destination airport:<input type="text" name ="dA"><br>
            Country:<input type="text" name ="country"><br>
            Date of departure:<input type="text" name ="dtD"><br>
            Time of departure:<input type="text" name ="tD"><br>
            Date of Arrival:<input type="text" name ="dtA"><br>
            Time of departure:<input type="text" name="tA"><br><br>
            <input type="submit" name="btnSubmit" value="submit"/>

        </form><br><%
          // Step 7: Close connection
          conn.close();
     } catch (Exception e) {
        System.err.println("Error :" + e);
     }
%>


<footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>

        </div>
</footer>
</body>
</html>