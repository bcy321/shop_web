<%@ page import="com.bcyportfolio.shopping.enums.board.WriteResult" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>글 작성</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/board/write.css">
    <script src="/resources/scripts/libraries/ckeditor/ckeditor.js"></script>
    <script src="/resources/scripts/board/write.js"></script>
</head>
<body class="user-register">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>BOARD WRITE</h1>
        <form method="post" id="add-form">
            <table>
                <tbody>
                <tr>
                    <th>Title<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>제목</span>
                            <input autofocus class="object-text" maxlength="100" name="title" type="text" placeholder="제목" value="${vo.title}">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>Content<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>내용</span>
                            <textarea name="content">${vo.content}</textarea>
                            <%//todo write.js에 url 물어보기 , 글쓰는 곳 크기 조절 물어보기%>
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input class="object-button prop-dark" type="reset" value="초기화">
                <input class="object-button prop-light" type="submit" value="글 작성">
                <a class="object-button prop-dark" href="#" onclick="window.history.back();">돌아가기</a>
            </div>
        </form>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<script>
    <c:if test="${vo.result == WriteResult.NOT_AUTHORIZED}">
    alert('ERROR');
    </c:if>
    <c:if test="${vo.result == WriteResult.NO_SUCH_BOARD}">
    alert('ERROR');
    </c:if>
</script>
</body>
</html>
