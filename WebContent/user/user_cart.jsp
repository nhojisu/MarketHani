<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
		<%-- import header.css --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
		<link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script defer src="${pageContext.request.contextPath}/js/header/header.js"></script>
		<script defer src="${pageContext.request.contextPath}/js/header/location_postcode.js"></script>
		
		<%-- import footer.css --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>

		<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>마켓하니 :: 내일의 장보기 마켓하니</title>
		<link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css">
    <script defer src="${pageContext.request.contextPath}/js/cart/quantityBtn.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
</head>
<body>
		<jsp:include page="/include/header.jsp"/>
		
		<c:set var="list" value="${cartList}" />
		<c:set var="count" value="${list.size()}"/>
		<c:set var="saleSum" value="${saleSum}"/>
		<c:set var="costSum" value="${costSum}"/>
    <div class="container">
        <h2 id="title">장바구니</h2>
        <div class="inner_container">
            <div class="cart_item">
                <div class="select_items">
                    <label for="check_all">
                        <input id="check_all" type="checkbox" checked>
                        	전체선택(1/${count})
                    </label>
                    <span class="bar">|</span>
                    <a id="delete_item" href="#">선택 삭제</a>
                </div>

                <div class="item_box">
                    <ul class="item_list">
                    	<c:forEach items="${list}" var="dto">
                        <li><!-- Item start -->
                            <div class="item">
                                <input class="check" type="checkbox" value="item_id" checked>
                                <div class="name">
                                    <div class="inner_name">
                                        <a href="${pageContext.request.contextPath}/user_product_view.do?p_num=${dto.getCart_pnum()}" class="package">${dto.getP_name()}</a>
                                    </div>
                                </div>

                                <div class="goods">
                                    <a href="${pageContext.request.contextPath}/user_product_view.do?p_num=${dto.getCart_pnum()}" class="thumb_img">
                                        <img src="${pageContext.request.contextPath}/img/product/${dto.getP_image()}">
                                    </a>

                                    <div class="price_qty">
                                        <div class="price">
                                            <span class="selling">
                                            	<span id="product_sale_price">
                                            		<fmt:formatNumber value="${dto.getSalePrice() * dto.getCart_qty()}"/>
                                            	</span>
                                              <span>원</span>
                                            </span>
                                          <c:if test="${dto.getP_price() != dto.getSalePrice()}">
                                           	<span class="cost">
                                           		<span id="product_cost_price">
                                           		  <fmt:formatNumber value="${dto.getP_price() * dto.getCart_qty()}"/>
                                           		</span>
                                           		<span>원</span>
                                           	</span>
                                          </c:if>
                                        </div>

                                        <div class="quantity">
                                            <input type="hidden" name="cart_num" value="${dto.getCart_num()}">
                                            <input type="hidden" name="pPrice" value="${dto.getP_price()}">
                                            <input type="hidden" name="salePrice" value="${dto.getSalePrice()}">
                                            <button type="button" class="btn minus"></button>
                                            <input type="number" class="quantity_num" step="1" value="${dto.getCart_qty() }" readonly>
                                            <button type="button" class="btn plus"></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="delete_btn" type="button">상품삭제</button>
                            </div>
                        </li> <!-- Item end -->
											</c:forEach>
                    </ul>
                </div>

                <div class="select_items">
                    <label for="check_all">
                        <input id="check_all" type="checkbox" checked>
                        	전체선택(1/${count})
                    </label>
                    <span class="bar">|</span>
                    <a id="delete_item" href="#">선택 삭제</a>
                </div>
            </div>

            <div class="cart_result">
                <div class="inner_result">
                    <div class="delivery">
                        <h3 class="delivery_title">배송지</h3>

                        <div class="result_address">
                            <span class="emphasis">배송지를 입력</span>
                            	하고
                            <br>
                            	배송유형을 확인해 보세요!
                            <button class="btn_default" type="button" onclick="getPostcode()">
                               	 주소 검색
                            </button>
                        </div>
                    </div>

                    <div class="price_result">
                        <dl class="price_index">
                            <dt class="index">상품금액</dt>
                            <dd class="price_block">
                                <span class="num" id="costPrice">
                                	<fmt:formatNumber value="${costSum}" />
                                </span>
                                <span class="won">원</span>
                            </dd>
                        </dl>

                        <dl class="price_index">
                            <dt class="index">상품할인금액</dt>
                            <dd class="price_block">
                                <span class="num" id="discountedPrice">
                                	<fmt:formatNumber value="${saleSum - costSum}"/>
                                </span>
                                <span class="won">원</span>
                            </dd>
                        </dl>

                        <dl class="price_index">
                            <dt class="index">배송비</dt>
                            <dd class="price_block">
                            	<c:if test="${saleSum >= 30000}">
                                <span class="num" id="delivery_cost">3,000</span>
                              </c:if>
                              <c:if test="${saleSum < 30000 }">
                              	<span class="num" id="delivery_cost">0</span>
                              </c:if>
                                <span class="won">원</span>
                            </dd>
                        </dl>

                        <dl class="price_last">
                            <dt class="index">결제예정금액</dt>
                            <dd class="price_block">
                                <span class="num" id="totalPrice">
                                	<c:if test="${saleSum >= 30000}">
		                                <fmt:formatNumber value="${saleSum + 3000}" />
		                              </c:if>
		                              <c:if test="${saleSum < 30000 }">
                              			<fmt:formatNumber value="${saleSum}" />
                              		</c:if>
                                </span>
                                <span class="won">원</span>
                            </dd>
                        </dl>
                    </div>

                    <div class="submit_block">
                        <button class="submit_btn" onclick="location.href='<%=request.getContextPath() %>/user/user_order.jsp'">
                            	주문하기
                        </button>
                    </div>

                    <div class="notice_block">
                        <span class="notice_text">· '입금확인' 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
                        <span class="notice_text">· '입금확인' 이후 상태에는 고객센터로 문의해주세요.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="/include/footer.jsp"/>

<%-- 
</body>
</html> 
--%>
