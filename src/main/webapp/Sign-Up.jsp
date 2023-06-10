<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/6/2023
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="components/All-Important-link.jsp"%>

</head>
<body>

<jsp:include page="components/Navbar.jsp"/>
 <div class="container-fluid">
     <div class="row mt-4">
         <div class="col-md-5 offset-md-3 col-sm-8 offset-sm-2 col-lg-8 offset-lg-2">
             <div class="card">
                 <div class="card-header">
                     <%
                         String message = (String) session.getAttribute("message");
                         if(message!=null){

//    print
%>
                     <div class="alert alert-warning alert-dismissible fade show" role="alert">
                         <strong> <%=message%></strong>
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                         </button>
                     </div>
  <%                           session.removeAttribute("message");
                         }
                     %>
                    <div class="container text-center">
                        <span ><i class="ri-user-add-line"></i></span>
                        <h2 class="success">Sing UP Here ! </h2>
                    </div>
                 </div>
                 <div class="card-body px-5">
                     <form action="RegisterServlet" id="from" method="post">
                         <div class="form-group success">
                             <input name="user_name" id="name" type="text" id="form3Example1" class="form-control" placeholder="Name" />
                             <small>Error Message</small>
                         </div>
                         <div class="form-group error">
                             <input name="user_email" id="email" type="email" id="form3Example2" class="form-control"  placeholder="Email"/>
                             <span id = "blankEmail" style="color:red"> </span>
                         </div>
                         <div class="form-group">
                             <input id="firstPassword" type="password" id="form3Example3" class="form-control" placeholder="Create Password" />
                             <span id =  "notReadyPassword" style="color:red"> </span>
                         </div>
                         <div class="form-group">
                             <input name="user_password" id="confirmPassword" type="password" id="form3Example4" class="form-control" placeholder="Confirm Password" />
                             <span id =  "blankPassword2" style="color:red"> </span>
                         </div>
                         <div class="form-group">
                             <input name="user_phone" id="number" type="number" id="form3Example5" class="form-control" placeholder="Mobile" />
                             <span id =  "blankPhone" style="color:red"> </span>
                         </div>
                         <div class="form-group">
                             <textarea name="user_address" id="address" class="from-control" style="height: 140px; width: 300px;" placeholder="Address"></textarea>
                             <span id =  "blankAddress" style="color:red"> </span>
                         </div>
                         <div>
                             <p>Have Account?<a href="Login.jsp">log in</a></p>
                         </div>
                         <div class="container text-center">
                             <button type="submit" class="btn btn-outline-success">Submit</button>
                             <button type="reset" class="btn btn-outline-warning">Reset</button>
                         </div>

                     </form>
                 </div>
             </div>
         </div>
     </div>
 </div>


</body>
</html>
