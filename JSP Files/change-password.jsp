<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" media="screen" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="CSS/home.css">


	<title>Change Password</title>

	<!--  -->

	<style>

	</style>

</head>

<body>

	<div class="container">
	
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="student-panel.jsp" style="background-color: gray; color: hotpink;"><strong>ONLINE EXAM PORTAL</strong></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item ">
        <a class="nav-link" href="student-panel.jsp">Home </a>
      </li>
       <li class="nav-item ">
        <a class="nav-link" href="generate-test.jsp">Generate Test</a>
      </li>
      <li class="nav-item  ">
        <a class="nav-link" href="view-result.jsp">View Test Results</a>
      </li>
      <li class="nav-item active ">
        <a class="nav-link" href="change-password.jsp">Change Password<span class="sr-only">(current)</span></a>
      </li> 
      
      <form action="StudentLogoutServlet" method="post">
          
           <button type="submit" id="lgtbtn" >Logout</button>
      </form>
   
      </ul>
  </div>
</nav>

	

<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="images/chalk-chalkboard-exam-459793.jpg" class="d-block w-100" alt="..."style=" width:100%; height: 500px !important;">
        <div class="carousel-caption d-none d-md-block">
        <strong>  <h5 style="background-color:darkgray; color:greenyellow;">"Do It Once, Do It Right. Get It Over With!" - Nan, CPA Forum member</h5></strong>
         
        </div>
      </div>
      <div class="carousel-item">
        <img src="images/homework-1735644_1920.png" class="d-block w-100" alt="..."style=" width:100%; height: 500px !important;">
        <div class="carousel-caption d-none d-md-block">
      <strong>      <h5 style="background-color:darkgray; color:greenyellow;;">"To be a good professional engineer, always start to study late for exams. Because it teaches you how to manage time and tackle emergencies." - Bill Gates</h5></strong>
        
        </div>
      </div>
      <div class="carousel-item">
        <img src="images/feedback-3239454_1920.jpg" class="d-block w-100" alt="..."style=" width:100%; height: 500px !important;">
        <div class="carousel-caption d-none d-md-block">
        <strong>    <h5 style="background-color:darkgray;color:greenyellow;"> "There are no secrets to success. It is the result of preparation, hard work learning from failure." - General Colin Powell</h5></strong>
          
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
     
     <div class="container">
         
         
          <strong><center><h1 style="color: red; background-color: gray;">Change Password</h1></center></strong>
         
         
           <%
           if(request.getParameter("change-pass")!=null)
           {
           
           String uname=session.getAttribute("username").toString();
           String oldpass=request.getParameter("oldpass");
           String newpass=request.getParameter("newpass");
           try{
           Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
	        PreparedStatement ps= con.prepareStatement("select * from students where username=? and password=?");
	        ps.setString(1, uname);
			ps.setString(2, oldpass);
			ResultSet res=ps.executeQuery();
			
			if(res.next())
			{
				 Class.forName("com.mysql.jdbc.Driver");
					Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
			        PreparedStatement ps1= con1.prepareStatement("update students set password=? where username=? ");
			        ps1.setString(1, newpass);
					ps1.setString(2, uname);
					ps1.executeUpdate();
		       out.println("<center> <strong> <h2 style='color:red;'>Password Successfully Changed!!! </h2></strong></center>");

			}
		else
			{
				 out.println("<script type=\"text/javascript\">");
	        	   out.println("alert('Old password is incorrect!!!');");
	        	   out.println("window.location='change-password.jsp'");
	        	   out.println("</script>");	
			}
           }
           catch(Exception e)
           {
        	   e.printStackTrace();
           }
           
           }
           %>
           
           
         <br>
    <center>
         <table>
       
        <form action="change-password.jsp" method="post">
 
        
  <tr>
        <td>   
         <strong> Old  Password:  </strong></td><td>  <input type="password" name="oldpass"  id="pass" ></td> 
                   
      </tr>
     
    <tr>
        <td>   
         <strong> New  Password:  </strong></td><td>  <input type="password" name="newpass"  id="pass" ></td> 
                   
      </tr>
</table>      
   </center>   
     
        <br>
        
        <center>
        
         <button type="submit" name="change-pass" class="btn btn-primary" style="font-size:18px;">Change Password</button>
          </form>    
         </center>
   
        
     </div>
     
     <br>
     <br>
     <br>
     <br>
     <br>

      <hr style="height:1px;border:none;color:#333;background-color:#333;" />
     <footer>
         <p><Strong>All Rights Reserved &copy; 2019. <br> Created By @Shivam Dhar</Strong></p>
         
     </footer>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<script>
	</script>

</body>

</html>

      