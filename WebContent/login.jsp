<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/book";
try
{ 
	con=DriverManager.getConnection(URL,"root","");
	ps=con.prepareStatement("select * from register where uname=? and mobno=?");
	String  sluname=request.getParameter("luname");
	String  spwd=request.getParameter("pswd");
	ps.setString(1,sluname);
	ps.setString(2,spwd);
	rs=ps.executeQuery();
	if(rs.next())
	{
		 Cookie loginCookie = new Cookie("user",sluname);
	        //setting cookie to expiry in 30 mins
	        loginCookie.setMaxAge(30*60);
	        response.addCookie(loginCookie);
		RequestDispatcher rd=request.getRequestDispatcher("main1.html");
		rd.forward(request,response);
		
	}
	else
	{
		out.println("something wrong");
	}
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