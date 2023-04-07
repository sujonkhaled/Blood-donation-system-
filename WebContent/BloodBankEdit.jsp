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
	int id = Integer.parseInt((String)request.getParameter("id"));
String regDate = (String) request.getParameter("regDate");
	String bankname = (String)request.getParameter("bankname");
	String hospital = (String)request.getParameter("hospital");
	String address = (String)request.getParameter("address");
	String contact = (String)request.getParameter("contact");
	String email = (String)request.getParameter("email");
	String website = (String)request.getParameter("website");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","");
	 ResultSet rs;
	 int row;
	String query = "UPDATE bloodbank set id="+id+
    		"bank_name= "+bankname+"hospital= "+hospital
    		+"address= "+address+"contact= "+contact+
    		"email= "+email+"website= "+website+"regDate= "+regDate+"WHERE id="+id;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Statement st = con.createStatement();
	    PreparedStatement update = con.prepareStatement
	   ("UPDATE bloodbank SET bank_name = ?, hospital = ?, address = ?, contact = ?, email = ?, website = ?, regDate = ? WHERE id = ?");
	    //Statement stmt = con.createStatement();
	    //row = st.executeUpdate(query);
	    update.setInt(8, id);
	    update.setString(1, bankname);
	    update.setString(2, hospital);
	    update.setString(3,address);
	    update.setString(4,contact);
	    update.setString(5,email);
	    update.setString(6,website);
	    update.setString(7,regDate);
	    
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