<%--
  Created by IntelliJ IDEA.
  User: zss
  Date: 2020/6/21
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Document</title>
  </head>
  <h1>购物车演示</h1>


      <%
    String name = (String) session.getAttribute("username");
    if (name == null) {
        out.println("您还没有登录，请<a href= 'login.jsp'>登录</a>");

    } else {%>
  <p>欢迎<%=name%>
    <p><a href="shop.jsp">查看商城</a>
      <p><a href="car.jsp">我的购物车</a>
        <p><a href="logout.jsp">退出</a>
          <%}%>
        </ body>
      </html>