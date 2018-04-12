<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"%>
    <%@page import ="java.util.*,assignment2.*"%>
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
	
	<article class="publicsearch">
<% 

	ArrayList<FlightSchedules> al = (ArrayList<FlightSchedules>)request.getAttribute("searchitems");
	session.setAttribute("al",al);
	if(al!=null){
		out.print("<table border = 1>");
        out.print("<tr><td>Flight Number</td><td>Country of origin</td><td> Country destination</td><td> Date of departure  </td><td> Time of flight</td><td> Date of arrival</td><td> Time of arrival</td><td> Flight duration</td><td> Cost</td><td> Book Now </td></tr>");
		  for(FlightSchedules flight: al){
			  String od = flight.getOriginCountry();
			  String cd = flight.getDestinationCountry();
			  String dod = flight.getDateOfDeparture();
			  String dt = flight.getTimeOfDeparture();
			  String doa = flight.getDateOfArrival();
			  String at = flight.getTimeOfArrival();
			  String fd = flight.getFlightDuration();
			  String fn = flight.getFlightNumber();
			  String fid = flight.getFlightID();
			  int Economy = flight.getEconomyCost();
			  int Business = flight.getBusinessClassCost();
			  int FirstClass = flight.getFirstClassCost();
			  int an = Integer.parseInt(request.getParameter("adultnumber"));
			  String sc = (String) request.getAttribute("sc");
			  String ftype = request.getParameter("group1");

			  if ((sc.equals("economy_capacity")) && (fn != "false")){
				  out.print("<tr><td>"+fn+"</td><td>"+od+"</td><td>"+cd+"</td><td>"+dod+"</td><td>"+dt+"</td><td>"+doa+"</td><td>"+at+"</td><td>"+fd+"</td><td>"+"$"+Economy*an+"</td><td><a href='bookTripServlet?fID="+fid+"&an="+an+"&sc="+sc+"&ftype="+ftype+"&cost="+(Economy*an)+"'> Book</a></td></tr>" );
			  }
			  if ((sc.equals("business_capacity")) && (fn!="false")){
				  out.print("<table border = 1>");
		          out.print("<tr><td><Flight Number</td><td>Country of origin</td><td> Country destination</td><td> Date of departure  </td><td> Time of flight</td><td> Date of arrival</td><td> Time of arrival</td><td> Flight duration</td><td> Cost</td><td> Book Now </td></tr>");
				  out.print("<tr><td>"+fn+"</td><td>"+od+"</td><td>"+cd+"</td><td>"+dod+"</td><td>"+dt+"</td><td>"+doa+"</td><td>"+at+"</td><td>"+fd+"</td><td>"+"$"+Business*an+"</td><td><a href='bookTripServlet?fID="+fid+"&an="+an+"&sc="+sc+"&ftype="+ftype+"&cost="+(Business*an)+"'> Book</a></td></tr>" );
				  out.print("</table>");
			  }
			  if ((sc.equals("firstclass_capacity")) && (fn!="false")){
				  out.print("<table border = 1>");
		          out.print("<tr><td><Flight Number</td><td>Country of origin</td><td> Country destination</td><td> Date of departure  </td><td> Time of flight</td><td> Date of arrival</td><td> Time of arrival</td><td> Flight duration</td><td> Cost</td><td> Book Now </td></tr>");
				  out.print("<tr><td>"+fn+"</td><td>"+od+"</td><td>"+cd+"</td><td>"+dod+"</td><td>"+dt+"</td><td>"+doa+"</td><td>"+at+"</td><td>"+fd+"</td><td>"+"$"+FirstClass*an+"</td><td><a href='bookTripServlet?fID="+fid+"&an="+an+"&sc="+sc+"&ftype="+ftype+"&cost="+(FirstClass*an)+"'> Book</a></td></tr>" );
				  out.print("</table>");
			  }
			  
		  }
		  out.print("</table>");
	} else{
		out.print("error");
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
