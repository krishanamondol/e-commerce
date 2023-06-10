<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/8/2023
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%
String message = (String) session.getAttribute("message");
if(message!=null){

//    print
 %>


 <%    session.removeAttribute("message");
}
%>