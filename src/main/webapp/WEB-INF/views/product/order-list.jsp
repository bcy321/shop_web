<%@ page import="com.bcyportfolio.shopping.enums.user.LoginResult" %>
<%@ page import="com.bcyportfolio.shopping.services.UserService" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>주문내역</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/product/order-list.css">
</head>
<body>
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>MyPage</h1>
        <table>
            <thead>
            <tr>
                <th>CATEGORY</th>
                <th colspan="2">NAME</th>
                <th>OPTION</th>
                <th>STOCK</th>
                <th>PRICE</th>
            </tr>
            </thead>
            <tbody>
                <c:if test="${vo.orders.size() == 0}">
                    <tr>
                        <td class="none" colspan="6">주문내역이 존재 하지 않습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="order" items="${vo.orders}">
                    <tr>
                        <td>${order.categoryId}</td>
                        <td colspan="2">
                            ${order.itemName}
                        </td>

                        <td>${order.colorOption}</td>
                        <td>${order.stock}</td>
                        <td>${order.price * order.stock}</td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>

</body>
</html>


