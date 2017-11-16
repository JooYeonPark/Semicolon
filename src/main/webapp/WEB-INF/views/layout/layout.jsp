<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="kr.or.kosta.semicolon.member.domain.Member"%>
<%@ page language="java" contentType="charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui"/>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/css/idangerous.swiper.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700%7CDancing+Script%7CMontserrat:400,700%7CMerriweather:400,300italic%7CLato:400,700,900'
	rel='stylesheet' type='text/css' />
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />

<script src="/resources/js/jquery-2.1.3.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/idangerous.swiper.min.js"></script>
<script src="/resources/js/global.js"></script>

<!-- custom scrollbar -->
<script src="/resources/js/jquery.mousewheel.js"></script>
<script src="/resources/js/jquery.jscrollpane.min.js"></script>

<title><decorator:title default=";(Semicolon)" /></title>
<decorator:head />

<script>
console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}');
</script>

</head>
<body>

<script>
	function formSubmit(){
	    $("#logoutForm").submit();
	}
</script>

	<%--<c:url value="/logout" var="logoutUrl"/>
	
	<!--  csrt for log out -->
	 <form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form> --%>

	<%-- Login Modal Start --%>
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true">
		<div class="modal-dialog modal-sm">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Login">LOGIN</h4>
				</div>
				<div class="modal-body">
						 <%-- <section class="loginform cf">
                      	   <form action="<c:url value="/j_spring_security_check"></c:url>" method="post" class="form" >
                            <label for="id">ID</label>
                            <input class="simple-field" id="id" type="text" name="id" placeholder="Enter ID" /> 
                            <label for="password">Password</label>
                            <input class="simple-field" id="password" type="password" name="password" placeholder="Enter Password" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row">
	                            <label class="col-sm-6 checkbox-entry">
                                      <input type="checkbox" value="true" name="autoLogin"/> <span class="check"></span> 자동로그인
                                 </label>
	                            <div class="col-sm-6">
	                            <p class="text-right"><button type="submit" class="button style-10" style=""> LOGIN </button></p>
	                          	</div>
                          	</div>./row
                        </form>
                        <c:if test="${not empty error}">
                        	<div class="error"> ${error} </div>
                        </c:if>
                        </section> --%>
                        
                      	   <form action="/member/login" method="post" class="form" >
                            <label for="id">ID</label>
                            <input class="simple-field" id="id" type="text" name="id" placeholder="Enter ID" /> 
                            <label for="password">Password</label>
                            <input class="simple-field" id="password" type="password" name="password" placeholder="Enter Password" />
                            <div class="row">
	                            <label class="col-sm-6 checkbox-entry">
                                      <input type="checkbox" value="true" name="autoLogin"/> <span class="check"></span> 자동로그인
                                 </label>
	                            <div class="col-sm-6">
	                            <p class="text-right"><button type="submit" class="button style-10" style=""> LOGIN </button></p>
	                          	</div>
                          	</div><%-- ./row --%>
                        </form>
                        <c:if test="${not empty error}">
                        	<div class="error"> ${error} </div>
                        </c:if>

					<hr>
					<p class="tile text-center text-muted">
						<a href="/member/regist"  style="text-decoration:none"><i class="fa fa-user-plus"></i> <span>SIGN UP</span></a>
					</p>

				</div>
			</div>
		</div>
	</div>
	<%-- Login Modal End --%>


	<div id="content-block">

		<div class="content-center fixed-header-margin">
			<div class="header-wrapper style-10">
				<header class="type-1">

					<div class="header-product">
						<div class="logo-wrapper">
							<a href="/" id="logo"><img alt=""
								src="/resources/img/logo-9.png"></a>
						</div>
						<div class="product-header-content">
							<div class="line-entry">
								<div class="menu-button responsive-menu-toggle-class">
									<i class="fa fa-reorder"></i>
								</div>
								<div
									class="header-top-entry increase-icon-responsive open-search-popup">
									<div class="title">
										<i class="fa fa-search"></i> <span>Search</span>
									</div>
								</div>
								
								
								 <c:choose>
								<c:when test="${empty cookie.autoLoginCookie && empty login}">
										<div class="header-top-entry increase-icon-responsive">
											<div class="title">
												<a href="#" data-toggle="modal" data-target="#login-modal"><i
													class="fa fa-sign-in"></i> <span>SIGN IN</span></a>
											</div>
										</div>
										<div class="header-top-entry">
											<div class="title">
												<a href="/member/regist"><i class="fa fa-user-plus"></i> <span>SIGN UP</span></a>
											</div>
										</div>
								</c:when>
								<c:otherwise>
										<div class="header-top-entry increase-icon-responsive">
											<div class="title">
												<a href="/member/logout"><i class="fa fa-sign-out"></i> <span>SIGN OUT</span></a>
											</div>
										</div>
									</c:otherwise>
								</c:choose> 
								
								<%-- <c:choose>
								<c:when test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
										<div class="header-top-entry increase-icon-responsive">
											<div class="title">
												<a href="#" data-toggle="modal" data-target="#login-modal"><i
													class="fa fa-sign-in"></i> <span>SIGN IN</span></a>
											</div>
										</div>
										<div class="header-top-entry">
											<div class="title">
												<a href="/member/regist"><i class="fa fa-user-plus"></i> <span>SIGN UP</span></a>
											</div>
										</div>
								</c:when>
								<c:otherwise>
										<div class="header-top-entry">
											<div class="title">
												<a href="#"><i class="fa fa-user-circle"></i> <span>MY PAGE</span></a>
											</div>
										</div>
										<div class="header-top-entry increase-icon-responsive">
											<div class="title">
												<a href="javascript:formSubmit()"><i class="fa fa-sign-out"></i> <span>SIGN OUT</span></a>
											</div>
										</div>
									</c:otherwise>
								</c:choose> --%>
								
								
							</div>
							<div class="middle-line"></div>
							<div class="line-entry">
								<a href="#" class="header-functionality-entry"><i
									class="fa fa-copy"></i><span>Compare</span></a> <a href="#"
									class="header-functionality-entry"><i class="fa fa-heart-o"></i><span>Wishlist</span></a>
								<a href="#" class="header-functionality-entry open-cart-popup"><i
									class="fa fa-shopping-cart"></i><span>My Cart</span> <b>$255,99</b></a>
							</div>
						</div>
					</div>

					<div class="close-header-layer"></div>
					<div class="navigation">
						<div class="navigation-header responsive-menu-toggle-class">
							<div class="title">Navigation</div>
							<div class="close-menu"></div>
						</div>
						<div class="nav-overflow">
							<nav>
								<ul>
									<li class="full-width"><a href="#" class="active">Home</a><i
										class="fa fa-chevron-down"></i>
										<div class="submenu">
											<div class="full-width-menu-items-right">
												<div class="menu-slider-arrows">
													<a class="left"><i class="fa fa-chevron-left"></i></a> <a
														class="right"><i class="fa fa-chevron-right"></i></a>
												</div>
												<div class="submenu-list-title">
													<a href="#">Reccomended Products</a><span
														class="toggle-list-button"></span>
												</div>
												<div class="menu-slider-out">
													<div class="menu-slider-in">
														<div class="menu-slider-entry">
															<div class="product-slide-entry">
																<div class="product-image">
																	<img src="/resources/img/product-minimal-1.jpg" alt="" />
																	<div class="bottom-line left-attached">
																		<a class="bottom-line-a square"><i
																			class="fa fa-shopping-cart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-heart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-retweet"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-expand"></i></a>
																	</div>
																</div>
																<a href="#" class="title">1.Pullover Batwing Sleeve
																	Zigzag</a>
																<div class="price">
																	<div class="prev">$199,99</div>
																	<div class="current">$119,99</div>
																</div>
															</div>
														</div>
														<div class="menu-slider-entry">
															<div class="product-slide-entry">
																<div class="product-image">
																	<img src="/resources/img/product-minimal-2.jpg" alt="" />
																	<div class="bottom-line left-attached">
																		<a class="bottom-line-a square"><i
																			class="fa fa-shopping-cart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-heart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-retweet"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-expand"></i></a>
																	</div>
																</div>
																<a href="#" class="title">2.Pullover Batwing Sleeve
																	Zigzag</a>
																<div class="price">
																	<div class="prev">$199,99</div>
																	<div class="current">$119,99</div>
																</div>
															</div>
														</div>
														<div class="menu-slider-entry">
															<div class="product-slide-entry">
																<div class="product-image">
																	<img src="/resources/img/product-minimal-3.jpg" alt="" />
																	<div class="bottom-line left-attached">
																		<a class="bottom-line-a square"><i
																			class="fa fa-shopping-cart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-heart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-retweet"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-expand"></i></a>
																	</div>
																</div>
																<a href="#" class="title">3.Pullover Batwing Sleeve
																	Zigzag</a>
																<div class="price">
																	<div class="prev">$199,99</div>
																	<div class="current">$119,99</div>
																</div>
															</div>
														</div>
														<div class="menu-slider-entry">
															<div class="product-slide-entry">
																<div class="product-image">
																	<img src="/resources/img/product-minimal-4.jpg" alt="" />
																	<div class="bottom-line left-attached">
																		<a class="bottom-line-a square"><i
																			class="fa fa-shopping-cart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-heart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-retweet"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-expand"></i></a>
																	</div>
																</div>
																<a href="#" class="title">4.Pullover Batwing Sleeve
																	Zigzag</a>
																<div class="price">
																	<div class="prev">$199,99</div>
																	<div class="current">$119,99</div>
																</div>
															</div>
														</div>
														<div class="menu-slider-entry">
															<div class="product-slide-entry">
																<div class="product-image">
																	<img src="/resources/img/product-minimal-5.jpg" alt="" />
																	<div class="bottom-line left-attached">
																		<a class="bottom-line-a square"><i
																			class="fa fa-shopping-cart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-heart"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-retweet"></i></a> <a
																			class="bottom-line-a square"><i
																			class="fa fa-expand"></i></a>
																	</div>
																</div>
																<a href="#" class="title">5.Pullover Batwing Sleeve
																	Zigzag</a>
																<div class="price">
																	<div class="prev">$199,99</div>
																	<div class="current">$119,99</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="full-width-menu-items-left">
												<div class="row">
													<div class="col-lg-6">
														<div class="submenu-list-title">
															<a href="index-wide.html">Homepages <span
																class="menu-label blue">new</span></a><span
																class="toggle-list-button"></span>
														</div>
														<ul class="list-type-1 toggle-list-container">
															<li><a href="index-wide.html"><i
																	class="fa fa-angle-right"></i>Mango - Wide Header</a></li>
															<li><a href="index-electronic.html"><i
																	class="fa fa-angle-right"></i>Mango - Electronic</a></li>
															<li><a href="index-everything.html"><i
																	class="fa fa-angle-right"></i>Mango - Everything</a></li>
															<li><a href="index-fullwidthheader.html"><i
																	class="fa fa-angle-right"></i>Mango - Fullwidth Header</a></li>
															<li><a href="index-food.html"><i
																	class="fa fa-angle-right"></i>Mango - Food</a></li>
															<li><a href="index-underwear.html"><i
																	class="fa fa-angle-right"></i>Mango - Underwear</a></li>
															<li><a href="index-bags.html"><i
																	class="fa fa-angle-right"></i>Mango - Bags</a></li>
															<li><a href="index-fullwidth-noslider.html"><i
																	class="fa fa-angle-right"></i>Mango - Fullwidth No
																	Slider</a></li>
															<li><a href="index-lookbook.html"><i
																	class="fa fa-angle-right"></i>Mango - Lookbook</a></li>
															<li><a href="index-wine-left.html"><i
																	class="fa fa-angle-right"></i>Mango - Wine</a></li>
															<li><a href="index-fullwidth.html"><i
																	class="fa fa-angle-right"></i>Mango - Fullwidth</a></li>
															<li><a href="index-fullwidth-left.html"><i
																	class="fa fa-angle-right"></i>Mango - Fullwidth Left
																	Sidebar</a></li>
														</ul>
													</div>
													<div class="col-lg-6">
														<div class="submenu-list-title">
															<a href="index-wide.html">Homepages <span
																class="menu-label blue">new</span></a><span
																class="toggle-list-button"></span>
														</div>
														<ul class="list-type-1 toggle-list-container">
															<li><a href="index-parallax.html"><i
																	class="fa fa-angle-right"></i>Mango - Parallax</a></li>
															<li><a href="index-grid.html"><i
																	class="fa fa-angle-right"></i>Mango - Grid Light</a></li>
															<li><a href="index-leftsidebar.html"><i
																	class="fa fa-angle-right"></i>Mango - Grid Left Sidebar</a></li>
															<li><a href="index-minimal.html"><i
																	class="fa fa-angle-right"></i>Mango - Minimal</a></li>
															<li><a href="index-toys.html"><i
																	class="fa fa-angle-right"></i>Mango - Toys</a></li>
															<li><a href="index-furniture.html"><i
																	class="fa fa-angle-right"></i>Mango - Furniture</a></li>
															<li><a href="index-jewellery.html"><i
																	class="fa fa-angle-right"></i>Mango - Jewellery</a></li>
															<li><a href="index-mini.html"><i
																	class="fa fa-angle-right"></i>Mango - Mini</a></li>
															<li><a href="index-presentation.html"><i
																	class="fa fa-angle-right"></i>Mango - Presentation</a></li>
															<li><a href="index-parallax-fullwidth.html"><i
																	class="fa fa-angle-right"></i>Mango - Parallax
																	Fullwidth</a></li>
															<li><a href="index-parallax-boxed.html"><i
																	class="fa fa-angle-right"></i>Mango - Parallax Boxed</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="submenu-links-line">
												<div class="submenu-links-line-container">
													<div class="cell-view">
														<div class="line-links">
															<b>Quicklinks:</b> <a href="#">Blazers</a>, <a href="#">Jackets</a>,
															<a href="#">Shoes</a>, <a href="#">Bags</a>, <a href="#">Special
																offers</a>, <a href="#">Sales and discounts</a>
														</div>
													</div>
													<div class="cell-view">
														<div class="red-message">
															<b>-20% sale only this week. Don’t miss buy
																something!</b>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li class="full-width-columns"><a href="#">Pages</a><i
										class="fa fa-chevron-down"></i>
										<div class="submenu">
											<div class="product-column-entry">
												<div class="image">
													<img alt="" src="/resources/img/product-menu-2.jpg">
												</div>
												<div class="submenu-list-title">
													<a href="contact.html">Contact Us</a><span
														class="toggle-list-button"></span>
												</div>
												<div class="description toggle-list-container">
													<ul class="list-type-1">
														<li><a href="contact.html"><i
																class="fa fa-angle-right"></i>Contact Us 1</a></li>
														<li><a href="contact-2.html"><i
																class="fa fa-angle-right"></i>Contact Us 2</a></li>
														<li><a href="contact-3.html"><i
																class="fa fa-angle-right"></i>Contact Us 3</a></li>
														<li><a href="contact-4.html"><i
																class="fa fa-angle-right"></i>Contact Us 4</a></li>
													</ul>
												</div>
												<div class="hot-mark">hot</div>
											</div>
											<div class="product-column-entry">
												<div class="image">
													<img alt="" src="/resources/img/product-menu-4.jpg">
												</div>
												<div class="submenu-list-title">
													<a href="about-1.html">About Us</a><span
														class="toggle-list-button"></span>
												</div>
												<div class="description toggle-list-container">
													<ul class="list-type-1">
														<li><a href="about-1.html"><i
																class="fa fa-angle-right"></i>About Us Fullwidth 1</a></li>
														<li><a href="about-2.html"><i
																class="fa fa-angle-right"></i>About Us Fullwidth 2</a></li>
														<li><a href="about-3.html"><i
																class="fa fa-angle-right"></i>About Us Fullwidth 3</a></li>
														<li><a href="about-4.html"><i
																class="fa fa-angle-right"></i>About Us Sidebar 1</a></li>
														<li><a href="about-5.html"><i
																class="fa fa-angle-right"></i>About Us Sidebar 2</a></li>
													</ul>
												</div>
												<div class="hot-mark yellow">sale</div>
											</div>
											<div class="product-column-entry">
												<div class="image">
													<img alt="" src="/resources/img/product-menu-3.jpg">
												</div>
												<div class="submenu-list-title">
													<a href="cart.html">Cart</a><span
														class="toggle-list-button"></span>
												</div>
												<div class="description toggle-list-container">
													<ul class="list-type-1">
														<li><a href="cart.html"><i
																class="fa fa-angle-right"></i>Cart</a></li>
														<li><a href="cart-traditional.html"><i
																class="fa fa-angle-right"></i>Cart Traditional</a></li>
														<li><a href="checkout.html"><i
																class="fa fa-angle-right"></i>Checkout</a></li>
													</ul>
												</div>
											</div>
											<div class="product-column-entry">
												<div class="image">
													<img alt="" src="/resources/img/product-menu-5.jpg">
												</div>
												<div class="submenu-list-title">
													<a href="teaser-background.html">Coming Soon</a><span
														class="toggle-list-button"></span>
												</div>
												<div class="description toggle-list-container">
													<ul class="list-type-1">
														<li><a href="teaser-background.html"><i
																class="fa fa-angle-right"></i>Coming Soon 1</a></li>
														<li><a href="teaser-background-2.html"><i
																class="fa fa-angle-right"></i>Coming Soon 2</a></li>
														<li><a href="teaser-simple.html"><i
																class="fa fa-angle-right"></i>Coming Soon 3</a></li>
													</ul>
												</div>
												<div class="hot-mark">hot</div>
											</div>
											<div class="product-column-entry">
												<div class="image">
													<img alt="" src="/resources/img/product-menu-2.jpg">
												</div>
												<div class="submenu-list-title">
													<a href="shop.html">Products</a><span
														class="toggle-list-button"></span>
												</div>
												<div class="description toggle-list-container">
													<ul class="list-type-1">
														<li><a href="shop.html"><i
																class="fa fa-angle-right"></i>Shop</a></li>
														<li><a href="product.html"><i
																class="fa fa-angle-right"></i>Product</a></li>
														<li><a href="product-nosidebar.html"><i
																class="fa fa-angle-right"></i>No Sidebar</a></li>
														<li><a href="product-tabnosidebar.html"><i
																class="fa fa-angle-right"></i>Tab No Sidebar</a></li>
													</ul>
												</div>
											</div>
											<div class="submenu-links-line">
												<div class="submenu-links-line-container">
													<div class="cell-view">
														<div class="line-links">
															<b>Quicklinks:</b> <a href="shop.html">Blazers</a>, <a
																href="shop.html">Jackets</a>, <a href="shop.html">Shoes</a>,
															<a href="shop.html">Bags</a>, <a href="shop.html">Special
																offers</a>, <a href="shop.html">Sales and discounts</a>
														</div>
													</div>
													<div class="cell-view">
														<div class="red-message">
															<b>-20% sale only this week. Don’t miss buy
																something!</b>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li class="simple-list"><a href="shop.html">Products</a><i
										class="fa fa-chevron-down"></i>
										<div class="submenu">
											<ul class="simple-menu-list-column">
												<li><a href="shop.html"><i
														class="fa fa-angle-right"></i>Shop</a></li>
												<li><a href="product.html"><i
														class="fa fa-angle-right"></i>Product</a></li>
												<li><a href="product-nosidebar.html"><i
														class="fa fa-angle-right"></i>No Sidebar</a></li>
												<li><a href="product-tabnosidebar.html"><i
														class="fa fa-angle-right"></i>Tab No Sidebar</a></li>
											</ul>
										</div></li>
									<li class="column-1"><a href="portfolio-default.html">Portfolio</a><i
										class="fa fa-chevron-down"></i>
										<div class="submenu">
											<div class="full-width-menu-items-left">
												<img class="submenu-background"
													src="/resources/img/product-menu-7.jpg" alt="" />
												<div class="row">
													<div class="col-md-12">
														<div class="submenu-list-title">
															<a href="portfolio-default.html">Our Portfolio</a><span
																class="toggle-list-button"></span>
														</div>
														<ul class="list-type-1 toggle-list-container">
															<li><a href="portfolio-default.html"><i
																	class="fa fa-angle-right"></i>Portfolio Default</a></li>
															<li><a href="portfolio-simple.html"><i
																	class="fa fa-angle-right"></i>Portfolio Simple</a></li>
															<li><a href="portfolio-custom.html"><i
																	class="fa fa-angle-right"></i>Portfolio Custom</a></li>
															<li><a href="portfolio-customfullwidth.html"><i
																	class="fa fa-angle-right"></i>Fullwidth Custom</a></li>
															<li><a href="portfolio-simplefullwidth.html"><i
																	class="fa fa-angle-right"></i>Fullwidth Simple</a></li>
															<li><a href="project-default.html"><i
																	class="fa fa-angle-right"></i>Project Default</a></li>
															<li><a href="project-fullwidth.html"><i
																	class="fa fa-angle-right"></i>Project Fullwidth</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="submenu-links-line">
												<div class="submenu-links-line-container">
													<div class="cell-view">
														<div class="line-links">
															<b>Quicklinks:</b> <a href="shop.html">Blazers</a>, <a
																href="shop.html">Jackets</a>, <a href="shop.html">Shoes</a>,
															<a href="shop.html">Bags</a>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li class="column-1"><a href="blog.html">Blog</a><i
										class="fa fa-chevron-down"></i>
										<div class="submenu">
											<div class="full-width-menu-items-left">
												<img class="submenu-background"
													src="/resources/img/product-menu-8.jpg" alt="" />
												<div class="row">
													<div class="col-md-12">
														<div class="submenu-list-title">
															<a href="blog.html">Blog <span
																class="menu-label blue">new</span></a><span
																class="toggle-list-button"></span>
														</div>
														<ul class="list-type-1 toggle-list-container">
															<li><a href="blog.html"><i
																	class="fa fa-angle-right"></i>Blog Default</a></li>
															<li><a href="blog-grid.html"><i
																	class="fa fa-angle-right"></i>Blog Grid</a></li>
															<li><a href="blog-timeline.html"><i
																	class="fa fa-angle-right"></i>Blog Timeline</a></li>
															<li><a href="blog-list.html"><i
																	class="fa fa-angle-right"></i>Blog List</a></li>
															<li><a href="blog-biggrid.html"><i
																	class="fa fa-angle-right"></i>Blog Big Grid</a></li>
															<li><a href="blog-detail.html"><i
																	class="fa fa-angle-right"></i>Single Post</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="submenu-links-line">
												<div class="submenu-links-line-container">
													<div class="cell-view">
														<div class="line-links">
															<b>Quicklinks:</b> <a href="shop.html">Blazers</a>, <a
																href="shop.html">Jackets</a>, <a href="shop.html">Shoes</a>,
															<a href="shop.html">Bags</a>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li class="simple-list"><a>More</a><i
										class="fa fa-chevron-down"></i>
										<div class="submenu">
											<ul class="simple-menu-list-column">
												<li><a href="login.html"><i
														class="fa fa-angle-right"></i>Login</a></li>
												<li><a href="error.html"><i
														class="fa fa-angle-right"></i>Error</a></li>
												<li><a href="faq.html"><i class="fa fa-angle-right"></i>Faq</a></li>
												<li><a href="compare.html"><i
														class="fa fa-angle-right"></i>Compare</a></li>
												<li><a href="wishlist.html"><i
														class="fa fa-angle-right"></i>Wishlist</a></li>
												<li><a href="shortcodes.html"><i
														class="fa fa-angle-right"></i>Shortcodes</a></li>
												<li><a href="elements-headers.html"><i
														class="fa fa-angle-right"></i>Elements - Headers</a></li>
												<li><a href="elements-footers.html"><i
														class="fa fa-angle-right"></i>Elements - Footers</a></li>
												<li><a href="elements-breadcrumbs.html"><i
														class="fa fa-angle-right"></i>Elements - Breadcrumbs</a></li>
											</ul>
										</div></li>
								</ul>

								<ul>
									<li><a href="#">Buy this theme</a></li>
									<li class="fixed-header-visible"><a
										class="fixed-header-square-button open-cart-popup"><i
											class="fa fa-shopping-cart"></i></a> <a
										class="fixed-header-square-button open-search-popup"><i
											class="fa fa-search"></i></a></li>
								</ul>
								<div class="clear"></div>

								<a class="fixed-header-visible additional-header-logo"><img
									src="/resources/img/logo-9.png" alt="" /></a>
							</nav>
							<div class="navigation-footer responsive-menu-toggle-class">
								<div class="socials-box">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-google-plus"></i></a> <a href="#"><i
										class="fa fa-youtube"></i></a> <a href="#"><i
										class="fa fa-linkedin"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest-p"></i></a>
									<div class="clear"></div>
								</div>
								<div class="navigation-copyright">
									Created by <a href="#">8theme</a>. All rights reserved
								</div>
							</div>
						</div>
					</div>
				</header>
				<div class="clear"></div>
			</div>

			<!-- content -->
			<decorator:body></decorator:body>
		</div>
		<!-- FOOTER -->
		<footer class="type-2">
			<div class="position-center">
				<img class="footer-logo" src="/resources//resources/img/logo-6.png"
					alt="" />
				<div class="footer-links">
					<a href="#">Site Map</a> <a href="#">Search</a> <a href="#">Terms</a>
					<a href="#">Advanced Search</a> <a href="#">Orders and Returns</a>
					<a href="#">Contact Us</a>
				</div>
				<div class="copyright">
					Created with by <a href="#">8theme</a>. All right reserved
				</div>
			</div>
		</footer>
	</div>


	<div class="search-box popup">
		<form>
			<div class="search-button">
				<i class="fa fa-search"></i> <input type="submit" />
			</div>
			<div class="search-drop-down">
				<div class="title">
					<span>All categories</span><i class="fa fa-angle-down"></i>
				</div>
				<div class="list">
					<div class="overflow">
						<div class="category-entry">Category 1</div>
						<div class="category-entry">Category 2</div>
						<div class="category-entry">Category 2</div>
						<div class="category-entry">Category 4</div>
						<div class="category-entry">Category 5</div>
						<div class="category-entry">Lorem</div>
						<div class="category-entry">Ipsum</div>
						<div class="category-entry">Dollor</div>
						<div class="category-entry">Sit Amet</div>
					</div>
				</div>
			</div>
			<div class="search-field">
				<input type="text" value="" placeholder="Search for product" />
			</div>
		</form>
	</div>

	<div class="cart-box popup">
		<div class="popup-container">
			<div class="cart-entry">
				<a class="image"><img src="/resources/img/product-menu-1.jpg"
					alt="" /></a>
				<div class="content">
					<a class="title" href="#">Pullover Batwing Sleeve Zigzag</a>
					<div class="quantity">Quantity: 4</div>
					<div class="price">$990,00</div>
				</div>
				<div class="button-x">
					<i class="fa fa-close"></i>
				</div>
			</div>
			<div class="cart-entry">
				<a class="image"><img src="/resources/img/product-menu-1_.jpg"
					alt="" /></a>
				<div class="content">
					<a class="title" href="#">Pullover Batwing Sleeve Zigzag</a>
					<div class="quantity">Quantity: 4</div>
					<div class="price">$990,00</div>
				</div>
				<div class="button-x">
					<i class="fa fa-close"></i>
				</div>
			</div>
			<div class="summary">
				<div class="subtotal">Subtotal: $990,00</div>
				<div class="grandtotal">
					Grand Total <span>$1029,79</span>
				</div>
			</div>
			<div class="cart-buttons">
				<div class="column">
					<a class="button style-3">view cart</a>
					<div class="clear"></div>
				</div>
				<div class="column">
					<a class="button style-4">checkout</a>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div id="product-popup" class="overlay-popup">
		<div class="overflow">
			<div class="table-view">
				<div class="cell-view">
					<div class="close-layer"></div>
					<div class="popup-container">

						<div class="row">
							<div class="col-sm-6 information-entry">
								<div class="product-preview-box">
									<div class="swiper-container product-preview-swiper"
										data-autoplay="0" data-loop="1" data-speed="500"
										data-center="0" data-slides-per-view="1">
										<div class="swiper-wrapper">
											<div class="swiper-slide">
												<div class="product-zoom-image">
													<img src="/resources/img/product-main-1.jpg" alt=""
														data-zoom="/resources/img/product-main-1-zoom.jpg" />
												</div>
											</div>
											<div class="swiper-slide">
												<div class="product-zoom-image">
													<img src="/resources/img/product-main-2.jpg" alt=""
														data-zoom="/resources/img/product-main-2-zoom.jpg" />
												</div>
											</div>
											<div class="swiper-slide">
												<div class="product-zoom-image">
													<img src="/resources/img/product-main-3.jpg" alt=""
														data-zoom="/resources/img/product-main-3-zoom.jpg" />
												</div>
											</div>
											<div class="swiper-slide">
												<div class="product-zoom-image">
													<img src="/resources/img/product-main-4.jpg" alt=""
														data-zoom="/resources/img/product-main-4-zoom.jpg" />
												</div>
											</div>
										</div>
										<div class="pagination"></div>
										<div class="product-zoom-container">
											<div class="move-box">
												<img class="default-image"
													src="/resources/img/product-main-1.jpg" alt="" /> <img
													class="zoomed-image"
													src="/resources/img/product-main-1-zoom.jpg" alt="" />
											</div>
											<div class="zoom-area"></div>
										</div>
									</div>
									<div class="swiper-hidden-edges">
										<div class="swiper-container product-thumbnails-swiper"
											data-autoplay="0" data-loop="0" data-speed="500"
											data-center="0" data-slides-per-view="responsive"
											data-xs-slides="3" data-int-slides="3" data-sm-slides="3"
											data-md-slides="4" data-lg-slides="4" data-add-slides="4">
											<div class="swiper-wrapper">
												<div class="swiper-slide selected">
													<div class="paddings-container">
														<img src="/resources/img/product-main-1.jpg" alt="" />
													</div>
												</div>
												<div class="swiper-slide">
													<div class="paddings-container">
														<img src="/resources/img/product-main-2.jpg" alt="" />
													</div>
												</div>
												<div class="swiper-slide">
													<div class="paddings-container">
														<img src="/resources/img/product-main-3.jpg" alt="" />
													</div>
												</div>
												<div class="swiper-slide">
													<div class="paddings-container">
														<img src="/resources/img/product-main-4.jpg" alt="" />
													</div>
												</div>
											</div>
											<div class="pagination"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 information-entry">
								<div class="product-detail-box">
									<h1 class="product-title">T-shirt Basic Stampata</h1>
									<h3 class="product-subtitle">Loremous Clothing</h3>
									<div class="rating-box">
										<div class="star">
											<i class="fa fa-star"></i>
										</div>
										<div class="star">
											<i class="fa fa-star"></i>
										</div>
										<div class="star">
											<i class="fa fa-star"></i>
										</div>
										<div class="star">
											<i class="fa fa-star-o"></i>
										</div>
										<div class="star">
											<i class="fa fa-star-o"></i>
										</div>
										<div class="rating-number">25 Reviews</div>
									</div>
									<div class="product-description detail-info-entry">Lorem
										ipsum dolor sit amet, consectetur adipiscing elit, eiusmod
										tempor incididunt ut labore et dolore magna aliqua. Lorem
										ipsum dolor sit amet, consectetur.</div>
									<div class="price detail-info-entry">
										<div class="prev">$90,00</div>
										<div class="current">$70,00</div>
									</div>
									<div class="size-selector detail-info-entry">
										<div class="detail-info-entry-title">Size</div>
										<div class="entry active">xs</div>
										<div class="entry">s</div>
										<div class="entry">m</div>
										<div class="entry">l</div>
										<div class="entry">xl</div>
										<div class="spacer"></div>
									</div>
									<div class="color-selector detail-info-entry">
										<div class="detail-info-entry-title">Color</div>
										<div class="entry active" style="background-color: #d23118;">&nbsp;</div>
										<div class="entry" style="background-color: #2a84c9;">&nbsp;</div>
										<div class="entry" style="background-color: #000;">&nbsp;</div>
										<div class="entry" style="background-color: #d1d1d1;">&nbsp;</div>
										<div class="spacer"></div>
									</div>
									<div class="quantity-selector detail-info-entry">
										<div class="detail-info-entry-title">Quantity</div>
										<div class="entry number-minus">&nbsp;</div>
										<div class="entry number">10</div>
										<div class="entry number-plus">&nbsp;</div>
									</div>
									<div class="detail-info-entry">
										<a class="button style-10">Add to cart</a> <a
											class="button style-11"><i class="fa fa-heart"></i> Add
											to Wishlist</a>
										<div class="clear"></div>
									</div>
									<div class="tags-selector detail-info-entry">
										<div class="detail-info-entry-title">Tags:</div>
										<a href="#">bootstrap</a>/ <a href="#">collections</a>/ <a
											href="#">color/</a> <a href="#">responsive</a>
									</div>
								</div>
							</div>
						</div>

						<div class="close-popup"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>