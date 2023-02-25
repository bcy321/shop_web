<%@ page import="com.bcyportfolio.shopping.services.UserService" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>주문하기</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/product/order.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/scripts/product/order.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>주문하기</h1>
        <div>
            <div>
                <img src="/product/get-file/${vo.itemId}" alt="">
            </div>
            <form id="orderForm" method="post">
                <div>
                    <table>
                        <tbody>
                        <tr>
                            <th>Email</th>
                            <td>
                                <label>
                                    <input class="object-text" type="text" readonly value="${user.email}">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td>
                                <label>
                                    <input class="object-text" type="text" readonly value="${user.nameFirst}${user.nameOptional}${user.nameLast} ">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>Contact<span>*</span></th>
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
                            <th>Destination<span>*</span></th>
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
                </div>
                <div>
                    <table>
                        <tbody>
                        <tr>
                            <th>NAME</th>
                            <td class="object-text" colspan="5">${vo.product.name}</td>
                        </tr>
                        <tr>
                            <th>PRICE</th>
                            <td class="object-text" colspan="5">${vo.product.price}</td>
                        </tr>
                        <tr>

                            <th>COLOR</th>
                            <td>
                                    <select id="color" class="object-text" name="colorOption">
                                            <c:forEach var="i" begin="0" end="${vo.product.options.size() - 1}">
                                                <option value="${vo.product.options.get(i).colorOption}">${vo.product.options.get(i).colorOption}</option>
                                            </c:forEach>
                                    </select>
                                    <select class="object-text" name="sizeOption">
                                            <option value="FREE">FREE</option>
                                    </select>
                                    <input id="stockOption" class="object-text" name="stock" type="number" data-tile placeholder="주문 수량">

<%--                                <c:forEach var="i" begin="0" end="${vo.product.options.size() - 1}">--%>
<%--                                    <div style=" background-color:${vo.product.options.get(i).colorOption}">${vo.product.options.get(i).colorOption}</div>--%>
<%--                                </c:forEach>--%>
                            </td>
                        </tr>
                        <tr>
                            <th>Content</th>
                            <td>
                                <label>
                                    <input class="object-text" name="content" type="text" placeholder="EX> 경비실에 맡겨 주세요.">
                                </label>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="moved">
                    <input hidden class="object-button prop-dark" type="submit" value="주문하기">
                    <a class="object-button prop-light" href="/">취소</a>
                    <a href="/product/order-list" target="_self">주문내역</a>
                </div>
            </form>
        </div>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
<%--<script>--%>
<%--    <c:if test="${vo.result == ReadResult.NOT_AUTHORIZED}">--%>
<%--    alert('해당 게시글을 읽을 권한이 없습니다.');--%>
<%--    window.history.back();--%>
<%--    </c:if>--%>
<%--    <c:if test="${vo.result == ReadResult.NO_SUCH_ARTICLE}">--%>
<%--    alert('해당 게시글을 찾을 수 없습니다.');--%>
<%--    window.history.back();--%>
<%--    </c:if>--%>
<%--</script>--%>
</body>
</html>




