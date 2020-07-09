<%--
  Created by IntelliJ IDEA.
  User: zss
  Date: 2020/6/21
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="shopping.cart.*" %>

<%
    Cart c = (Cart)session.getAttribute("cart");
    if(c == null) {
        c = new Cart();
        session.setAttribute("cart", c);
    }
    double totalPrice = c.getTotalPrice();
    request.setCharacterEncoding("GBK");
    String action = request.getParameter("action");
    Map products = (HashMap)session.getAttribute("products");
    if(action != null && action.trim().equals("add")) {
        String id = request.getParameter("id");
        Product p = (Product)products.get(id);
        CartItem ci = new CartItem();
        ci.setProduct(p);
        ci.setCount(1);
        c.add(ci);
    }
    if(action != null && action.trim().equals("delete")) {
        String id = request.getParameter("id");
        c.deleteItemById(id);
    }
    if(action != null && action.trim().equals("update")) {
        for(int i=0; i<c.getItems().size(); i++) {
            CartItem ci = c.getItems().get(i);
            int count = Integer.parseInt(request.getParameter("p" + ci.getProduct().getId()));
            ci.setCount(count);
        }
    }
%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
    List<CartItem> items = c.getItems();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GB18030">
    <title>购物车</title>

</head>
<body>

<!-- c的值是：<%=(c == null) %> items的值是：<%=(items == null) %> -->
<form action="buy.jsp" method="get">
    <input type="hidden" name="action" value="update"/>
    <table align="center" border="1">
        <tr>
            <td>水果ID</td>
            <td>水果名称</td>
            <td>购买数量</td>
            <td>单位价格</td>
            <td>总价</td>
            <td>处理</td>
        </tr>
        <%
            for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
                CartItem ci = it.next();
        %>
        <tr>
            <td><%=ci.getProduct().getId() %></td>
            <td><%=ci.getProduct().getName() %></td>
            <td>
                <input type="text" size=3 name="<%="p" + ci.getProduct().getId() %>" value="<%=ci.getCount() %>"
                       οnkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                       οnchange="document.forms[0].submit()">
            </td>
            <td><%=ci.getProduct().getPrice() %></td>
            <td><%=ci.getProduct().getPrice()*ci.getCount() %></td>
            <td>

                <a href="buy.jsp?action=delete&id=<%=ci.getProduct().getId() %>">移除</a>

            </td>
        </tr>
        <%
            }
        %>


        <tr>
            <td colspan=3 align="right">
                全部水果总价格为：
            </td>
            <td colspan=3><%=c.getTotalPrice() %></td>
        </tr>


        <tr>
            <td colspan=6 align="right">
                <a href="shop.jsp">返回商城</a>
            </td>
        </tr>
    </table>
</form>
</body>
