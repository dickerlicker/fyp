<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
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

<article class="updateaircraft">
<%
    String acID = request.getParameter("acID");
    String mdl = request.getParameter("mdl");
    String fN = request.getParameter("fN");
    String fC = request.getParameter("fC");
    String iP = request.getParameter("iP");
%>
    <form action="updateAircraftDatabase.jsp" class="updateaircraftform">
    <h1>Update Aircraft Database Row</h1>
    Aircraft ID <input type="text" name="aircraftid" value="<%=acID %>" readonly="readonly"><br>
    Aircraft Model <input type="text" name="aircraftmodel" value="<%=mdl%>"><br>
    Flight Number: <input type="text" name="flightnumber" value="<%=fN%>"><br>
    Flight Capacity: <input type="text" name="flightcapacity" value ="<%=fC%>"><br>
    Image path: <input type="text" name ="imagepath" value = "<%=iP%>"><br><br>
    <input type="submit" name="btnSubmit" value="submit"/>
    </form>
</article>    

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
    
    
    <footer id="footer">
        <div class="inner">
            <div class="copyright">
                &copy; SP Airlines 2017 All rights reserved.
            </div>

        </div>
</footer>
</body>
</html>