<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>쇼핑몰 상품 수정</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap">
    <link rel="stylesheet" href="/resources/stylesheets/common.css">
    <link rel="stylesheet" href="/resources/stylesheets/product/modify.css">
    <script src="/resources/scripts/product/add.js"></script>

</head>
<body class="add">
<%@ include file="/WEB-INF/parts/header.jsp" %>
<main>
    <div>
        <h1>ITEM EDIT</h1>
        <form enctype="multipart/form-data" id="add-form" method="post">
            <table>
                <caption>상품 기본 정보</caption>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <label>
                            <span hidden>카테고리</span>
                            <select class="object-text" name="category">
                                <option value="outer">outer</option>
                            </select>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <label>
                            <span hidden>이름</span>
                            <input autofocus class="object-text" maxlength="100" name="name" type="text" value="${vo.product.name}">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>
                        <label>
                            <span hidden>가격</span>
                            <input class="object-text" maxlength="10" name="price" type="number"  value="${vo.product.price}">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>썸네일</th>
                    <td>
                        <label>
                            <span hidden>썸네일</span>
                            <input class="object-text" name="image" type="file"  value="${vo.product.images}">
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>재품 옵션</th>
                    <td>
                        <label>

                            <span hidden>색상 옵션</span>
                            <select class="object-text" multiple name="options">
                                <c:forEach var="i" begin="0" end="${vo.product.options.size() - 1}" step="1">
                                    <option>${vo.product.options.get(i).colorOption}|${vo.product.options.get(i).sizeOption}|${vo.product.options.get(i).stock}</option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>
                            <span hidden>색상 추가</span>
                            <label>
                                <span hidden>색상 이름</span>
                                <input class="object-text" maxlength="100" name="colorName" placeholder="색상 이름" type="text">
                            </label>
                            <label>
                                <span hidden>사이즈 이름</span>
                                <select class="object-text" name="sizeName">
                                    <option value="FREE">FREE</option>
                                </select>
                            </label>
                            <label>
                                <span hidden>색상 프리미엄</span>
                                <input class="object-text" maxlength="10" name="colorPremium" placeholder="색상 프리미엄" type="number">
                            </label>
                            <input class="object-button prop-dark" name="colorAdd" type="button" value="추가">
                            <input class="object-button prop-dark" name="colorDelete" type="button" value="삭제">
                        </label>
                    </td>
                </tr>
            </table>
            <table>
                <caption>상품 상세 정보</caption>
                <tr>
                    <td>
                        <label>
                            <span hidden>상품 상세 정보</span>
                            <textarea name="content">${vo.product.content}</textarea>
                        </label>
                    </td>
                </tr>
            </table>

            <div>
                <input class="object-button prop-dark" type="submit" value="상품 등록">
                <a class="object-button prop-light" href="/" target="_self">취소</a>
            </div>

        </form>
    </div>
</main>
<%@ include file="/WEB-INF/parts/footer.jsp" %>
</body>
</html>