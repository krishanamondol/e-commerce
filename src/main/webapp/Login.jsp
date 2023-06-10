<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/6/2023
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="components/All-Important-link.jsp"%>
</head>
<body>
<jsp:include page="components/Navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-5 offset-md-3 col-sm-8 offset-sm-2 col-lg-8 offset-lg-2">
            <div class="card">
                <div class="card-header">
                    <%
                        String message = (String) session.getAttribute("message");
                        if(message!=null){

//    print
                    %>
                    <script>
                        swal("Error!", "Email & Password Wrong!", "error");
                    </script>
                    <%                           session.removeAttribute("message");
                    }
                    %>



                    <%
                        String currentUser = (String) session.getAttribute("Logout");
                        if(currentUser != null){

//    print
                    %>
                    <script>
                        swal("Success!", "Log Out Successfully!", "success");
                    </script>
                    <%                           session.removeAttribute("Logout");
                    }
                    %>
                    <h3>Login Here</h3>
                </div>
                <div class="card-body">
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                        <input name="email" type="email" class="form-control" id="exampleInputEmail1"  placeholder="Enter email">
                      </div>
                        <div class="form-group">
                            <input name="password" type="password" class="form-control" id="exampleInputEmail2"  placeholder="Enter Password">
                        </div>
                        <div>
                            <p>Don't Have Account?<a href="Sign-Up.jsp">Sing Up</a></p>
                        </div>
                       <div class="container text-center">
                           <button type="submit" class="btn btn-outline-success">Submit</button>
                       </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
