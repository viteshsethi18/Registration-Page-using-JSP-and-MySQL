<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String paswd = request.getParameter("paswd");
if (!(paswd == null || paswd.isEmpty())) {

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "jsp";
String userId = "root";
String password = "12345";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();

String sql = "INSERT INTO registration (name,email,paswd) VALUES('"+ name + "','" + email + "','" + paswd + "')";
int flage = statement.executeUpdate(sql);

} catch (Exception e) {
e.printStackTrace();
}
}
%>
<html>
<head>
<head>
<title>jsp</title>
</head>
<form method="post" action="Registration.jsp">
<table>
<tr>
<td>name</td>
<td><input type=text name="name" size="35" /></td>
</tr>
<tr>
<td>email</td>
<td><input type="text" name="email" size="35" /></td>
</tr> 
<tr>
<td>paswd</td>
<td><input type="password" name="paswd" size="35" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="insert" value="Save"></td>
</tr>
</table> 
</form>
</html>