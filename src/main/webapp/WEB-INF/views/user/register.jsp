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
    <title>회원가입</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/user/register.css">

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/scripts/user/register.js"></script>
</head>
<body class="user-register">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div id="postal-layer"></div>
    <div>
        <h1>REGISTER</h1>
        <form id="registerForm" method="post">
            <table>
                <caption>기본 정보</caption>
                <tbody>
                <tr>
                    <th>이메일<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>이메일</span>
                            <input autofocus class="object-text" maxlength="50" name="email" placeholder="이메일" type="email" value="${vo.email}"
                                   data-regex="<%=UserService.Regex.EMAIL%>">
                            <span class="warning" rel="email-warning">해당 이메일은 이미 사용 중입니다.</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>비밀번호</span>
                            <input class="object-text" maxlength="50" name="password" placeholder="비밀번호(8자리 이상)" type="password"
                                   data-regex="<%=UserService.Regex.PASSWORD%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 재확인<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>비밀번호 재확인</span>
                            <input class="object-text"  maxlength="50" name="passwordCheck" placeholder="비밀번호 재확인" type="password">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>별명<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>별명</span>
                            <input class="object-text" maxlength="10" name="nickname" placeholder="닉네임" type="text" value="${vo.nickname}"
                                   data-regex="<%=UserService.Regex.NICKNAME%>">
                            <span class="warning" rel="nickname-warning">해당 별명은 이미 사용 중입니다.</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>실명<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>실명</span>
                            <input class="object-text" maxlength="10" name="nameFirst" placeholder="성" type="text" value="${vo.nameFirst}"
                                   data-regex="<%=UserService.Regex.NAME_FIRST%>">
                        </label>
                        <label>
                            <span hidden>중간 이름(선택)</span>
                            <input class="object-text" maxlength="10" name="nameOptional" placeholder="중간 이름(선택)" type="text" value="${vo.nameOptional}"
                                   data-regex="<%=UserService.Regex.NAME_OPTIONAL%>">
                        </label>
                        <label>
                            <span hidden>성</span>
                            <input class="object-text" maxlength="10" name="nameLast" placeholder="중간 이름(선택)" type="text" value="${vo.nameLast}"
                                   data-regex="<%=UserService.Regex.NAME_LAST%>">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>연락처<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>연락처</span>
                            <select class="object-text" name="contactFirst">
                                <option value="010" ${vo.contactFirst.equals("010") ? "selected" : ""}>010</option>
                                <option value="070" ${vo.contactFirst.equals("070") ? "selected" : ""}>070</option>
                            </select>
                        </label>
                        <label>
                            <span hidden>연락처(중간)</span>
                            <input class="object-text" maxlength="4" name="contactSecond" placeholder="연락처(중간)" type="number" value="${vo.contactSecond}"
                                   data-regex="<%=UserService.Regex.CONTACT_SECOND%>">
                        </label>
                        <label>
                            <span hidden>연락처(끝)</span>
                            <input class="object-text" maxlength="4" name="contactThird" placeholder="연락처(끝)" type="number" value="${vo.contactThird}"
                                   data-regex="<%=UserService.Regex.CONTACT_THIRD%>">
                        </label>
                        <span class="warning" rel="contact-warning">해당 연락처는 이미 사용 중입니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>주소<span>*</span></th>
                    <td>
                        <label>
                            <span hidden>우편번호</span>
                            <input maxlength="5" name="addressPost" readonly type="number" value="${vo.addressPost}">
                        </label>
                        <label>
                            <span hidden>기본 주소</span>
                            <input maxlength="100" name="addressPrimary" readonly type="text" value="${vo.addressPrimary}">
                        </label>
                        <input name="addressPostFindButton" type="button" value="우편번호 찾기">
                        <br>
                        <label>
                            <span hidden>상세 주소</span>
                            <input maxlength="100" name="addressSecondary" placeholder="상세 주소" type="text"
                                   value="${vo.addressSecondary}" data-regex="<%=UserService.Regex.ADDRESS_SECONDARY%>">
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
            <table>
                <caption>이용 약관</caption>
                <tbody>
                <tr>
                    <td>
                        <label class="object-check">
                            <input name="disc-agree-all" type="checkbox">
                            <span>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="disc">
                        <label>
                            <span><strong>[필수] 이용 약관</strong></span>
                            <textarea class="object-text" readonly>이용 약관</textarea>
                        </label>
                        <label class="object-check">
                            <input name="disc-agree-a" type="checkbox">
                            <span>이용약관에 동의합니다.</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="disc">
                        <label>
                            <span><strong>[필수] 개인정보 수집 및 이용 동의</strong></span>
                            <textarea class="object-text" readonly>개인정보 수집 및 이용 동의</textarea>
                        </label>
                        <label class="object-check">
                            <input name="disc-agree-b" type="checkbox">
                            <span>개인정보 수집 및 이용에 동의합니다.</span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="disc">
                        <label>
                            <span><strong>[선택] 쇼핑정보 수신 동의</strong></span>
                            <textarea class="object-text" readonly>쇼핑정보 수신 동의</textarea>
                        </label>
                        <label class="object-check">
                            <input name="disc-agree-c" type="checkbox">
                            <span>쇼핑정보 수신에 동의합니다.</span>
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
            <br>
            <div>
                <input class="object-button prop-dark" type="submit" value="회원가입">
                <a class="object-button prop-light" href="login">로그인으로 돌아가기</a>
            </div>
        </form>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<script>
    ${vo.result == RegisterResult.DUPLICATE_CONTACT ? "alert('입력하신 연락처는 이미 사용 중입니다.');" : ""}
    ${vo.result == RegisterResult.DUPLICATE_EMAIL ? "alert('입력하신 이메일은 이미 사용 중입니다.');" : ""}
    ${vo.result == RegisterResult.DUPLICATE_NICKNAME ? "alert('입력하신 닉네임은 이미 사용 중입니다.');" : ""}
    ${vo.result == RegisterResult.FAILURE ? "alert('알 수 없는 이유로 회원가입에 실패하였습니다.');" : ""}
</script>
</body>
</html>
