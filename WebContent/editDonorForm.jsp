<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import ="java.sql.*" %>
    <%@ page import="controller.BloodBank"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>   Blood Donation system </title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","");
ResultSet rs;
try{
   Class.forName("com.mysql.jdbc.Driver");
   Statement st = con.createStatement();
   
   rs = st.executeQuery("SELECT * FROM donor WHERE id = "+id);
   }catch (ClassNotFoundException e){
   	out.println("Where is your mysql jdbc driver");
   	e.printStackTrace();
   	return;
   	
   }
  String userName="";
  String dob="";
  String age="";
  String bloodGrp="";
  String address="";
  String mobile="";
  String email="";
  String gender = "";
  String regDate="";
while(rs.next()){
	userName=rs.getString(1);
	dob=rs.getString(2);
	age=rs.getString(3);
	bloodGrp=rs.getString(4);
	address=rs.getString(5);
	mobile=rs.getString(6);
	email=rs.getString(7);
	gender=rs.getString(8);
	regDate=rs.getString(9);
}
%>
<div id="main">
    
    <div id="content_header"></div>
    <div id="site_content">
      <div id="banner"></div>
	  <div id="sidebar_container">
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <!-- insert your sidebar items here -->
           <h3>Latest News</h3>
            <h4>Update blood camp</h4>
            <h5>February  9, 2023</h5>
            <p>For the purpose of Presentation of internet programming at 12 february <br /><a href="#">Read more</a></p>
          </div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Useful Links</h3>
            <ul>
              <li><a href="#">link 1</a></li>
              <li><a href="#">link 2</a></li>
              <li><a href="#">link 3</a></li>
              <li><a href="#">link 4</a></li>
            </ul>
          </div>
          <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div>
          <div class="sidebar_item">
            <h3>Search</h3>
            <form method="post" action="#" id="search_form">
              <p>
                <input class="search" type="text" name="search_field" value="Enter keywords....." />
                <input name="search" type="image" style="border: 0; margin: 0 0 -9px 5px;" src="../image//search.png" alt="Search" title="Search" />
              </p>
            </form>
          </div>
          <div class="sidebar_base"></div>
        </div>
      </div>
      <div id="content">
       <h1>Donor Edit Form</h1>
		
		 <form method="post" action=editDonor.jsp>
		 			<input type="text" name="id" hidden required value=<%=id %>>
		 			<input type="text" name="regDate" hidden required value=<%=regDate %>>
                     
                   User name  :<br>
                  <input type="text" name="user_name" required value=<%=userName %>>
                  <br>  
                      Date of birth :<br>
                  <input type="text" name="date_of_birth" required value=<%=dob %>>
                  <br>
                     
                     
                     Age :<br>
                  <input type="text" name="age" required value=<%=age %>>
                  <br>
                  
                  Blood group:<br>
                  <input type="text" name="blood_group" required value=<%=bloodGrp%>>
                  <br>
				 
				  Address:<br>
                  <input type="text" name="address" required value=<%=address %>>
                  <br>
				  Mobile No:<br>
                  <input type="text" name="mobile_no" required value=<%=mobile %>>
                  <br>
				  Email:<br>
                  <input type="text" name="email" required value=<%=email %>>
                  <br>
				  Gender:<br>
                  <input type="text" name="gender" required value=<%=gender %>>
                  <br>
                 
                  <br><br>
                  <input type="submit" value="Submit">
                  </form> 
				  
      </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
      <p>Copyright &copy; The matrix  | <a href="index.jsp">Blood Donation System</a></p>
    </div>
  </div>
</body>
</html>