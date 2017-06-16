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
Statement ps=null;
Statement ps1=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/book";
try
{ 
	con=DriverManager.getConnection(URL,"root","");
	ps=con.createStatement();
	String book=request.getParameter("bookname");
	String stock=request.getParameter("noofBooks");
	rs=ps.executeQuery("select * from books where bookname='"+book+"';");
	if(rs.next())
	{
		ps1=con.createStatement();
		ps1.executeUpdate("update books set stock=stock+'"+stock+"'where bookname='"+book+"';");
		response.sendRedirect("addstock.html");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>