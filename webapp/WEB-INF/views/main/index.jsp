<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Academy Management System</title>

<!--STYLESHEET-->
<!--=================================================-->

<!--나눔 고딕 Font [ OPTIONAL ] -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">


<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">

</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
	<div id="container" class="effect aside-float aside-bright mainnav-out push">

		<!-- header -->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

		<!--  navigation -->

		<div class="boxed">
			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">



					<!-- QUICK TIPS -->
					<!-- ==================================================================== -->
					<hr class="new-section-sm bord-no">

					<!-- login form/ Logo -->
					<div class="row">
						<div class="col-lg-10 col-lg-offset-1">
							<div class="panel panel-body">
								<div class="panel-body">
									<div class="col-lg-4" style="position: absolute; width: 300px; margin: 140px 0px 0px 200px;">

										<!-- Panel  Blog -->
										<!--===================================================-->
										<div class="panel">
											<div class="blog-header">
												<img class="img-responsive align-center" src="${pageContext.request.contextPath }/assets/img/logo.png" alt="Image">
											</div>
										</div>
									</div>
									<div class="cls-content pull-right col-lg-4">
										<div class="cls-content-sm panel">
											<div class="panel-body">
												<div class="mar-ver pad-btm">
													<h1 class="h3">Account Login</h1>
													<p>Sign In to your account</p>
												</div>
												<form action="index.html">
													<div class="form-group">
														<input type="text" class="form-control" placeholder="Username" autofocus>
													</div>
													<div class="form-group">
														<input type="password" class="form-control" placeholder="Password">
													</div>
													<div class="checkbox pad-btm text-left">
														<input id="demo-form-checkbox" class="magic-checkbox" type="checkbox"> <label for="demo-form-checkbox">Remember me</label>
													</div>
													<button class="btn btn-primary btn-lg btn-block" type="submit">Sign In</button>
												</form>
											</div>

											<div class="pad-all">
												<a href="pages-password-reminder.html" class="btn-link mar-rgt">Forgot password ?</a> <a href="pages-register.html" class="btn-link mar-lft">Create a new account</a>
											</div>
										</div>
									</div>
									<!--===================================================-->
								</div>
							</div>
						</div>
						<!-- ==================================================================== -->
						<!-- END QUICK TIPS -->
					</div>

					<!-- notice -->
					<div class="row">
						<div class="col-lg-10 col-lg-offset-1">
							<div class="panel panel-body">
								<h3>공지사항</h3>
								<hr size="5" noshade>
								<div class="col-lg-4" style="position: absolute; width: 800px; margin: 0px;">
									<!-- Panel  Blog -->
									<!--===================================================-->
									<div class="panel">
										<div class="blog-header">
											<img class="img-responsive align-center" src="${pageContext.request.contextPath }/assets/img/shared-img-2.jpg" alt="Image">
										</div>
									</div>
								</div>
								<div class="panel-body  pull-right col-lg-5">
									<table id="demo-foo-accordion" class="table toggle-arrow-tiny">
										<thead>
											<tr>
												<th data-toggle="true">순번</th>
												<th>작성자</th>
												<th data-hide="all">제목</th>
												<th data-hide="all">작성 일자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>22</td>
												<td>황일영</td>
												<td>Traffic Court Referee</td>
												<td>22 Jun 1972</td>
											</tr>
											<tr>
												<td>43</td>
												<td>orbi</td>
												<td>Airline Transport Pilot</td>
												<td>3 Oct 1981</td>
											</tr>
											<tr>
												<td>44</td>
												<td>비트 교육센터</td>
												<td>Business Services Sales Representative</td>
												<td>19 Apr 1969</td>
											</tr>
											<tr>
												<td>58</td>
												<td>황희지</td>
												<td>Drywall Stripper</td>
												<td>13 Dec 1977</td>
											</tr>
											<tr>
												<td>77</td>
												<td>비트 컴퓨터</td>
												<td>Aviation Tactical Readiness Officer</td>
												<td>30 Dec 1991</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- community -->
					<div class="row">
						<div class="col-lg-6 col-lg-offset-1">
							<div class="panel panel-body">
								<h3>커뮤니티</h3>
								<hr size="5" noshade>
								<div class="panel">
									<div class="blog-header">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/shared-img-5.jpg" style="width: 300px;" alt="Image">
									</div>
									<div class="blog-content">
										<div class="blog-title media-block">
											<div class="media-right textright">
												<a href="#" class="btn btn-icon demo-psi-twitter icon-lg add-tooltip" data-original-title="Twitter" data-container="body"></a> <a href="#"
													class="btn btn-icon demo-psi-instagram icon-lg add-tooltip" data-original-title="Instagram" data-container="body"></a>
											</div>
											<div class="media-body">
												<a href="#" class="btn-link">
													<h2>강남역 5번 출구 주변 맛집</h2>
												</a>
											</div>
										</div>
										<div class="blog-body">
											<p>동해도(강남역점)</p>
											<p>서울시 서초구 서초동 1320-10</p>
											<!-- <p>강남역 12번 출구로 나와 LIG건물 지하 1층에 위치했다. 회전 초밥 뷔페 집으로, 가격은
												1만7천원이다. 우선 초밥을 무제한으로 먹을 수 있다는 장점이 있다. 그러나 40분의 식사시간은 다소
												촉박하다는 느낌을 받는 곳이다. 롤의 종류 대여섯개 정도와 스시는 15종 정도가 있다. 5명 이상 예약
												가능하다.</p> -->
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">
											<span class="label label-success">5 Days ago</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="panel panel-body">
								<h3>Q/A</h3>
								<hr size="5" noshade>
								<table id="demo-foo-accordion" class="table toggle-arrow-tiny">
									<thead>
										<tr>
											<th data-toggle="true">순번</th>
											<th>작성자</th>
											<th data-hide="all">제목</th>
											<th data-hide="all">작성 일자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>12</td>
											<td>구민수</td>
											<td>소음 문제</td>
											<td>22 Jun 1972</td>
										</tr>
										<tr>
											<td>32</td>
											<td>강보은</td>
											<td>너무 바람이 세요</td>
											<td>3 Oct 1981</td>
										</tr>
										<tr>
											<td>45</td>
											<td>김재봉</td>
											<td>에어컨 언제 나오나요?</td>
											<td>19 Apr 1969</td>
										</tr>
										<tr>
											<td>56</td>
											<td>이건창</td>
											<td>몇시까지 하나요?</td>
											<td>13 Dec 1977</td>
										</tr>
										<tr>
											<td>59</td>
											<td>이종현</td>
											<td>강의실 언제까지 쓸 수 있죠?</td>
											<td>30 Dec 1991</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

					<!-- 학습 지원 센터 -->
					<div class="row">
						<div class="col-lg-4 col-lg-offset-1">
							<div class="panel panel-body">
								<h3>학습 지원 센터</h3>
								<hr size="5" noshade>
								<div class="col-sm-6">
									<div class="mar-all">
										<div class="media">
											<div class="media-left">
												<i class="icon-lg icon-fw demo-pli-map-marker-2"></i>
											</div>
											<div class="media-body">
												<address>
													<strong class="text-main"> My Company, Inc.</strong><br> 795 Folsom Ave, Suite 600<br> San Francisco, CA 94107<br>
												</address>
											</div>
										</div>

										<p>
											<i class="icon-lg icon-fw demo-pli-old-telephone"></i> <span>(123) 456-7890</span>
										</p>
										<div class="pad-btm">
											<i class="icon-lg icon-fw demo-pli-mail"></i> <span>support@mycompany.com</span>
										</div>
										<div class="pad-ver">
											<a href="#" class="mar-rgt box-inline demo-pli-facebook icon-lg add-tooltip" data-original-title="Facebook" data-container="body"></a> <a href="#"
												class="mar-rgt box-inline demo-pli-twitter icon-lg add-tooltip" data-original-title="Twitter" data-container="body"></a> <a href="#"
												class="mar-rgt box-inline demo-pli-google-plus icon-lg add-tooltip" data-original-title="Google+" data-container="body"></a> <a href="#"
												class="mar-rgt box-inline demo-pli-instagram icon-lg add-tooltip" data-original-title="Instagram" data-container="body"></a>
										</div>
										<div>
											<iframe src="https://www.google.com/maps/embed/v1/place?q=New+York+University&amp;key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4" frameborder="0" scrolling="no" marginheight="0"
												marginwidth="0" style="width: 100%; height: 200px;"></iframe>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--===================================================-->
					<!--End page content-->


				</div>
				<!--===================================================-->
				<!--END CONTENT CONTAINER-->


			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->

		</div>

		<!-- footer -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

		<!-- SCROLL PAGE BUTTON -->
		<!--===================================================-->
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>
		<!--===================================================-->
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->




	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

</body>

</html>
