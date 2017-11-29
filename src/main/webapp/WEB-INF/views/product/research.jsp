<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body class="style-10">
  <!-- LOADER -->
  <div id="loader-wrapper">
    <div class="bubbles">
      <div class="title">loading</div>
      <span></span> <span id="bubble2"></span> <span id="bubble3"></span>
    </div>
  </div>
 
  <div class="content-push">

    <div class="breadcrumb-box">
      <a href="#">Home</a> <a href="#">Bags &amp; Accessories</a>
    </div>

    <div class="information-blocks">
      <div class="row">
        <div class="col-md-9 col-md-push-3 col-sm-8 col-sm-push-4">

          <input type="hidden" id="loginMemberNo" value="${no}">
          <input type="hidden" id="category" value="${category}">
          
          <!-- Top Menu -->
          <div class="page-selector">
            <div class="shop-grid-controls">
              <div class="entry">
                <div class="inline-text">Sort by</div>
                <div class="simple-drop-down">
                  <select id="productOrder">
                    <option value='newProduct' selected>등록순</option>
                    <option value='endDate'>마감날짜순</option>
                    <option value='deadline'>참여많은순</option>
                    <option value='lowPrice'>낮은가격순</option>
                    <option value='highPrice'>높은가격순</option>
                  </select>
                </div>
              </div>
              <div class="entry">
                <div class="view-button active grid">
                  <i class="fa fa-th"></i>
                </div>
                <div class="view-button list">
                  <i class="fa fa-list"></i>
                </div>
              </div>
            </div>
            <div class="clear"></div>
          </div>
          <!-- /.Top Menu -->

          <!-- Product List -->
          <div class="row shop-grid grid-view researchView"></div>

          <div class="page-selector">
              <a class="moreView"><i class="fa fa-angle-down"></i></a>
            <div class="pages-box">
              <a href="#" class="square-button"><i
                class="fa fa-angle-up"></i></a>
            </div>
            <div class="clear"></div>
          </div>
          <!-- /.Product List -->
          
        </div>
        


        <!-- modal -->
        <div class="modal" id="gpurchaseInfo">
          <div class="modal-dialog modal-sm">
            <div class="modal-content"></div>
          </div>
        </div>
        <!-- /.modal -->



        <!-- Left Side Menu -->
        <div
          class="col-md-3 col-md-pull-9 col-sm-4 col-sm-pull-8 blog-sidebar">
          <div class="information-blocks categories-border-wrapper">
            <div class="block-title size-3">Categories</div>
            <div class="accordeon">
              <div class="accordeon-title">Bags &amp; Accessories</div>
              <div class="accordeon-entry">
                <div class="article-container style-1">
                  <ul>
                    <li><a href="#">Bags &amp; Accessories</a></li>
                    <li><a href="#">Man's Products</a></li>
                    <li><a href="#">Woman's Products</a></li>
                    <li><a href="#">Top Brands</a></li>
                    <li><a href="#">Special Offer</a></li>
                    <li><a href="#">Leather's Products</a></li>
                  </ul>
                </div>
              </div>
              <div class="accordeon-title">Man's Products</div>
              <div class="accordeon-entry">
                <div class="article-container style-1">
                  <ul>
                    <li><a href="#">Bags &amp; Accessories</a></li>
                    <li><a href="#">Man's Products</a></li>
                    <li><a href="#">Woman's Products</a></li>
                    <li><a href="#">Top Brands</a></li>
                    <li><a href="#">Special Offer</a></li>
                    <li><a href="#">Leather's Products</a></li>
                  </ul>
                </div>
              </div>
              <div class="accordeon-title">Woman's Products</div>
              <div class="accordeon-entry">
                <div class="article-container style-1">
                  <ul>
                    <li><a href="#">Bags &amp; Accessories</a></li>
                    <li><a href="#">Man's Products</a></li>
                    <li><a href="#">Woman's Products</a></li>
                    <li><a href="#">Top Brands</a></li>
                    <li><a href="#">Special Offer</a></li>
                    <li><a href="#">Leather's Products</a></li>
                  </ul>
                </div>
              </div>
              <div class="accordeon-title">Top Brands</div>
              <div class="accordeon-entry">
                <div class="article-container style-1">
                  <ul>
                    <li><a href="#">Bags &amp; Accessories</a></li>
                    <li><a href="#">Man's Products</a></li>
                    <li><a href="#">Woman's Products</a></li>
                    <li><a href="#">Top Brands</a></li>
                    <li><a href="#">Special Offer</a></li>
                    <li><a href="#">Leather's Products</a></li>
                  </ul>
                </div>
              </div>
              <div class="accordeon-title">Special Offer</div>
              <div class="accordeon-entry">
                <div class="article-container style-1">
                  <ul>
                    <li><a href="#">Bags &amp; Accessories</a></li>
                    <li><a href="#">Man's Products</a></li>
                    <li><a href="#">Woman's Products</a></li>
                    <li><a href="#">Top Brands</a></li>
                    <li><a href="#">Special Offer</a></li>
                    <li><a href="#">Leather's Products</a></li>
                  </ul>
                </div>
              </div>
              <div class="accordeon-title">Leather's Products</div>
              <div class="accordeon-entry">
                <div class="article-container style-1">
                  <ul>
                    <li><a href="#">Bags &amp; Accessories</a></li>
                    <li><a href="#">Man's Products</a></li>
                    <li><a href="#">Woman's Products</a></li>
                    <li><a href="#">Top Brands</a></li>
                    <li><a href="#">Special Offer</a></li>
                    <li><a href="#">Leather's Products</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.Left Side Menu -->
      </div>
    </div>
  </div>

  <div class="clear"></div>


  <script src="/resources/js/gpurchase/research.js"></script>
  <link href="/resources/css/gpurchase.css" rel="stylesheet" type="text/css"></link>
</body>
