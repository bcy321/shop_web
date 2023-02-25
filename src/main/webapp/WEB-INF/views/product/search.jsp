<%@ page import="com.bcyportfolio.shopping.enums.product.ListResult" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${vo.result == ListResult.NO_SUCH_PRODUCT ? "존재하지 않는 상품" : vo.category.code}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/product/search.css">
</head>
<body>
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>${vo.result == ListResult.NO_SUCH_PRODUCT ? "존재하지 않는 상품" : vo.category.code}</h1>
        <table>
            <thead>
            <tr>
                <th>NO</th>
                <th class="subject" colspan="2">Name</th>
                <th>PRICE</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${vo.result == ListResult.NO_SUCH_PRODUCT}">
                <tr>
                    <td class="none" colspan="4">존재하지 않는 상품입니다.</td>
                </tr>
            </c:if>
            <c:if test="${vo.result == ListResult.NOT_AUTHORIZED}">
                <tr>
                    <td class="none" colspan="4">게시판을 확인할 권한이 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${vo.result == ListResult.OKAY}">
                <c:if test="${vo.products.size() == 0}">
                    <tr>
                        <td class="none" colspan="4">검색 결과가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="product" items="${vo.products}">
                    <tr>
                        <td>${product.index}</td>
                        <td colspan="2">
                            <a href="/product/read/${product.index}?is=1&sc=${vo.criteria}&sk=${vo.keyword}&sp=${vo.page}">${product.name}</a>
                        </td>
                        <td class="price">${product.price}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6">
                    <form action="/product/search/${vo.categoryId}" method="get">
                        <label>
                            <span hidden>기준</span>
                            <select class="object-text" name="criteria">
                                <option value="title" ${vo.criteria.equals("name") ? "selected" : ""}>상품명</option>
                                <option value="content" ${vo.criteria.equals("content") ? "selected" : ""}>상품명 + 내용</option>
                            </select>
                        </label>
                        <label>
                            <span hidden>키워드</span>
                            <input class="object-text" maxlength="10" name="keyword" placeholder="검색어" value="${vo.keyword}">
                        </label>
                        <input class="search" type="submit" value="검색">
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <c:if test="${vo.page > 1}">
                    <span>
                        <a href="/product/search/${vo.category.index}/1?criteria=${vo.criteria}&keyword=${vo.keyword}" target="_self">&lt;&lt;</a>
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
                            <a class="number" href="/product/search/${vo.category.index}/${i}?criteria=${vo.criteria}&keyword=${vo.keyword}" target="_self">${i}</a>
                        </span>
                        </c:if>
                    </c:forEach>
                    <c:if test="${vo.page < vo.maxPage}">
                    <span>
                        <a href="/product/search/${vo.category.index}/${vo.maxPage}?criteria=${vo.criteria}&keyword=${vo.keyword}" target="_self">&gt;&gt;</a>
                    </span>
                    </c:if>
                </td>
            </tr>
            </tfoot>
        </table>

        <div>
            <a class="object-button prop-light" href="/product/list/${vo.categoryId}">검색 취소</a>
            <c:if test="${user.level == 1}">
                <a class="object-button prop-dark" href="/product/add/${vo.categoryId}">상품 추가</a>
            </c:if>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
</body>
</html>
