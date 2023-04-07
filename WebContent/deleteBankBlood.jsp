<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import ="java.sql.*" %>
    <%@ page import="controller.BloodBank"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% String getparams = (String) request.getParameter("id"); 
	int id = Integer.parseInt(getparams);
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","");
	 String sql = "DELETE FROM bloodbank WHERE id = "+id;
	 int row;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Statement st = con.createStatement();
	    Statement stmt = con.createStatement();
		row = stmt.executeUpdate(sql);
	   
	    }catch (ClassNotFoundException e){
	    	out.println("Where is your mysql jdbc driver");
	    	e.printStackTrace();
	    	return;
	    	
	    }
	
	if(row>0){
%>
<h1>BlooD Bank Deleted Successfully</h1>
<%} %>

</body>
</html>