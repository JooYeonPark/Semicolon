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
<meta name="viewport"
  content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui" />
  
<link rel="shortcut icon" href="/resources/favicon.ico" type="image/x-icon"> 
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

  
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
<link href="/resources/css/jasny-bootstrap.css" rel="stylesheet" type="text/css" />

<script src="/resources/js/jquery-2.1.3.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/idangerous.swiper.min.js"></script>
<script src="/resources/js/global.js"></script>
<!-- custom scrollbar -->
<script src="/resources/js/jquery.mousewheel.js"></script>
<script src="/resources/js/jquery.jscrollpane.min.js"></script>
<script src="/resources/js/jasny-bootstrap.js"></script>
<title><decorator:title default=";(Semicolon)" /></title>
<decorator:head />

</head>
<body>

  <script>
  var no;
  $(document).ready(function(){
		var autoFlag = false;
	  
		// 로그아웃중...
	    if( ${empty cookie.autoLoginCookie && empty no} ){
		   	//alert("!!");	
		}else if( ${not empty cookie.autoLoginCookie} ){	//auto 접속
			autoFlag = true;
			var agent = navigator.userAgent.toLowerCase();
			
			if(agent.indexOf("android") != -1) {
				alert("true")
			}
			
		   	no = ${no};
		   	
		}else{		// 간단 로그인
			//alert("~~");
		}
					 
	  });
  
  function setMessage(token) {
	  $.ajax({
		  url : "/push/token",
		  type : 'post',
		  data : {
			  token : token, no : no
		  },
		  success : function(data) {
			  console.log(data);
		  },
		  error : function(data, a, b) {
			  console.log(data);
			  console.log(a);
			  console.log(b);
		  }
	  })
  }
  
  function sideMenu(){
	  $("body").removeClass("opened-menu");
	  $("header").removeClass("opened");
	  $(".close-header-layer").css("display", "none");
  }
		</script>


  <%-- Login Modal Start --%>
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
    aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog modal-sm">

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="Login" style="text-align:center;">LOGIN</h4>
        </div>
        <div class="modal-body">

          <form action="/member/login" method="post" class="form">
            <label for="id">ID</label> <input class="simple-field"
              id="id" type="text" name="id" placeholder="Enter ID" /> <label
              for="password">Password</label> <input
              class="simple-field" id="password" type="password"
              name="password" placeholder="Enter Password" />
            <div class="row">
              <label class="col-sm-5 checkbox-entry"> <input
                type="checkbox" value="true" name="autoLogin" /> <span
                class="check"></span> 자동로그인
              </label>
              <div class="col-sm-5"	>
                <p class="text-right">
                  <input type="submit" class="button style-10" value="LOGIN">
                </p>
              </div>
            </div>
            <%-- ./row --%>
          </form>

          <hr>
          <p class="tile text-center text-muted">
            <a href="/member/regist" style="color:#000000;">
            	<i class="fa fa-user-plus" ></i> <span>SIGN UP</span></a>
          </p>

        </div>
      </div>
    </div>
  </div>
  
  <!-- search Modal -->
	<div class="modal fade" id="image-search-modal" tabindex="-1" role="dialog" aria-labelledby="Image" aria-hidden="true">
		<div class="modal-dialog modal-sm-5">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="image">이미지 검색</h4>
				</div>
				<div class="modal-body">
		
					<form action="/image/search">
						<label> URL로 검색 </label>
							<div class="input-group">
						<input class="form-control" name="imageName" type="text" placeholder="URL을 입력하세요!">
						<span class="input-group-btn">
			      	<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
			      </span>
					</div>
					</form>
				
					<label> 파일로 검색 </label>
					<form action="/image/search" method="post" enctype="Multipart/form-data" >
							<div class="fileinput fileinput-new" data-provides="fileinput" style="margin: auto">
						  	<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 300px; height: 250px;"></div>
						  	<div>
						    	<span class="button style-14 btn-file" style="margin : auto">
						    		<span class="fileinput-new">이미지를 선택하세요!</span>
						    		<span class="fileinput-exists">변경</span>
						    		<input type="file" name="image" accept="image/*">
						    	</span>
						    	<button type="submit" class="button style-14" ><i class="fa fa-search"></i></button>
						  	</div>
							</div>
													<!-- <input type="file" class="form-control" name="image" class="jfilestyle" placeholder="파일을 입력하세요!" accept="image/*" > -->
					</form>
					
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
            <div class="product-header-content" id="headerDiv">
							<div class="line-entry">
								<div class="menu-button responsive-menu-toggle-class">
									<i class="fa fa-reorder"></i>
								</div>
								<div
									class="header-top-entry increase-icon-responsive open-search-popup">
									<div class="title">
										<i class="fa fa-search"></i> <span>KeywordSearch</span>
									</div>
								</div>
								
								<div
									class="header-top-entry increase-icon-responsive open-image-popup">
									<div class="title">
										<a href="#" data-toggle="modal" data-target="#image-search-modal"><i class="fa fa-picture-o"></i> <span>ImageSearch</span></a>
									</div>
								</div>
								


                <c:choose>
                  <c:when
                    test="${empty cookie.autoLoginCookie && empty no}">
                    <div
                      class="header-top-entry increase-icon-responsive">
                      <div class="title">
                        <a href="#" data-toggle="modal"
                          data-target="#login-modal"><i
                          class="fa fa-sign-in"></i> <span>SIGN
                            IN</span></a>
                      </div>
                    </div>
                    <div class="header-top-entry">
                      <div class="title">
                        <a href="/member/regist"><i
                          class="fa fa-user-plus"></i> <span>SIGN
                            UP</span></a>
                      </div>
                    </div>
                  </c:when>
                  <c:when test="${no eq -1}">
                  	<div class="header-top-entry increase-icon-responsive">
		                   <div class="title">
		                       	<a href="/admin/"><i class="fa fa-eye" style="color:#f00;" ></i> <span>ADMIN</span></a>
		                   </div>
                    </div>
                    <div class="header-top-entry increase-icon-responsive">
                      <div class="title">
                        <a href="/member/logout"><i class="fa fa-sign-out"></i> <span>SIGN OUT</span></a>
                      </div>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div
                      class="header-top-entry increase-icon-responsive">
                      <div class="title">
                        <a href="/member/mypage"><i
                          class="fa fa-user"></i> <span>MY PAGE</span></a>
                      </div>
                    </div>
                    <div
                      class="header-top-entry increase-icon-responsive">
                      <div class="title">
                        <a href="/member/logout"><i
                          class="fa fa-sign-out"></i> <span>SIGN
                            OUT</span></a>
                      </div>
                    </div>
                  </c:otherwise>
                </c:choose>


              </div>
              <div class="middle-line"></div>
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
                  <li class="full-width"><a href="/">Home</a></li>
                  
                  <li class="full-width"><a href="/product/research/110">공동구매 조사</a><i
                    class="fa fa-chevron-down"></i>
                    <div class="submenu">
                      <div class="full-width-menu-items-left">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="submenu-list-title" id="listOut">
                             Top<span
                                class="toggle-list-button" id="listToggleBtn"></span>
                            </div>
                            <ul
                              class="list-type-1 toggle-list-container">
                              <li><a href="/product/research/110"><i
                                  class="fa fa-angle-right"></i>COAT</a></li>
                              <li><a href="/product/research/120"><i
                                  class="fa fa-angle-right"></i>JACKET</a></li>
                              <li><a href="/product/research/130"><i
                                  class="fa fa-angle-right"></i>DRESS</a></li>
                              <li><a
                                href="/product/research/140"><i
                                  class="fa fa-angle-right"></i>KNIT</a></li>
                              <li><a
                                href="/product/research/150"><i
                                  class="fa fa-angle-right"></i>SWEATSHIRT</a></li>
                            </ul>
                            
                          </div>
                          <div class="col-lg-6">
                            <div class="submenu-list-title" id="listOut">
                              Bottom<span
                                class="toggle-list-button" id="listToggleBtn"></span>
                            </div>
                            <ul
                              class="list-type-1 toggle-list-container">
                              <li><a href="/product/research/210"><i
                                  class="fa fa-angle-right"></i>SKIRT</a></li>
                              <li><a href="/product/research/220"><i
                                  class="fa fa-angle-right"></i>SHORT
                                  PANTS</a></li>
                              <li><a href="/product/research/230"><i
                                  class="fa fa-angle-right"></i>PANTS</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div></li>
                    
                    
                    


                  <li class="full-width"><a href="/product/list/110">공동구매</a><i
                    class="fa fa-chevron-down"></i>
                    <div class="submenu">
                      <div class="full-width-menu-items-left">
                        <div class="row">
                          <div class="col-lg-6">
                            <div class="submenu-list-title" id="listOut">
                              Top<span class="toggle-list-button" id="listToggleBtn"></span>
                            </div>
                            <ul
                              class="list-type-1 toggle-list-container">
                              <li><a href="/product/list/110"><i
                                  class="fa fa-angle-right"></i>COAT</a></li>
                              <li><a href="/product/list/120"><i
                                  class="fa fa-angle-right"></i>JACKET</a></li>
                              <li><a href="/product/list/130"><i
                                  class="fa fa-angle-right"></i>DRESS</a></li>
                              <li><a
                                href="/product/list/140"><i
                                  class="fa fa-angle-right"></i>KNIT</a></li>
                              <li><a
                                href="/product/list/150"><i
                                  class="fa fa-angle-right"></i>SWEATSHIRT</a></li>
                            </ul>
                            
                            
                          </div>
                          <div class="col-lg-6">
                            <div class="submenu-list-title" id="listOut">
                              Bottom<span
                                class="toggle-list-button" id="listToggleBtn"></span>
                            </div>
                            <ul
                              class="list-type-1 toggle-list-container">
                              <li><a href="/product/list/210"><i
                                  class="fa fa-angle-right"></i>SKIRT</a></li>
                              <li><a href="/product/list/220"><i
                                  class="fa fa-angle-right"></i>SHORT
                                  PANTS</a></li>
                              <li><a href="/product/list/230"><i
                                  class="fa fa-angle-right"></i>PANTS</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div></li>



                  <li class="simple-list"><a>공동구매 요청</a>
                    <i class="fa fa-chevron-down"></i>
                    <div class="submenu" style="display: none; opacity: 1;">
                      <ul class="simple-menu-list-column">
                        <li><a href="/require/insert"><i class="fa fa-angle-right"></i> 공동구매 요청</a></li>
                        <li><a href="/require/list"><i class="fa fa-angle-right"></i> 공동구매 요청 목록</a></li>
                      </ul>
                    </div> 
                  </li>  
                    
                </ul>

                <ul>
                  <li class="fixed-header-visible"> <a
                    class="fixed-header-square-button open-search-popup"><i
                      class="fa fa-search"></i></a></li>
                </ul>
                <div class="clear"></div>

                <a class="fixed-header-visible additional-header-logo"><img
                  src="/resources/img/logo-9.png" alt="" /></a>
              </nav>
              <div
                class="navigation-footer responsive-menu-toggle-class">
                <div class="socials-box">
                  <a href="#"><i class="fa fa-facebook"></i></a> <a
                    href="#"><i class="fa fa-twitter"></i></a> <a
                    href="#"><i class="fa fa-google-plus"></i></a> <a
                    href="#"><i class="fa fa-youtube"></i></a> <a
                    href="#"><i class="fa fa-linkedin"></i></a> <a
                    href="#"><i class="fa fa-instagram"></i></a> <a
                    href="#"><i class="fa fa-pinterest-p"></i></a>
                  <div class="clear"></div>
                </div>
                <div class="navigation-copyright">
                  Created by <a href="#">Semicolon</a>. All rights reserved
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
        <img class="footer-logo" src="/resources/img/footer-logo.PNG" alt="" />
        <div class="footer-links">
          <a href="#">Site Map</a> <a href="#">Search</a> <a href="#">Terms</a>
          <a href="#">Advanced Search</a> <a href="#">Orders and
            Returns</a> <a href="#">Contact Us</a>
        </div>
        <div class="copyright">
          Created with by <a href="#">Undefined</a>. All right reserved
        </div>
      </div>
    </footer>
  </div>


  <div class="search-box popup">
    
     	<div class="input-group">
						<input class="form-control" type="text" id="keyword" placeholder="검색어를 입력하세요!" autocomplete="off">
						<span class="input-group-btn">
						<form action="#" id="searchForm">
			      	<button type="submit" class="btn btn-primary" id="searchBtn"><i class="fa fa-search"></i></button>
						</form>
			      </span>
			  </div>
			  <ul class="list-group" id="autocomplete">

				</ul>
    
  </div>

  <div class="cart-box popup">
    <div class="popup-container">
      <div class="cart-entry">
        <a class="image"><img
          src="/resources/img/product-menu-1.jpg" alt="" /></a>
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
        <a class="image"><img
          src="/resources/img/product-menu-1_.jpg" alt="" /></a>
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
                          <img src="/resources/img/product-main-1.jpg"
                            alt=""
                            data-zoom="/resources/img/product-main-1-zoom.jpg" />
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="product-zoom-image">
                          <img src="/resources/img/product-main-2.jpg"
                            alt=""
                            data-zoom="/resources/img/product-main-2-zoom.jpg" />
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="product-zoom-image">
                          <img src="/resources/img/product-main-3.jpg"
                            alt=""
                            data-zoom="/resources/img/product-main-3-zoom.jpg" />
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="product-zoom-image">
                          <img src="/resources/img/product-main-4.jpg"
                            alt=""
                            data-zoom="/resources/img/product-main-4-zoom.jpg" />
                        </div>
                      </div>
                    </div>
                    <div class="pagination"></div>
                    <div class="product-zoom-container">
                      <div class="move-box">
                        <img class="default-image"
                          src="/resources/img/product-main-1.jpg" alt="" />
                        <img class="zoomed-image"
                          src="/resources/img/product-main-1-zoom.jpg"
                          alt="" />
                      </div>
                      <div class="zoom-area"></div>
                    </div>
                  </div>
                  <div class="swiper-hidden-edges">
                    <div
                      class="swiper-container product-thumbnails-swiper"
                      data-autoplay="0" data-loop="0" data-speed="500"
                      data-center="0" data-slides-per-view="responsive"
                      data-xs-slides="3" data-int-slides="3"
                      data-sm-slides="3" data-md-slides="4"
                      data-lg-slides="4" data-add-slides="4">
                      <div class="swiper-wrapper">
                        <div class="swiper-slide selected">
                          <div class="paddings-container">
                            <img src="/resources/img/product-main-1.jpg"
                              alt="" />
                          </div>
                        </div>
                        <div class="swiper-slide">
                          <div class="paddings-container">
                            <img src="/resources/img/product-main-2.jpg"
                              alt="" />
                          </div>
                        </div>
                        <div class="swiper-slide">
                          <div class="paddings-container">
                            <img src="/resources/img/product-main-3.jpg"
                              alt="" />
                          </div>
                        </div>
                        <div class="swiper-slide">
                          <div class="paddings-container">
                            <img src="/resources/img/product-main-4.jpg"
                              alt="" />
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
                      <i class="fa fa-star"></i>커
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
                    ipsum dolor sit amet, consectetur adipiscing elit,
                    eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Lorem ipsum dolor sit amet, consectetur.</div>
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
                    <div class="entry active"
                      style="background-color: #d23118;">&nbsp;</div>
                    <div class="entry"
                      style="background-color: #2a84c9;">&nbsp;</div>
                    <div class="entry" style="background-color: #000;">&nbsp;</div>
                    <div class="entry"
                      style="background-color: #d1d1d1;">&nbsp;</div>
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
                      class="button style-11"><i class="fa fa-heart"></i>
                      Add to Wishlist</a>
                    <div class="clear"></div>
                  </div>
                  <div class="tags-selector detail-info-entry">
                    <div class="detail-info-entry-title">Tags:</div>
                    <a href="#">bootstrap</a>/ <a href="#">collections</a>/
                    <a href="#">color/</a> <a href="#">responsive</a>
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

