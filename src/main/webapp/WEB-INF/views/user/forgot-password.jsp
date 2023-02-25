<%@ page import="com.bcyportfolio.shopping.services.UserService" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/user/register.css">
    <script src="/resources/scripts/class.ajax.js"></script>
    <script src="/resources/scripts/user/forgot-password.js"></script>
</head>
<body class="user-register">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>PASSWORD FORGOT</h1>
        <form id="forgotPasswordForm">
            <table>
                <caption>기본 정보</caption>
                <tbody>
                <tr>
                    <th>이메일<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>이메일</span>
                            <input autofocus class="object-text" maxlength="50" name="email" placeholder="이메일" type="email"
                                   data-regex="<%=UserService.Regex.EMAIL%>">
                            <span class="warning" rel="email-warning">해당 이메일은 이미 사용 중입니다.</span>
                        </label>

                    </td>
                </tr>
                <tr>
                    <th>연락처<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>연락처</span>
                            <select class="object-text" name="contactFirst">
                                <option value="010" selected>010</option>
                                <option value="070">070</option>
                            </select>
                        </label>
                        <label>
                            <span hidden>연락처(중간)</span>
                            <input class="object-text" maxlength="4" name="contactSecond" placeholder="연락처(중간)" type="number"
                                   data-regex="<%=UserService.Regex.CONTACT_SECOND%>">
                        </label>
                        <label>
                            <span hidden>연락처(끝)</span>
                            <input class="object-text" maxlength="4" name="contactThird" placeholder="연락처(끝)" type="number"
                                   data-regex="<%=UserService.Regex.CONTACT_THIRD%>">
                        </label>
                        <span class="warning" rel="contact-warning">해당 연락처는 이미 사용 중입니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>인증 번호<span>*</span></th>
                    <td>
                        <input class="object-text" name="sendCodeButton" type="button" value="인증코드 전송">
                        <br>
                        <label hidden rel="authCode">
                            <span hidden>인증코드</span>
                            <input class="object-text" maxlength="6" name="authCode" placeholder="인증코드" type="number">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호<span>*</span></th>
                    <td>
                        <label hidden rel="password">
                            <span hidden>비밀번호</span>
                            <input maxlength="50" name="password" placeholder="비밀번호" type="password"
                                   data-regex="<%=UserService.Regex.PASSWORD%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 재확인<span>*</span></th>
                    <td>
                        <label hidden rel="passwordCheck">
                            <span hidden>비밀번호 재확인</span>
                            <input maxlength="50" name="passwordCheck" placeholder="비밀번호 재확인" type="password">
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>

            <br>
            <div>
                <input hidden name="key" type="hidden">
                <input hidden  class="object-button prop-dark" name="submit" type="submit" value="비밀번호 재설정">
                <a class="object-button prop-light" href="login">로그인으로 돌아가기</a>
            </div>
        </form>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
</body>
</html>

