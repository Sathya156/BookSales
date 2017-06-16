<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book </title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
Statement ps1=null;
Statement ps2=null;
ResultSet rs1=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/book";
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("login.html");
try
{ 
	con=DriverManager.getConnection(URL,"root","");
	String  saname=request.getParameter("autobio");
	String message=request.getParameter("phno");
	ps2=con.createStatement();
	rs1=ps2.executeQuery("Select * from books where bookname='"+saname+"';");
	if(rs1.next())
	{
	int Stock=rs1.getInt(3);
	if(Stock>0)
	{
	ps=con.prepareStatement("insert into cbookdetails values (?,?)");
	ps.setString(1,saname);
	ps.setString(2,userName);
	ps.executeUpdate();
	ps1=con.createStatement();
	ps1.executeUpdate("update books set stock=stock-1 where bookname='"+saname+"';");
	out.println("book details added");
	String abc="http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=bhuvangates&password=reccseit&sendername=bhuvan&mobileno="+message+"&message='"+userName+"'! you have bought'"+saname+"' successfully!! Thank you for choosing Bookworms.com!!;";
	response.sendRedirect(abc);
	ps.close();
	con.close();
	}
	else
	{
		out.println("There is no stock left in this book");
	}
	
	}
}	
catch(Exception e)
{
	out.println(e);
}	
%>


</body>
</html>