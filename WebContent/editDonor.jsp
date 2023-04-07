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
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String userName = (String) request.getParameter("user_name");
	String date_of_birth = (String)request.getParameter("date_of_birth");
	String age = (String) request.getParameter("age"); 
	String blood_group = (String)request.getParameter("blood_group");
	String address = (String) request.getParameter("address");
	String mobile_no = (String)request.getParameter("mobile_no");
	String email = (String)request.getParameter("email");
	String gender = (String)request.getParameter("gender");
	String regDate = (String)request.getParameter("regDate");
	
	
	int row=0;
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","");
	ResultSet rs;
	
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Statement st = con.createStatement();
	    PreparedStatement update = con.prepareStatement
	   ("UPDATE donor SET user_name = ?, date_of_birth = ?, age = ?, blood_group = ?, address = ?, mobile_no = ?, email = ?, gender = ?, regdate = ? WHERE id = ?");
	    //Statement stmt = con.createStatement();
	    //row = st.executeUpdate(query);
	    update.setInt(10, id);
	    update.setString(1, userName);
	    update.setString(2, date_of_birth);
	    update.setString(3,age);
	    update.setString(4,blood_group);
	    update.setString(5,address);
	    update.setString(6,mobile_no);
	    update.setString(7,email);
	    update.setString(8,gender);
	    update.setString(9,regDate);
	    
	    row = update.executeUpdate();
	    
	    }catch (ClassNotFoundException e){
	    	out.println("Where is your mysql jdbc driver");
	    	e.printStackTrace();
	    	return;
	    	
	    }
	
%>

<h1><% 

	if(row>0){
%>
	<h1>Updated Successfully</h1>
	<%} %>

</h1>
</body>
</html>