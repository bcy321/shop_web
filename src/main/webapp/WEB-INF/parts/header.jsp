<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="container">
        <ul class="menu">
            <li>
                <div class="text">
                    <a href="/about">ABOUT ME</a>
                </div>
            </li>
            <li>
                <div class="text">SHOP</div>
                <ul class="submenu">
                    <li>
                        <a href="/product/list/outer">OUTER</a>
                    </li>
                    <li>
                        <a href="/product/list/top">TOP</a>
                    </li>
                    <li>
                        <a href="/product/list/shirt">SHIRT</a>
                    </li>
                </ul>
            </li>
            <li>
                <div class="text">
                    <c:if test="${user == null}">
                        <a href="/user/login">ORDER</a>
                    </c:if>
                    <c:if test="${user != null}">
                        <a href="/product/order-list">ORDER</a>
                    </c:if>

                </div>
            </li>
            <li>
                <div class="text">COMMUNITY</div>
                <ul class="submenu">
                    <li>
                        <a href="/board/list/notice">NOTICE</a>
                    </li>
                    <li>
                        <a href="/board/list/free">FREE</a>
                    </li>
                    <li>
                        <a href="/board/list/qna">Q&A</a>
                    </li>
                </ul>
            </li>
        </ul>
        <a class="logo" href="/" target="_self">
            <img src="/resources/images/logo.JPG" alt="쇼핑몰">
        </a>
        <ul class="menu">
            <li>
                <i class="fas fa-user-plus"></i>
                <ul class="submenu">
                    <c:if test="${user == null}">
                        <li><a href="/user/login">LOGIN</a></li>
                        <li><a href="/user/register">REGISTER</a></li>
                        <li><a href="/user/login">RECOVER</a></li>
                    </c:if>
                    <c:if test="${user != null}">
                        <li><a href="/user/logout">LOGOUT</a></li>
                        <li><a href="/user/modify">MODIFY</a></li>
                        <li><a href="/user/withdrawal">WITHDRAWAL</a></li>
                    </c:if>
                </ul>
            </li>
            <li>
                <i class="fas fa-search"></i>
            </li>
            <li>
                <label for="aside-check">
                    <i class="fas fa-bars"></i>
                </label>
                <input id="aside-check" type="checkbox" hidden>
                <aside>
                    <div class="close">
                        <label for="aside-check">
                            <i class="fas fa-times"></i>
                        </label>
                    </div>
                    <div class="content">
                        <c:if test="${user == null}">
                            <span><b><a href="/user/login">로그인</a></b>해주세요.</span>
                        </c:if>
                        <c:if test="${user != null}">
                            <span><b>${user.nickname}</b>님 환영합니다.</span>
                        </c:if>
                        <br>
                        <section>
                            <h1><strong>CUSTOMER CENTER</strong></h1>
                            <div>010-9158-5225</div>
                            <div>MON - FRI : 10AM-4:30PM</div>
                            <div>LUNCH : 11AM-2PM</div>
                            <div>FRI SAT SUN HOLIDAY OFF</div>
                        </section>
                        <br>
                        <section>
                            <h1><strong>BANK INFO</strong></h1>
                            <div>DGB BANK  / 00000000-000-0-0</div>
                            <div>CHANG YUN</div>
                        </section>
                        <br>
                        <br>
                        <ul class="disc">
                            <li>
                                <a href="/cs/disc/agreement" target="_self">AGREEMENT</a>
                            </li>
                            <li>
                                <a href="/cs/disc/pp" target="_self">PRIVACY POLICY</a>
                            </li>
                        </ul>
                        <a>Copyright&copy; 2021 배창윤 All Rights Reserved.</a>
                    </div>
                </aside>
            </li>
        </ul>
    </div>

</header>
