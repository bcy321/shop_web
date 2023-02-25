<%@ page import="com.bcyportfolio.shopping.enums.board.DeleteResult" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>게시글 삭제</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <script>
        <c:if test="${vo.result == DeleteResult.NOT_AUTHORIZED}">
        alert('해당 게시글을 삭제할 권한이 없습니다.');
        window.history.back();
        </c:if>
        <c:if test="${vo.result == DeleteResult.NO_SUCH_ARTICLE}">
        alert('해당 게시글을 찾을 수 없습니다.');
        window.history.back();
        </c:if>
        <c:if test="${vo.result == DeleteResult.OKAY}">
        alert('해당 게시글을 삭제하였습니다.');
        window.location.href='/board/list/${vo.board.id}';
        </c:if>
    </script>
</head>
</html>