<%@ page import="com.bcyportfolio.shopping.enums.user.ModifyResult" %>
<%@ page import="com.bcyportfolio.shopping.services.UserService" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>정보수정</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/user/register.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/scripts/user/modify.js"></script>
</head>
<body class="user-register">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>USER MODIFY</h1>
        <form id="modifyForm" method="post">
            <span>이메일 : ${user.email}</span>
            <br>
            <span>닉네임 : ${user.nickname}</span>
            <br>
            <span>이름 :${user.nameFirst}${user.nameOptional}${user.nameLast}</span>
            <br>
            <table>
                <tbody>
                <tr>
                    <th>기존 비밀 번호<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>기존 비밀번호</span>
                            <input class="object-text" maxlength="50" name="password" placeholder="기존 비밀번호" type="password"
                                   data-regex="<%=UserService.Regex.PASSWORD%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>신규 비밀번호<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>신규 비밀번호</span>
                            <input class="object-text" maxlength="50" name="passwordNew" placeholder="신규 비밀번호 재확인" type="password">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>신규 비밀번호 재확인<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>신규 비밀번호 재확인</span>
                            <input class="object-text" maxlength="50" name="passwordNewCheck" placeholder="신규 비밀번호 재확인" type="password">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>연락처<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>연락처</span>
                            <select class="object-text" name="contactFirst">
                                <option value="010" ${user.contactFirst.equals("010") ? "selected" : ""}>010</option>
                                <option value="070" ${user.contactFirst.equals("070") ? "selected" : ""}>070</option>
                            </select>
                        </label>
                        <label>
                            <span hidden>연락처(중간)</span>
                            <input class="object-text" maxlength="4" name="contactSecond" placeholder="연락처(중간)" type="number" value="${user.contactSecond}"
                                   data-regex="<%=UserService.Regex.CONTACT_SECOND%>">
                        </label>
                        <label>
                            <span hidden>연락처(끝)</span>
                            <input class="object-text" maxlength="4" name="contactThird" placeholder="연락처(끝)" type="number" value="${user.contactThird}"
                                   data-regex="<%=UserService.Regex.CONTACT_THIRD%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>주소 확인<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>우편번호</span>
                            <input class="object-text" maxlength="5" name="addressPost" readonly type="number" value="${user.addressPost}">
                        </label>
                        <label>
                            <span hidden>기본 주소</span>
                            <input class="object-text" maxlength="100" name="addressPrimary" readonly type="text" value="${user.addressPrimary}">
                        </label>
                        <input class="object-text" name="addressPostFindButton" type="button" value="우편번호 찾기">
                        <label>
                            <span hidden>상세 주소</span>
                            <input class="object-text" maxlength="100" name="addressSecondary" placeholder="상세 주소" type="text"
                                   value="${user.addressSecondary}" data-regex="<%=UserService.Regex.ADDRESS_SECONDARY%>">
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
                <input hidden class="object-button prop-dark" type="submit" value="정보수정">
                <a class="object-button prop-light" href="/">취소</a>
            </div>
        </form>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<script>
    ${vo.result == ModifyResult.DUPLICATE_CONTACT ? "alert('입력하신 연락처는 이미 사용 중입니다.');" : ""}
    ${vo.result == ModifyResult.INVALID_PASSWORD ? "alert('입력하신 비밀번호는 틀렸습니다.');" : ""}
    ${vo.result == ModifyResult.FAILURE ? "alert('알 수 없는 이유로 정보수정에 실패하였습니다.');" : ""}
    ${vo.result == ModifyResult.SUCCESS ? "alert('성공적으로 회원 정보를 수정하였습니다. 다시 로그인해주세요.'); window.location.href='/';" : ""}
</script>
</body>
</html>



<main>
    <div id="postal-layer"></div>
    <div>
        <h1>FORGOT EMAIL</h1>
        <form id="forgotEmailForm" method="post">
            <table>
                <caption>이메일 정보 찾기</caption>
                <tbody>
                <tr>
                    <th>기존 비밀 번호<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>기존 비밀번호</span>
                            <input maxlength="50" name="password" placeholder="기존 비밀번호" type="password"
                                   data-regex="<%=UserService.Regex.PASSWORD%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>신규 비밀번호<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>신규 비밀번호 재확인</span>
                            <input maxlength="50" name="passwordNewCheck" placeholder="신규 비밀번호 재확인" type="password">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>신규 비밀번호 재확인<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>신규 비밀번호 재확인</span>
                            <input maxlength="50" name="passwordNewCheck" placeholder="신규 비밀번호 재확인" type="password">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>연락처<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>연락처</span>
                            <select name="contactFirst">
                                <option value="010" ${user.contactFirst.equals("010") ? "selected" : ""}>010</option>
                                <option value="070" ${user.contactFirst.equals("070") ? "selected" : ""}>070</option>
                            </select>
                        </label>
                        <label>
                            <span hidden>연락처(중간)</span>
                            <input maxlength="4" name="contactSecond" placeholder="연락처(중간)" type="number" value="${user.contactSecond}"
                                   data-regex="<%=UserService.Regex.CONTACT_SECOND%>">
                        </label>
                        <label>
                            <span hidden>연락처(끝)</span>
                            <input maxlength="4" name="contactThird" placeholder="연락처(끝)" type="number" value="${user.contactThird}"
                                   data-regex="<%=UserService.Regex.CONTACT_THIRD%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <label>
                        <span hidden>우편번호</span>
                        <input maxlength="5" name="addressPost" readonly type="number" value="${user.addressPost}">
                    </label>
                    <input name="addressPostFindButton" type="button" value="우편번호 찾기">
                    <br>
                    <label>
                        <span hidden>기본 주소</span>
                        <input maxlength="100" name="addressPrimary" readonly type="text" value="${user.addressPrimary}">
                    </label>
                    <br>
                    <label>
                        <span hidden>상세 주소</span>
                        <input maxlength="100" name="addressSecondary" placeholder="상세 주소" type="text"
                               value="${user.addressSecondary}" data-regex="<%=UserService.Regex.ADDRESS_SECONDARY%>">
                    </label>
                </tr>
                </tbody>
            </table>

            <div>
                <input hidden class="object-button prop-dark" type="submit" value="정보수정">
                <a class="object-button prop-light" href="/">취소</a>
            </div>
        </form>
    </div>
</main>