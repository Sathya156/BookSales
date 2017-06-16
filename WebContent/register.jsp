<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/book";
try
{ 
	con=DriverManager.getConnection(URL,"root","");
	ps=con.prepareStatement("insert into register values (?,?,?,?,?,?,?,?,?,?,?)");
	String  sfname=request.getParameter("fname");
	String  slname=request.getParameter("lname");
	String  suname=request.getParameter("uname");
	String  sgender=request.getParameter("gender");
	String  sdob=request.getParameter("dob");
	String  saddress=request.getParameter("address");
	String  spincode=request.getParameter("pincode");
	String  smobno=request.getParameter("mobno");
	String  semail=request.getParameter("email");
	String  sstate=request.getParameter("state");
	String  scity=request.getParameter("city");
	ps.setString(1,sfname);
	ps.setString(2,slname);
	ps.setString(3,suname);
	ps.setString(4,sgender);
	ps.setString(5,sdob);
	ps.setString(6,saddress);
	ps.setString(7,spincode);
	ps.setString(8,smobno);
	ps.setString(9,semail);
	ps.setString(10,scity);
	ps.setString(11,sstate);
	ps.executeUpdate();
	response.sendRedirect("login.html");
	ps.close();
	con.close();
}	
catch(Exception e)
{
	out.println(e);
}	
%>


</body>
</html>