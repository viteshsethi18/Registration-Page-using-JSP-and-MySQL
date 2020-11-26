<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jsp";
String user = "root";
String password = "12345";

String sql = "select name from registration";

try {
Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.prepareStatement(sql);
rs = ps.executeQuery(); 
%>
<form method="post" action="login.jsp">
<center><h2 style="color:green">JSP Login Example</h2></center>
<table border="1" align="center">
<tr>
<td>name :</td>
<td><input type="text" name="name"/></td>
</tr>
<tr>
<td>email :</td>
<td><input type="text" name="email"/></td>
</tr>
<tr>
<td>paswd :</td>
<td><input type="password" name="paswd"/></td>
<%

}
catch(SQLException sqe)
{
out.println("home"+sqe);
}
%>

</tr>
<tr>
<td></td>
<td><input type="submit" value="submit"/></td>
</table>
</form>
</body>
</html>