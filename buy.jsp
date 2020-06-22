<%--
  Created by IntelliJ IDEA.
  User: zss
  Date: 2020/6/21
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%
    String name=request.getParameter("name");
    Map<String,Integer> car=new TreeMap<>();
    if(session.getAttribute("car")!=null){
        car=(Map<String,Integer>)(session.getAttribute("car"));

    }
    if(car.get(name)!=null){
        int sum=car.get(name);
        car.put(name,sum+1);
    }else{
        car.put(name,1);
    }
    response.sendRedirect("shop.jsp");
%>