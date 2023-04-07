<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import ="java.sql.*" %>
    <%@ page import="controller.BloodBank"%>
<!DOCTYPE HTML>
<html>

<head>
  <title>Blood Bank of Blood  Donation System</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<% String getparams = (String) request.getParameter("id"); 
	int id = Integer.parseInt(getparams);
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","");
	 ResultSet rs;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Statement st = con.createStatement();
	    
	    rs = st.executeQuery("SELECT * FROM bloodbank WHERE id = "+id);
	    }catch (ClassNotFoundException e){
	    	out.println("Where is your mysql jdbc driver");
	    	e.printStackTrace();
	    	return;
	    	
	    }
	   String bloodBankName="";
	   String hospital="";
	   String address="";
	   String contact="";
	   String email="";
	   String website="";
	   String regDate="";
	   
	while(rs.next()){
		bloodBankName=rs.getString(2);
		hospital=rs.getString(3);
		address=rs.getString(4);
		contact=rs.getString(5);
		email=rs.getString(6);
		website=rs.getString(7);
		regDate=rs.getString(8);
	}
	BloodBank bd = new BloodBank(bloodBankName,hospital,address,contact,email,website);
	request.setAttribute("bloodBank", bd);
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
       <h1>Blood Bank Addition Page</h1>
		
		 <form method="post" action=BloodBankEdit.jsp>
		 			<input type="text" name="id" hidden required value=<%= id %>>
		 			<input type="text" name="regDate" hidden required value=<%= regDate %>>
                  Blood Bank Name:<br>
                  <input type="text" name="bankname" required value=<%= bd.getBloodBankName() %>>
                  <br>
				  Hospital:<br>
                  <input type="text" name="hospital" required value=<%= hospital%>>
                  <br>
				  Address:<br>
                  <input type="text" name="address" required value=<%= address%>>
                  <br>
				  Contact No:<br>
                  <input type="text" name="contact" required value=<%=contact %>>
                  <br>
				  Email:<br>
                  <input type="text" name="email" required value=<%=email %>>
                  <br>
				  Website:<br>
                  <input type="text" name="website" required value=<%=website %>>
                  
                  <br><br>
                  <input type="submit" value="Submit">
                  </form> 
				  
      </div>
    </div>
    <div id="content_footer"></div>
    <div id="footer">
      <p>Copyright &copy;  The Matrix | <a href="index.jsp">Blood  Donation System</a></p>
    </div>
  </div>
</body>
</html>