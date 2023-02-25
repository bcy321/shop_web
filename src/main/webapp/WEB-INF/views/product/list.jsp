<%@ page import="com.bcyportfolio.shopping.enums.product.ListResult" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${vo.result == ListResult.NO_SUCH_PRODUCT ? "존재하지 않는 상품 카테고리" : vo.category.code}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/product/list.css">

</head>
<body class="category">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>${vo.result == ListResult.NO_SUCH_PRODUCT ? "존재하지 않는 상품 카테고리" : vo.category.code}</h1>
        <section>
            <c:forEach var="item" items="${vo.products}">
                <div>
                    <a href="/product/read/${item.index}?is=0&p=${vo.page}"><img src="/product/get-file/${item.index}" alt=""></a>
                    <div>${item.name}</div>
                    <div class="price">KRW : ${item.price}</div>
                </div>
            </c:forEach>
        </section>


        <form action="/product/search/${vo.categoryId}" method="get">
            <label>
                <span hidden>기준</span>
                <select class="object-text" name="criteria">
                    <option selected value="name">상품명</option>
                    <option value="content">제목 + 내용</option>
                </select>
            </label>
            <label>
                <span hidden>키워드</span>
                <input class="object-text" maxlength="10" name="keyword" placeholder="검색어">
            </label>
            <input class="search" type="submit" value="검색">
        </form>

        <div class="moved">
        <c:if test="${vo.page > 1}">
            <span>
                <a href="/product/list/${vo.category.code}/1" target="_self">&lt;&lt;</a>
            </span>
        </c:if>
        <c:forEach var="i" begin="${vo.leftPage}" end="${vo.rightPage}" step="1">
            <c:if test="${i == vo.page}">
                <span>
                    <a class="number">${i}</a>
                </span>
            </c:if>
            <c:if test="${i != vo.page}">
                <span>
                    <a class="number" href="/product/list/${vo.category.code}/${i}" target="_self">${i}</a>
                </span>
            </c:if>
        </c:forEach>
        <c:if test="${vo.page < vo.maxPage}">
                <span>
                    <a href="/product/list/${vo.category.code}/${vo.maxPage}" target="_self">&gt;&gt;</a>
                </span>
        </c:if>


        <c:if test="${user != null && vo.user.level == 1}">
            <div class="manager">
                <ul>
                    <li>
                        <a class="object-button prop-dark" href="/product/add/${vo.categoryId}">상품 추가</a>
                    </li>
                </ul>
            </div>
        </c:if>
    </div>

    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
</body>
</html>