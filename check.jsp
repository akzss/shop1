<%--
  Created by IntelliJ IDEA.
  User: zss
  Date: 2020/6/21
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    session.setAttribute("username",username);
    String password = request.getParameter("pwd");
%>

<%
    if (username.equals("zss") && password.equals("123456")){
%>
<jsp:forward page="shop.jsp" />
<%
}
else
{
%>
<jsp:forward page="login.jsp" />
<%
    }
%>
</body>
</html>