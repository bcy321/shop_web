<%@ page import="com.bcyportfolio.shopping.enums.board.ListResult" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${vo.result == ListResult.NO_SUCH_BOARD ? "존재하지 않는 게시판" : vo.board.name}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/board/list.css">
</head>
<body class="board-list">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>${vo.result == ListResult.NO_SUCH_BOARD ? "존재하지 않는 게시판" : vo.board.name}</h1>
        <table>
            <thead>
            <tr>
                <th>NO</th>
                <th class="subject" colspan="2">SUBJECT</th>
                <th>WRITER</th>
                <th>DATE</th>
                <th>VIEW</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${vo.result == ListResult.NO_SUCH_BOARD}">
                <tr>
                    <td class="none" colspan="6">존재하지 않는 게시판입니다.</td>
                </tr>
            </c:if>
            <c:if test="${vo.result == ListResult.NOT_AUTHORIZED}">
                <tr>
                    <td class="none" colspan="5">게시판을 확인할 권한이 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${vo.result == ListResult.OKAY}">
                <c:if test="${vo.articles.size() == 0}">
                    <tr>
                        <td class="none" colspan="6">검색 결과가 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="article" items="${vo.articles}">
                    <tr>
                        <td>${article.index}</td>
                        <td colspan="2">
                            <a href="/board/read/${article.index}?is=1&sc=${vo.criteria}&sk=${vo.keyword}&sp=${vo.page}">${article.title}</a>
                            <a class="comment-count">[${article.comments.size()}]</a>
                        </td>
                        <td>${article.userEmail}</td>
                        <td>${article.formattedTimestamp}</td>
                        <td>${article.view}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6">
                    <form action="/board/search/${vo.boardId}" method="get">
                        <label>
                            <span hidden>기준</span>
                            <select name="criteria">
                                <option value="title" ${vo.criteria.equals("title") ? "selected" : ""}>제목</option>
                                <option value="content" ${vo.criteria.equals("content") ? "selected" : ""}>제목 + 내용</option>
                                <option value="email" ${vo.criteria.equals("email") ? "selected" : ""}>작성자</option>
                            </select>
                        </label>
                        <label>
                            <span hidden>키워드</span>
                            <input maxlength="10" name="keyword" placeholder="검색어" value="${vo.keyword}">
                        </label>
                        <input class="object-button prop-dark" type="submit" value="검색">
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <c:if test="${vo.page > 1}">
                    <span>
                        <a href="/board/search/${vo.board.id}/1?criteria=${vo.criteria}&keyword=${vo.keyword}" target="_self">&lt;&lt;</a>
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
                            <a class="number" href="/board/search/${vo.board.id}/${i}?criteria=${vo.criteria}&keyword=${vo.keyword}" target="_self">${i}</a>
                        </span>
                        </c:if>
                    </c:forEach>
                    <c:if test="${vo.page < vo.maxPage}">
                    <span>
                        <a href="/board/search/${vo.board.id}/${vo.maxPage}?criteria=${vo.criteria}&keyword=${vo.keyword}" target="_self">&gt;&gt;</a>
                    </span>
                    </c:if>
                </td>
            </tr>
            </tfoot>
        </table>

        <div>
            <a class="object-button prop-light" href="/board/list/${vo.boardId}">검색 취소</a>
            <c:if test="${vo.board.levelWrite >= user.level}">
                <a class="object-button prop-dark" href="/board/write/${vo.boardId}">글 작성</a>
            </c:if>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
</body>
</html>
