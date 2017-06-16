<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<%
try
{
	String adminname=request.getParameter("adname");//For getting value from FORM with name"adname"
	String passwd=request.getParameter("pass");//For getting value from FORM with name"pass"
	if(adminname.equals("Sathya"))//For checking the string match
	{
		if(passwd.equals("Praveen"))
	{
		RequestDispatcher rd=request.getRequestDispatcher("details.html");//after checking if it is true we should go to "details.html"
		rd.forward(request,response);//default line that must be included
	}
	}
	else
	{
		out.println("something Wrong");
	}
}
catch(Exception e)
{
	out.println(e);
}	
%>
</body>
</html>