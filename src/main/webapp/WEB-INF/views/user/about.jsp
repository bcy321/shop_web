<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ABOUT US</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/user/about.css">

</head>
<body>
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>ABOUT ME</h1>
        <div class="about-section">
            <h2>Bae Chang Yun Shopping mall Portfolio</h2>
            <p>개인 프로젝트 진행</p>
            <p>Thank you for visiting my shopping mall portfolio.</p>
        </div>

        <div class="row">
            <div class="column">
                <div class="card">
                    <img src="/resources/images/watch.jpg" alt="Jane">
                    <div class="container">
                        <h3>Develop period</h3>
                        <p class="title">2021-05-10 ~ 2021-06-10</p>
                        <p>The development period of the project was about one month.</p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <img src="/resources/images/program.jpg" alt="Mike">
                    <div class="container">
                        <h3>Technical overview</h3>
                        <p class="title">I'm WebDeveloper</p>
                        <p>Spring boot,MyBatis, JAVA, HTML/CSS, JavaScript, MySQL(MariaDB)</p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <img src="/resources/images/phone.jpg" alt="John">
                    <div class="container">
                        <h3>Contact</h3>
                        <p class="title">Email OR Phone Number</p>
                        <p>[ 010 - 9158 - 5225 ]</p>
                        <p>bcy321@naver.com OR bcy2324.gmail.com</p>
                        <p>* Leave a message and we will contact you *</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
</body>
</html>
