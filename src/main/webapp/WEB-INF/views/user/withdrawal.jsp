<%@ page import="com.bcyportfolio.shopping.enums.user.RegisterResult" %>
<%@ page import="com.bcyportfolio.shopping.services.UserService" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/user/register.css">
</head>
<body class="user-register">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div id="postal-layer"></div>
    <div>
        <h1>WITHDRAWAL</h1>
        <form id="withdrawalForm" method="post">
            <table>
                <caption>기본 정보</caption>
                <tbody>
                <tr>
                    <th>이메일<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>이메일</span>
                            <span>${user.email}</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>별명<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>별명</span>
                            <span>${user.nickname}</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>실명<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>실명</span>
                            <span> ${user.nameFirst} ${user.nameOptional} ${user.nameLast}</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>연락처<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>연락처</span>
                            <span>${user.contactFirst} ${user.contactSecond} ${user.contactThird}</span>
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
            <br>
            <div>
                <input class="object-button prop-dark" type="submit" value="회원탈퇴">
                <a class="object-button prop-light" href="/">돌아가기</a>
            </div>
        </form>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<script>
    window.addEventListener('DOMContentLoaded', () => {
        const withdrawalForm = window.document.getElementById('withdrawalForm');
        withdrawalForm.onsubmit = () => {
            alert('회원탈퇴되었습니다.');
        };
    });
</script>
</body>
</html>
