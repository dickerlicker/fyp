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

<article class="updatetheflight">
<%
    String fsID = request.getParameter("fsID");
    String acID = request.getParameter("acID");
    String eC = request.getParameter("eC");
    String bC = request.getParameter("bC");
    String fC = request.getParameter("fC");
    String oA = request.getParameter("oA");
    String dA = request.getParameter("dA");
    String country = request.getParameter("country");
    String tD = request.getParameter("tD");
    String tA = request.getParameter("tA");
    String dtD = request.getParameter("dtD");
    String dtA = request.getParameter("dtA");
%>
<%@page import ="java.sql.*"%>
<% 
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
          String sqlStr = "SELECT * FROM assignment1.aircraft;";
          ResultSet rs = stmt.executeQuery(sqlStr);

// Step 6: Process Result

          %><form action="updateFlightDatabase.jsp" class="UpdateFlightform">

            Flight schedule ID:<input type="text" name="fsID" value="<%=fsID %>" readonly="readonly"><br>
            Aircraft ID:<select name="acID">
            <option value ="<%=acID%>"selected><%=acID %></option>
                  <%  while(rs.next()){ %>
                        <option value="<%=acID%>"><%= rs.getInt("aircraftID") %></option>
                    <% } %>

            </select><br>
            Economy cost:<input type="text" name="eC" value="<%=eC%>" ><br>
            Business class cost:<input type="text" name="bC" value="<%=bC%>"><br>
            First class cost:<input type="text" name="fC" value="<%=fC%>"><br>
            Origin airport:<input type="text" name ="oA" value="<%=oA%>"><br>
            Destination airport:<input type="text" name ="dA" value="<%=dA%>"><br>
            Country:<input type="text" name ="country" value="<%=country%>"><br>
            Date of departure:<input type="text" name ="dtD" value="<%=dtD%>"><br>
            Time of departure:<input type="text" name ="tD" value="<%=tD%>"><br>
            Date of arrival:<input type="text" name ="dtA" value="<%=dtA%>"><br>
            Time of departure:<input type="text" name ="tA" value="<%=tA%>"><br><br>
            <input type="submit" name="btnSubmit" value="submit"/>
</form><br><%
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