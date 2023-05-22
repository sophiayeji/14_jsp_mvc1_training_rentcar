<%@page import="java.util.HashMap"%>
<%@page import="rentcar.dto.ReservationDTO"%>
<%@page import="rentcar.dao.RentcarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내 예약현황 조회</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
 	<header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                        <a href="rentcarList.jsp"><img src="../bootstrap/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                        	<% 
                        	
                        		String memberId = (String)session.getAttribute("memberId");
                        		if (memberId != null && memberId.equals("admin")) {
                        	%>
		                            <li><a href="#">사용자관리(구현하세요)</a></li>
		                            <li><a href="#">상품관리(구현하세요)</a></li>
		                            <li><a href="adminReservationList.jsp">예약관리(구현하세요)</a></li>
                        	
                        	<% 		
                        		}
                        		else {
                        	%>
		                            <li><a href="rentcarList.jsp">상품리스트</a></li>
		                            <li><a href="#">자유게시판(구현하세요)</a></li>
		                            <li><a href="#">공지사항(구현하세요)</a></li>
		                            <li  class="active"><a href="#">마이페이지</a>
		                                <ul class="dropdown">
		                                    <li><a href="#">내 정보(구현하세요)</a></li>
		                                    <li><a href="myReservationList.jsp">내 예약 현황</a></li>
		                                </ul>
		                            </li>
                        	
                        	<% 		
                        		}
                        	%>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <div class="header__right__auth">
                        	<% 
                        		if (memberId == null) {
                        	%>	
                        			<a href="login.jsp">Login</a>
                            		<a href="join.jsp">Join</a>
                        	<% 		
                        		}
                        		else {
                        	%>
                        			<a href="logout.jsp">Logout</a>
                        	<% 		
                        		}
                        	%>

                        </div>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="rentcarList.jsp"><i class="fa fa-home"></i> Home</a>
                        <span>My Reservation</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th width="5%">선택</th>
                                    <th width="55%">렌트정보</th>
                                    <th width="15%">렌트시작일</th>
                                    <th width="15%">금액 / 기간</th>
                                    <th width="15%">결제금액</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<% 
                            		ArrayList<HashMap<String,Object>> reservationMapList = RentcarDAO.getInstance().getMyReservationList((String)session.getAttribute("memberId"));
                            		for (HashMap<String , Object> reservationMap : reservationMapList) {
                            	%>
                            			<tr>
                            				<td class="cart__product__item"><input type="checkbox"></td>
		                                    <td class="cart__product__item">
		                                        <img src='../carImg/<%=reservationMap.get("imgNm") %>' width="40" height="40">
		                                        <div class="cart__product__item__title">
		                                            <h6><%=reservationMap.get("carNm") %> / <%=reservationMap.get("brandNm") %> / <%=reservationMap.get("classification") %></h6>
		                                        </div>
		                                    </td>
		                                    <td class="cart__product__item"><%=reservationMap.get("rentalStartDt") %></td>
		                                    <td class="cart__product__item"><%=reservationMap.get("rentPrice") %>원 / <%=reservationMap.get("period") %>일</td>
		                                    <td class="cart__product__item"><%=(int)reservationMap.get("rentPrice") * (int)reservationMap.get("period") %>원</td>
		                                </tr>
                            	<% 		
                            		}
                            	%>
                        </table>
                    </div>
                </div>
            </div>
               </section>
    <!-- Shop Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-7">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="rentcarList.jsp"><img src="../bootstrap/img/logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                        cilisis.</p>
                        <div class="footer__payment">
                            <a href="#"><img src="../bootstrap/img/payment/payment-1.png" alt=""></a>
                            <a href="#"><img src="../bootstrap/img/payment/payment-2.png" alt=""></a>
                            <a href="#"><img src="../bootstrap/img/payment/payment-3.png" alt=""></a>
                            <a href="#"><img src="../bootstrap/img/payment/payment-4.png" alt=""></a>
                            <a href="#"><img src="../bootstrap/img/payment/payment-5.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-5">
                    <div class="footer__widget">
                        <h6>Quick links</h6>
                        <ul>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Blogs</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4">
                    <div class="footer__widget">
                        <h6>Account</h6>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Orders Tracking</a></li>
                            <li><a href="#">Checkout</a></li>
                            <li><a href="#">Wishlist</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-8 col-sm-8">
                    <div class="footer__newslatter">
                        <h6>NEWSLETTER</h6>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <div class="footer__copyright__text">
                        <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                    </div>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Js Plugins -->
    <script src="../bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../bootstrap/js/jquery.magnific-popup.min.js"></script>
    <script src="../bootstrap/js/jquery-ui.min.js"></script>
    <script src="../bootstrap/js/mixitup.min.js"></script>
    <script src="../bootstrap/js/jquery.countdown.min.js"></script>
    <script src="../bootstrap/js/jquery.slicknav.js"></script>
    <script src="../bootstrap/js/owl.carousel.min.js"></script>
    <script src="../bootstrap/js/jquery.nicescroll.min.js"></script>
    <script src="../bootstrap/js/main.js"></script>
</body>

</html>