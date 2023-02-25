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
    <title>로그인</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/user/login.css">
    <script src="/resources/scripts/user/login.js"></script>
</head>
<body class="user-login">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>LOGIN</h1>
        <section>
            <form id="login-form" method="post">
                <div>
                    <div class="email">
                        <label>
                            <span hidden>Email</span>
                            <input autofocus class="object-text"  maxlength="50" name="email" placeholder="이메일" type="email" value="${vo.email}"
                                   data-regex="<%=UserService.Regex.EMAIL%>">
                        </label>
                    </div>
                    <div class="password">
                        <label>
                            <span hidden>Password</span>
                            <input class="object-text" maxlength="50" name="password" placeholder="비밀번호" type="password"
                                   data-regex="<%=UserService.Regex.PASSWORD%>">
                        </label>
                    </div>
                    <div class="submit">
                        <input class="object-button prop-dark" type="submit" value="LOGIN">
                    </div>
                </div>

                <label class="object-check">
                    <input name="autoSign" type="checkbox" value="true">
                    <input name="autoSign" type="hidden" value="false">
                    <span>자동 로그인</span>
                </label>

            </form>
            <div>
                <a class="object-button prop-light" href="register" target="_self">REGISTER</a>
                <a class="object-button prop-light" href="forgot-email" target="_self">FORGOT EMAIL</a>
                <a class="object-button prop-light" href="forgot-password" target="_self">FORGOT PASSWORD</a>
            </div>
        </section>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<script>
    ${vo.result == LoginResult.FAILURE ? "alert('이메일 혹은 비밀번호가 올바르지 않습니다.');" : ""}
    ${vo.result == LoginResult.UNAVAILABLE ? "alert('해당 계정은 현재 이용할 수 없습니다.');" : ""}
</script>
</body>
</html>


