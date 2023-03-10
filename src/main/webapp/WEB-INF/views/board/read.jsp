<%@ page import="com.bcyportfolio.shopping.enums.board.ReadResult" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${vo.article.title}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/board/read.css">
</head>
<body>
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div id="postal-layer"></div>
    <div>
        <h1>${vo.article.title}</h1>
        <table>
            <tbody>
                <tr>
                    <th>Writer</th>
                    <td colspan="5">${vo.article.userEmail}</td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td>${vo.article.formattedTimestamp}</td>
                    <th>View</th>
                    <td>${vo.article.view}</td>
                </tr>
                <tr>
                    <th>Content</th>
                    <td class="content" colspan="5">${vo.article.content}</td>
                </tr>
            </tbody>
            <tfoot>
                <c:if test="${user.level <= vo.board.levelComment}">
                    <tr>
                        <th>??????<span>*</span></th>
                        <td colspan="5">
                            <form method="post">
                                <label>
                                    <span hidden>??????</span>
                                    <input maxlength="100" name="content" placeholder="??????" type="text">
                                </label>
                                <input type="submit" value="??????">
                            </form>
                        </td>
                    </tr>
                </c:if>
                <c:forEach var="comment" items="${vo.article.comments}">
                    <tr>
                        <td></td>
                        <td>${comment.userEmail}</td>
                        <td colspan="3">${comment.content}</td>
                        <td>${comment.formattedTimestamp}</td>
                    </tr>
                </c:forEach>
                    <td colspan="4"></td>
            </tfoot>
        </table>
        <div>
            <c:if test="${user.level == 1 || user.email.equals(vo.article.userEmail)}">
                <a class="object-button prop-dark" href="/board/edit/${vo.article.index}" target="_self">??????</a>
                <a class="object-button prop-light" href="/board/delete/${vo.article.index}" target="_self">??????</a>
            </c:if>
            <c:if test="${param.is.equals(\"1\")}">
                <a class="object-button prop-dark" href="/board/search/${vo.board.id}/${param.sp}?criteria=${param.sc}&keyword=${param.sk}">??????</a>
            </c:if>
            <c:if test="${!param.is.equals(\"1\")}">
                <a class="object-button prop-dark" href="/board/list/${vo.board.id}/${param.p}">??????</a>
            </c:if>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<script>
    <c:if test="${vo.result == ReadResult.NOT_AUTHORIZED}">
    alert('?????? ???????????? ?????? ????????? ????????????.');
    window.history.back();
    </c:if>
    <c:if test="${vo.result == ReadResult.NO_SUCH_ARTICLE}">
    alert('?????? ???????????? ?????? ??? ????????????.');
    window.history.back();
    </c:if>
</script>
</body>
</html>

