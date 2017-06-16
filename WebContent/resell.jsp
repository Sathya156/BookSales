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
Connection con=null;			//For creating coonection between html and sql the variable con is used
Statement ps=null;				//For creating query statement that must be executed
ResultSet rs=null;				// For Storing the result of the query
Class.forName("com.mysql.jdbc.Driver");	//default line
String URL="jdbc:mysql://localhost:3306/book";//default line but database must be changed
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
	con=DriverManager.getConnection(URL,"root","");//url string is included,root is the username of the dastabase and abcd is the password.
	ps=con.createStatement();//default line to create statement
	String  sdob=request.getParameter("book");// to get value from form.
	ps.executeUpdate("delete from cbookdetails where uname='"+userName+"'and book='"+sdob+"';");//query for execution. executeupdate() for insert and delete and update;;; executequery() for selecting from the database.//ignore the error.
	response.sendRedirect("resell.html");//rediection o next page"resell.html"
}
catch(Exception e)
{
	out.println(e);
}	
%>
</body>
</html>