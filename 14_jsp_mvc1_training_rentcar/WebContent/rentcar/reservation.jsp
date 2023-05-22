<%@page import="rentcar.dto.RentcarDTO"%>
<%@page import="rentcar.dao.RentcarDAO"%>
<%@page import="rentcar.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>예약하기</title>

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
    <script>
    
		function getTotalPrice() {
			
			var rentPrice = document.getElementById("rentPrice").value;
			var period    = document.getElementById("period").value;
			
			document.getElementById("showPeriod").innerHTML = period + "일";
			document.getElementById("totalPrice").innerHTML = rentPrice * period + "원";
		}
	
		
		function checkData() {
			
			var rentalStartDt = document.getElementById("rentalStartDt").value;
			var period = document.getElementById("period").value;
			
			if (confirm(rentalStartDt + "일 부터 (" + period +") 일간 예약을 진행합니다.")) {
				return true;
			}
			else {
				return false;
			}
			
		}
    
    	window.onload = function() {
    		
    		var today = new Date();
    		var year = today.getFullYear();
    		var month = today.getMonth() + 1;
    		var date = today.getDate();
    		
    		if (month < 10) {
    			month = "0" + month;
    		}
    		
    		if (date < 10) {
    			date = "0" + date;
    		}
    		today = year + "-" + month + "-" + date;
    		
    		document.getElementById("rentalStartDt").value = today;
    		document.getElementById("rentalStartDt").min = today;
    		
    		getTotalPrice();
    		
    	}
    	
    </script>
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
		                            <li  class="active"><a href="rentcarList.jsp">상품리스트</a></li>
		                            <li><a href="#">자유게시판(구현하세요)</a></li>
		                            <li><a href="#">공지사항(구현하세요)</a></li>
		                            <li><a href="#">마이페이지</a>
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
                        <span>Rervation</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            
            <% 
            	MemberDTO memberDTO = RentcarDAO.getInstance().getMemberDetail((String)session.getAttribute("memberId"));
            	RentcarDTO rentcarDTO = RentcarDAO.getInstance().getRentcarDetail(Integer.parseInt(request.getParameter("carCd")));
            %>
            
            <form action="reservationPro.jsp" method="post" class="checkout__form">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>예약 하기</h5>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>아이디 <span>*</span></p>
                                    <input type="text" name="memberId" value="<%=memberDTO.getMemberId()%>" readonly="readonly">
                                </div>
                                <div class="checkout__form__input">
                                    <p>나이 <span>*</span></p>
                                    <input type="text" value="<%=memberDTO.getAge()%>" readonly="readonly">
                                </div>
                                <div class="checkout__form__input">
                                    <p>이메일 <span>*</span></p>
                                    <input type="text" value="<%=memberDTO.getEmail()%>" readonly="readonly">
                                </div>
                                <div class="checkout__form__input">
                                    <p>연락처 <span>*</span></p>
                                   <input type="text" value="<%=memberDTO.getContact()%>" readonly="readonly">
                                </div>
                                <div class="checkout__form__input">
                                    <p>차량정보 <span>*</span></p>
                                    <input type="text" value="<%=rentcarDTO.getCarNm()%>/<%=rentcarDTO.getBrandNm() %>/<%=rentcarDTO.getClassification() %>" readonly="readonly">
                                </div>
                                <div class="checkout__form__input">
                                    <p>1일 렌트비용 <span>*</span></p>
                                    <input type="text" value="<%=rentcarDTO.getRentPrice()%>원" readonly="readonly">
                                </div>
                                <div class="checkout__form__input">
                                    <p>렌트 시작일 <span>*</span></p>
                                    <input type="date" id="rentalStartDt" name="rentalStartDt" >
                                </div>
                                <div class="checkout__form__input">
                                    <p>예약일수 <span>*</span></p>
                                    <input type="number" id="period" name="period" value="1" min="1" max="30" onchange="getTotalPrice()">
                                </div>
                            </div>
                        </div>
                   	 </div>
                	      <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>예약 상세</h5>
                                <input type="hidden" name="carCd" value="<%=rentcarDTO.getCarCd() %>">
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">차량 / 가격</span>
                                            <span class="top__text__right">기간</span>
                                        </li>
                                        <li><%=rentcarDTO.getCarNm() %> / <%=rentcarDTO.getRentPrice() %>원 <span id="showPeriod">1일</span></li>
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <input type="hidden" id="rentPrice" value="<%=rentcarDTO.getRentPrice()%>">
                                    <ul>
                                        <li>Total <span  id="totalPrice"></span></li>
                                    </ul>
                                </div>
                                <button type="submit" class="site-btn">예약하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

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