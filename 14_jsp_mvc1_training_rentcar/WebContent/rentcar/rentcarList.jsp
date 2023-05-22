<%@page import="rentcar.dao.RentcarDAO"%>
<%@page import="rentcar.dto.RentcarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>렌트카 목록</title>

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
    
    	function processReservation(carCd , memberId) {
    		
    		if (memberId == "null") {
    			alert("로그인을 먼저 진행하세요.");
    			location.href = "login.jsp";
    		}
    		else {
    			location.href = "reservation.jsp?carCd="+carCd;
    		}
    		
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
		                            <li class="active"><a href="rentcarList.jsp">상품리스트</a></li>
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
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>rentcarList</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="shop__sidebar">
                        <div class="sidebar__categories">
                            <div class="section-title">
                                <h4>Categories(구현하세요)</h4>
                            </div>
                            <div class="categories__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading active">
                                            <a data-toggle="collapse" data-target="#collapseOne">브랜드</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="#">기아</a></li>
                                                    <li><a href="#">현대</a></li>
                                                    <li><a href="#">삼성</a></li>
                                                    <li><a href="#">쌍용</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">크기</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="#">대형</a></li>
                                                    <li><a href="#">중형</a></li>
                                                    <li><a href="#">소형</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__filter">
                            <div class="section-title">
                                <h4>Shop by price(구현하세요)</h4>
                            </div>
                            <div class="filter-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="33" data-max="99"></div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <p>Price:</p>
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                            <a href="#">Filter</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="row">
                    	<%
	                		ArrayList<RentcarDTO> rentcarList = RentcarDAO.getInstance().getRentCarList();
	                        for(RentcarDTO rentcarDTO : rentcarList) {
	                    %>
	                    	<div class="col-lg-4 col-md-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="../carImg/<%=rentcarDTO.getImgNm()%>">
	                                    <% 
	                                    	if (rentcarDTO.getBrandNm().equals("현대")) {
	                                    %>
	                                    		<div class="label new">현대</div>
	                                    <% 		
	                                    	} else if (rentcarDTO.getBrandNm().equals("기아")) {
	                                    %>
	                                    		<div class="label sale">기아</div>
	                                    <% 		
	                                    	} else if (rentcarDTO.getBrandNm().equals("삼성")) {
	                                    %>
	                                    		<div class="label stockblue">삼성</div>	
	                                    <% 		
	                                    	} else if (rentcarDTO.getBrandNm().equals("쌍용")) {
	                                    %>
	                                    		 <div class="label stockout">쌍용</div>
	                                    <% 		
	                                    	}
	                                    %>
	                                    <ul class="product__hover">
	                                        <li><a href="../carImg/<%=rentcarDTO.getImgNm()%>" class="image-popup"><span class="arrow_expand"></span></a></li>
	                                        <li><a href="javascript:processReservation(<%=rentcarDTO.getCarCd()%> , '<%=memberId%>')"><span class="icon_bag_alt"></span></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6><a href="rentcarDetail.jsp?carCd=<%=rentcarDTO.getCarCd()%>"><%=rentcarDTO.getCarNm() %></a></h6>
	                                    <div class="product__price"><%=rentcarDTO.getRentPrice() %>원</div>
	                                </div>
	                            </div>
	                        </div>
                        <% 
	                        }
                        %>
                     </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

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