<script>

$(document).ready(function() {
	$("#keyword").focus(function() {
		if($("#keyword").val().trim() == "") {
			$.ajax({
				url : '/keyword/count',
				dataType : 'json',
				success : function(data) {
					if(data.length == 0) {
						$("#autocomplete").html('<li class="list-group-item">추천 검색어가 존재하지 않습니다.</li>');
					}
					
					$("#autocomplete").html('<li class="list-group-item"> 인기 검색어 TOP 5 </li>' )
					for (var i = 0; i < data.length; i++) {
						$("#autocomplete").append(liListGroup(data[i], data[i]));
					}
				},
				error : function(data) {
					$("#autocomplete").html('<li class="list-group-item">추천 검색어가 존재하지 않습니다.</li>');
				}
			})
			
		}
	})
	
	$("#keyword").keyup(function(event) {
		if(event.key == 'Enter') {
			var keyword = $("#keyword").val();
			
			$("#searchForm").attr("action", "/product/search/" + keyword);
			$("#searchForm").submit();
		}
		
		if($(this).val().trim().length == 0) {
			$("#autocomplete").html('<li class="list-group-item"> 검색어를 입력하세요 </li>' )
			return;
		}
		
		$("#autocomplete").html('');
		$.ajax({
			url : '/keyword/auto',
			data : { keyword : $("#keyword").val()} ,
			dataType : 'json',
			success : function(data) {
				if(data.length == 0) {
					$("#autocomplete").html('<li class="list-group-item">추천 검색어가 존재하지 않습니다.</li>');
				}
				
				for (var i = 0; i < data.length; i++) {
					$("#autocomplete").append(liListGroup(data[i], $("#keyword").val()));
				}
			},
			error : function(data) {
				$("#autocomplete").html('<li class="list-group-item">추천 검색어가 존재하지 않습니다.</li>');
			}
		})
		
	})
	
	$("#searchBtn").click(function() {
		var keyword = $("#keyword").val();
		
		$("#searchForm").attr("action", "/product/search/" + keyword);
	})
})

function liListGroup(value, keyword) {
	value = value.replace(keyword, '<font color="blue" style="font-weight:bold">' + keyword + '</font>')
	return '<li class="list-group-item"><a href="/product/search/' + keyword + '">' + value + '</a></li>'
}



</script>
  
</body>
</html>
