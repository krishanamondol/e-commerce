<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/22/2023
  Time: 10:45 PM
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
<section>
    <div class="contentBx">
        <div class="fromBx">
            <form action="LoginServlet" method="post">
                <h2>Login</h2>
                <div class="from-group">
                    <input type="text" name="email" placeholder="enter email" class="from-control"/>
                </div>
                <div class="from-group">
                    <input type="text" name="password" placeholder="enter password" class="from-control"/>
                </div>
                <div class="from-group">
                    <button CLASS="btn btn-outline-success"type="submit" >SUBMIT</button>
                </div>
                <div>
                    <p>Don't Have Account?<a href="#" ><span style="color: #ff006a">login</span></a></p>
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>
