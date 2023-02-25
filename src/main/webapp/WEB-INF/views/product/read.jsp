<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${vo.product.name}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/product/read.css">

</head>
<body>
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>${vo.product.name}</h1>
        <div>
            <div>
                <img src="/product/get-file/${vo.itemId}" alt="">
            </div>
            <div>
                <table>
                    <tbody>
                    <tr>
                        <th>PRICE</th>
                        <td colspan="5">${vo.product.price}</td>
                    </tr>
                    <tr>
                        <th>COLOR</th>
                        <td>
                            <c:forEach var="i" begin="0" end="${vo.product.options.size() - 1}">
                                <div style=" background-color:${vo.product.options.get(i).colorOption}"></div>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th>Content</th>
                        <td class="content" colspan="5">${vo.product.content}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="moved">

            <c:if test="${user.level == 1}">
                <a class="object-button prop-dark" href="/product/edit/${vo.product.index}" target="_self">수정</a>
                <a class="object-button prop-light" href="/product/delete/${vo.product.index}" target="_self">삭제</a>
            </c:if>
            <c:if test="${param.is.equals(\"1\")}">
                <a class="object-button prop-dark" href="/product/search/${vo.category.code}/${param.sp}?criteria=${param.sc}&keyword=${param.sk}">목록</a>
                <a class="object-button prop-light" href="/product/order/${vo.product.index}">주문</a>
            </c:if>
            <c:if test="${!param.is.equals(\"1\") && user.level < 10}">
                <a class="object-button prop-dark" href="/product/list/${vo.category.code}/${param.p}">목록</a>
                <a class="object-button prop-light" href="/product/order/${vo.product.index}">주문</a>
            </c:if>
            <c:if test="${user == null}">
                <a class="object-button prop-dark" href="/">목록</a>
            </c:if>

        </div>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>

</body>
</html>




