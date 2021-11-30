<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <%-- import my_orderlist.css --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my_orderlist.css"/>

    <%-- import header.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
	<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
	<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>	
		
	<%-- import footer.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
		
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓하니 :: 내일의 장보기 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_postcode.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_regex.js"></script>


</head>
<body>

	<jsp:include page="../include/header.jsp"/>
	
	<div id="orderlist_main">
		<div id="orderlist_content"> 

				<div class="page_aticle aticle_type2">
				
				    <%-- 마이 할리 좌측 메뉴 --%> 
					<div id="snb" class="snb_my">
						<h2 class="tit_snb">마이할리</h2>
						<div class="inner_snb">
							<ul class="list_menu">
								<li>
									<a href="${pageContext.request.contextPath}/user/user_mypage_orderlist.jsp">주문 내역</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/user_mypage_emoney.jsp">적립금</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/#.jsp">상품 후기</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/#.jsp">상품 문의</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/user/user_mypage_myInfo.jsp">개인 정보 수정</a>
								</li>
							</ul>
						</div>
					</div>
					
					<%-- 마이 할리 중 주문 내역 파트 부분 --%>
					<div id="viewOrderList" class="page_section section_orderlist">
						<div class="head_aticle">
							<h2 class="tit">주문내역<span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다.</span></h2>
						</div>
						<ul class="list_order">
							<li>
								<div class="date">2021.11.16 (21시 02분)</div>
								<div class="order_goods">
									<div class="name">
										<a>[조공]PET 나 게살 좋아해 스틱 외 1건 </a>
									</div>
									<div class="order_info">
										<div class="thumb">
											<img src="${pageContext.request.contextPath}/img/product/게살.jpg" alt="주문 대표 사진">
										</div>
										<div class="desc">
											<dl>
												<dt>주문번호</dt>
												<dd>12313245</dd>
											</dl>
											<dl>
												<dt>결제금액</dt>
												<dd>1,000원</dd>
											</dl>
											<dl>
												<dt>주문상태</dt>
												<dd class="status end">배송완료</dd>
											</dl>
										</div>
									</div><%--order_info end --%>
																		
								</div> 
							</li> <%-- 첫번째 주문내역건 end --%>
							
						</ul><%-- list_order end --%>
						<div class="layout-pagination"></div>					
					</div>
					
				</div> <%-- page_aticle aticle_type2 end --%>			

		</div> <%-- orderlist_content end --%>	
	</div> <%-- orderlist_main end --%>
	
	
	
		
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>