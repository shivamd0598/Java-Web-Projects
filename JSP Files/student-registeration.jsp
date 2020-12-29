<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" media="screen" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="CSS/home.css">


	<title>Student Registration</title>

	<!--  -->

	<style>

	</style>

</head>

<body>

	<div class="container">
	
	
	
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="admin-panel.jsp" style="background-color: gray; color: hotpink;"><strong>ONLINE EXAM PORTAL</strong></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item ">
        <a class="nav-link" href="admin-panel.jsp">Home </a>
      </li>
       <li class="nav-item active ">
        <a class="nav-link" href="student-registeration.jsp">Student Registeration<span class="sr-only">(current)</span> </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="view-all-student.jsp">View Students</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="delete-student.jsp">Delete Students </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="add-question.jsp">Add Questions</a>
      </li>
          <li class="nav-item">
        <a class="nav-link" href="delete-question.jsp">Delete Questions</a>
      </li>
            <li class="nav-item ">
        <a class="nav-link" href="modify-details.jsp">Modify Student Details</a>
        </li>
  
             <li class="nav-item">
        <a class="nav-link" href="add-course.jsp">Add Course</a>
        </li>
      
      <form action="AdminLogoutServlet" method="post">
          
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
         
         
          <strong><center><h1 style="color: red; background-color: gray;">STUDENT REGISTERATION FORM</h1></center></strong>
         
         
           <%
    if(request.getAttribute("msg")!=null)
    {
        //out.println(request.getAttribute("msg"));
        String errmsg=request.getAttribute("msg").toString();
        out.println("<h2 style='color:red';>"+errmsg+"</h2>");
        
    }
           
           if(request.getAttribute("msg1")!=null)
           {
               //out.println(request.getAttribute("msg"));
               String succmsg=request.getAttribute("msg1").toString();
               out.println("<h2 style='color:red';>"+succmsg+"</h2>");
               
           }   
           
           
           if(request.getAttribute("msg2")!=null)
           {
               //out.println(request.getAttribute("msg"));
               String gendmsg=request.getAttribute("msg2").toString();
               out.println("<h2 style='color:red';>"+gendmsg+"</h2>");
               
           }   
           
           if(request.getAttribute("msg3")!=null)
           {
               //out.println(request.getAttribute("msg"));
               String unamemsg=request.getAttribute("msg3").toString();
               out.println("<h2 style='color:red';>"+unamemsg+"</h2>");
               
           }   
           
%>

<br>
    <center>
         <table>
         
        <form action="StudentRegisterServlet" method="post">
        
        <tr>
        
            <td><strong>First Name:</strong></td> <td> <input type="text" name="fname" placeholder="Enter your First name here" id="uname"></td>
        
        
          <tr>
          <td>  <strong>Last Name:</strong></td> <td><input type="text" name="lname" placeholder="Enter your Last name here" id="uname"></td>
        </tr>
     <tr>
         
         <td>   <strong>Gender:</strong></td> <td> <select name="gender" id="gend"> 
    <option value=" "> EMPTY </option> 
    <option value="Male">Male</option> 
    <option value="Female">Female</option> 
    <option value="Female">Others</option> 
</select> 
        </td>
        <br>
        </tr>
           <tr>
           <td> <strong>Mobile No.:</strong></td><td> <input type="text" name="mobile" placeholder="Enter your Mobile No. here" id="uname"></td>
        </tr>
           <tr>
        <td>    <strong>Username:</strong> </td><td><input type="text" name="username" placeholder="Enter your username here" id="uname"></td>
        </tr>
        
  <tr>
        <td>    <strong>   Password:  </strong></td><td>  <input type="password" name="password" placeholder="Enter your password here"  id="pass" ></td> 
            
      </tr>
      <tr>      
           <td> <strong>   Re-Enter Password:  </strong></td> <td> <input type="password" name="repassword" placeholder="Re-Enter your password here"  id="repass" ></td>
        </tr>
        </table>
       
        <br>
        <br>
         
         <div class="container ">
  <div class="row">
    <div class="col-sm">
                          
                          
                          
      </div>
      
      <div class="col-sm">
          
          
          <button type="submit" class="btn btn-primary">REGISTER</button>
      </div>
      
      <div class="col-sm">
          
          
      </div>
      
      </div>
      </div>
</form>
         </center>
     </div>
     
             
        
     
     
     
     
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

      