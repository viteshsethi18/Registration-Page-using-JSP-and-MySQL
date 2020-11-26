<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbEmail;
String userdbPaswd;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jsp";
String user = "root";
String dbpsw = "12345";

String sql = "select * from registration where name=? and email=? and paswd=?";

String name = request.getParameter("name");
String email = request.getParameter("email");
String paswd = request.getParameter("paswd");

if((!(name.equals(null) || name.equals("")) && !(email.equals(null) || email.equals(""))) && !paswd.equals("select"))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, paswd);
rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("name");
userdbEmail = rs.getString("email");
userdbPaswd = rs.getString("paswd");
if(name.equals(userdbName) && email.equals(userdbEmail) && paswd.equals(userdbPaswd))
{
session.setAttribute("name",userdbName);
session.setAttribute("email", userdbEmail); 
response.sendRedirect("welcome.jsp"); 
} 
}
else
response.sendRedirect("error.jsp");
rs.close();
ps.close(); 
}
catch(SQLException sqe)
{
out.println(sqe);
} 
}
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<% 
getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}
%>
</body>
</html>