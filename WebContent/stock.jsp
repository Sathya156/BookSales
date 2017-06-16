<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Details</title>
<style type="text/css">
th {
    background-color: yellow;
    color: black;
}
td {
    background-color:black;
    color: yellow;
}
</style>
</head>
<body background="C:\Users\SATHYA PRAVEEN\Desktop\website\images\bg3.jpg">
<%
Connection conn=null;
Statement st=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/book";
try
{ 
	conn=DriverManager.getConnection(URL,"root","");
	st=conn.createStatement();
	rs=st.executeQuery("select *from books");
	%><table border="5"><tr><th>Book</th><th>Stock</th></tr><%	
			while(rs.next())
			{%><tr>
			<td><% out.println(rs.getString(1));%></td>	
			<td><%out.println(rs.getString(3));%></td>
			</tr><%
			}
		   %> </table><%
		}
catch(Exception e)
{
	out.println(e);
}	
%>
</body>
</html>