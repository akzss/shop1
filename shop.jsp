<%--
  Created by IntelliJ IDEA.
  User: zss
  Date: 2020/6/21
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="shopping.cart.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<form method=post action=check.jsp>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>
    <head>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">

    </head>

    <body bgcolor="#ffffff">
        <%
    Map products = new HashMap();
    products.put("1", new Product("1", "ƻ��", 2.60));
    products.put("2", new Product("2", "�㽶", 6.50));
    products.put("3", new Product("3", "����", 3.10));
    products.put("4", new Product("4", "������", 5.20));
    products.put("5", new Product("5", "��֦", 22.00));
    products.put("6", new Product("6", "Ѽ��",8.50));
    products.put("7", new Product("7", "����",3.00));
    products.put("8", new Product("8", "���ܹ�",11.00));
    products.put("9", new Product("9", "����", 7.00));
    session.setAttribute("products", products);
%>
    <h1>�Ա�ˮ������</h1>
        <%
            String name = (String)session.getAttribute("username");
            if(name==null){
       out.println( "����û�е�¼����<a href='login.jsp'>��¼</a>");
   }else{

%>

    <input type="hidden" name="action" value="purchase">
    <table border="1" cellspacing="0">
        <tr bgcolor="#CCCCCC">
        <tr bgcolor="#CCCCCC">
            <p>��ӭ<%=name%>
            <td>
                ���
            </td>
            <td>
                ˮ������
            </td>
            <td>
                ˮ����λ�۸񣨣�/�
            </td>

            <td>
                ���뵽���ﳵ
            </td>
        </tr>
        <%
            Set productIdSet = products.keySet();
            Iterator it = productIdSet.iterator();
            int number = 1;
            while (it.hasNext()) {
                String id = (String) it.next();
                Product product = (Product) products.get(id);
        %><tr>
        <td>
            <%=number++%>
        </td>
        <td>
            <%=product.getName()%>
        </td>

        <td>
            <%=product.getPrice()%></td>
        <td>
            <a href="buy.jsp?id=<%=product.getId()%>&action=add" target="cart">��Ҫ����</a>



        </td>
    </tr>
        <%
            }
        %>

    </table>
    <p>
    </p>
        <%}%>
</form>
</body>
