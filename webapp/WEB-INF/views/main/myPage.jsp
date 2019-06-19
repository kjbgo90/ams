<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>AMS/My Page</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--나눔 고딕 Font [ OPTIONAL ] -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css"
	rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css"
	rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link
	href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css"
	rel="stylesheet">
<!--=================================================-->



<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>


<!--Unite Gallery [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/unitegallery/css/unitegallery.min.css"
	rel="stylesheet">

<!--DataTables [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/datatables/media/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/plugins/datatables/extensions/Responsive/css/responsive.dataTables.min.css"
	rel="stylesheet">



<!--=================================================
    REQUIRED
    You must include this in your project.
    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.
    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.
    DEMONSTRATION
    This is to be removed, used for demonstration purposes only. This category must not be included in your project.
    SAMPLE
    Some script samples which explain how to initialize plugins or components. This category should not be included in your project.
    Detailed information and more samples can be found in the document.
    =================================================-->

</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>

	<div id="container" class="effect aside-float aside-bright mainnav-lg">

		<!--NAVBAR-->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!--===================================================-->
		<!--END NAVBAR-->


		<div class="box">
			<div id="container">
				<div id="content-container">
					<div id="page-head">

						<hr class="new-section-sm bord-no">
						<!-- Simple Toolbar -->
						<!---------------------------------->
						<div class="text-center pad-btm">
							<h3>My page</h3>
							<p>Where there is a will there is a way.</p>
						</div>
						<hr class="new-section-sm bord-no">
						<!---------------------------------->
					</div>

					<!--Page content-->
					<!--===================================================-->
					<div id="page-content">

						<div class="row">
							<h4 class="text-main pad-btm bord-btm">  select class</h4>
							
							<div class="col-lg-6">
								<div class="panel">

									<!--Carousel-->
									<!--===================================================-->
									<div id="demo-carousel" class="carousel slide"
										cdata-ride="carousel">

										<!--Indicators-->
										<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
										<ol class="carousel-indicators out">
											<li class="active" data-slide-to="0"
												data-target="#demo-carousel"></li>
											<li data-slide-to="1" data-target="#demo-carousel"></li>
											<li data-slide-to="2" data-target="#demo-carousel"></li>
										</ol>
										<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

										<div class="carousel-inner text-center">

											<!--Item 1-->
											<div class="item active">
												<h4 class="text-main">java 고급과정</h4>
												<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
												<p>
													<a href="">이동하기</a>
												</p>
											</div>

											<!--Item 2-->
											<div class="item">
												<h4 class="text-main">자율 주행 차</h4>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscingelit.</p>
												<p>
													<a href="">이동하기</a>
												</p>
											</div>

											<!--Item 3-->
											<div class="item">
												<h4 class="text-main">c 언어</h4>
												<p>Praesent commodo cursus magna, vel scelerisque nisl
													consectetur.</p>
												<p>
													<a href="">이동하기</a>
												</p>
											</div>
										</div>

										<!--carousel-control-->
										<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
										<a class="carousel-control left" data-slide="prev"
											href="#demo-carousel"> <i
											class="demo-pli-arrow-left icon-2x"></i>
										</a> <a class="carousel-control right" data-slide="next"
											href="#demo-carousel"> <i
											class="demo-pli-arrow-right icon-2x"></i>
										</a>
										<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

									</div>
									<!--===================================================-->
									<!--End Carousel-->


								</div>
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">Line</h3>
									</div>
									<div class="pad-all">

										<!--Sparklines Line-->
										<!--===================================================-->
										<div id="demo-sparklines-line-1-1"></div>
										<!--===================================================-->
										<!-- End Sparklines Line -->


									</div>
								</div>
								<div class="demorow">
									<div class="col-lg-5">
										<div class="panel">
											<div class="panel-heading">
												<h3 class="panel-title">과제 제출률</h3>
											</div>
											<div class="panel-body">

												<!--Data Percent-->
												<!--===================================================-->
												<div id="demo-pie-7-1" class="demo-pie pie-title-center"
													data-percent="39">
													<span class="pie-value text-thin text-2x"></span>
												</div>
												<!--===================================================-->
												<!-- End Data Percent -->
												<div class="panel-heading"></div>
												<div class="panel-body"></div>
											</div>
										</div>
									</div>
									<div class="col-lg-7 blog">
									<br><br>
										<!-- Panel  Blog -->
										<!--===================================================-->
										<div class="panel">
										
											<div class="blog-header bg-warning pad-all">
												<blockquote class="bq-sm bq-open bq-close mar-no">
												과제 제출률이 현저히 낮습니다!!
												</blockquote>
											</div>
											<div class="blog-content">
												<div class="blog-title media-block">
													<div class="media-right textright">
														<a href="#"
															class="btn btn-icon demo-pli-paperclip icon-lg add-tooltip"
															data-original-title="Add file 22" data-container="body"></a>
													</div>
													<div class="media-body">
														<a href="#" class="btn-link">
															<h2>최근 과제 1</h2>
														</a>
													</div>
												</div>
												<div class="blog-body">
													<p>최근 과제 내용~~</p>
												</div>
											</div>
											<div class="blog-footer">
												<div class="media-left">17 Days ago</div>
												<div class="media-body text-right">
													<span class="mar-rgt">
													<i class="demo-pli-heart-2 icon-fw"></i>75
													</span> 
													<i class="demo-pli-speech-bubble-5 icon-fw"></i>2
												</div>
											</div>
											<br> <br>
											<button id="demo-update-interval"
												class="btn btn-block  btn-primary">Update Chart</button>
											<br> <br>

										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">최근 제출 현황</h3>
									</div>
									<div class="panel-body">

										<table id="" class="table table-striped table-bordered"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Name</th>
													<th>Position</th>
													<th class="min-tablet">Office</th>
													<th class="min-tablet">Extn.</th>
													<th class="min-desktop">Start date</th>
													<th class="min-desktop">Salary</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Tiger Nixon</td>
													<td>System Architect</td>
													<td>Edinburgh</td>
													<td>61</td>
													<td>2011/04/25</td>
													<td>$320,800</td>
												</tr>
												<tr>
													<td>Tiger Nixon</td>
													<td>System Architect</td>
													<td>Edinburgh</td>
													<td>61</td>
													<td>2011/04/25</td>
													<td>$320,800</td>
												</tr>
												<tr>
													<td>Tiger Nixon</td>
													<td>System Architect</td>
													<td>Edinburgh</td>
													<td>61</td>
													<td>2011/04/25</td>
													<td>$320,800</td>
												</tr>
											</tbody>
										</table>
										<br> <br>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">최근 공지 사항</h3>
									</div>
									<div class="panel-body">

										<!-- 공지사항 리스트 딱 세개만 뽑자 최근 거만  -->
										<table id="" class="table table-striped table-bordered" cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>등록일</th>
													<th>제목</th>
													<th>글쓴이</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>2011/04/25</td>
													<td>System Architect</td>
													<td>Tiger Nixon</td>
												</tr>
												<tr>
													<td>2011/04/25</td>
													<td>Edinburgh</td>
													<td>Tiger Nixon</td>
												</tr>
												<tr>
													<td>2011/04/25</td>
													<td>61</td>
													<td>Tiger Nixon</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="col-lg-6">

								<h4>Timeline</h4>

								<!-- Timeline -->
								<!--===================================================-->
								<div class="timeline">

									<!-- Timeline header -->
									<div class="timeline-header">
										<div class="timeline-header-title bg-primary">
											Now
										</div>
									</div>
									<div class="timeline-entry">
										<div class="timeline-stat">
											<div class="timeline-icon"></div>
											<div class="timeline-time">
												3 Hours ago
											</div>
										</div>
										<div class="timeline-label">
											<p class="mar-no pad-btm">
												<a href="#" class="btn-link">
													Lisa D.
												</a> 
													commented on 
												<a href="#" class="text-semibold">
													<i>The Article</i>
												</a>
											</p>
											<blockquote class="bq-sm bq-open mar-no">
												Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam
												nonummy nibh euismod tincidunt.
											</blockquote>
										</div>
									</div>
									<div class="timeline-entry">
										<div class="timeline-stat">
											<div class="timeline-icon"></div>
											<div class="timeline-time">15:45</div>
										</div>
										<div class="timeline-label">
											<p class="text-main text-semibold">Lorem ipsum dolor sit
												amet</p>
											<span>Lorem ipsum dolor sit amet, consectetuer
												adipiscing elit, sed diam nonummy nibh euismod tincidunt.</span>
										</div>
									</div>
									<div class="timeline-entry">
										<div class="timeline-stat">
											<div class="timeline-icon"></div>
											<div class="timeline-time">
												13:27
											</div>
										</div>
										<div class="timeline-label">
											<img class="img-xs img-circle" src="${pageContext.request.contextPath }/assets/img/profile-photos/2.png" alt="Profile picture"> 
											<a href="#" class="btn-link">Michael Both</a> 
												Like 
											<a href="#" class="text-semibold">
												<i>The Article.</i>
											</a>
										</div>
									</div>
									<div class="timeline-entry">
										<div class="timeline-stat">
											<div class="timeline-icon"></div>
											<div class="timeline-time">
												13:27
											</div>
										</div>
										<div class="timeline-label">
											<img class="img-xs img-circle" src="${pageContext.request.contextPath }/assets/img/profile-photos/2.png" alt="Profile picture"> 
											<a href="#" class="btn-link">Michael Both</a> 
												Like 
											<a href="#" class="text-semibold">
												<i>The Article.</i>
											</a>
										</div>
									</div>
									<div class="timeline-entry">
										<div class="timeline-stat">
											<div class="timeline-icon"></div>
											<div class="timeline-time">11:27</div>
										</div>
										<div class="timeline-label">Lorem ipsum dolor sit amet,
											consectetuer adipiscing elit, sed diam nonummy nibh euismod
											tincidunt.</div>
									</div>
								</div>
								<br> <br> <br> <br>
									<h4>Community</h4>
								<!--===================================================-->
								<!-- End Timeline -->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">Enable title text</h3>
									</div>
									<div class="pad-all">
										<div id="demo-gallery-3" style="display: none;">

											<a href="#"> 
											<img alt="The winding road" src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile1.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile1.jpg"
												data-description="The winding road description"
												style="display: none">
											</a> 
											<a href="#"> 
											<img alt="Pancake" src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile2.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile2.jpg"
												data-description="A pancake is a flat cake, often thin and round, prepared from a starch-based batter"
												style="display: none">
											</a> 
											<a href="#"> 
											<img alt="Foreshore" src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile3.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile3.jpg"
												data-description="The part of a shore between high- and low-water marks, or between the water and cultivated or developed land."
												style="display: none">
											</a> 
											<a href="#"> 
											<img alt="Yellow Flowers" src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile4.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile4.jpg"
												data-description="Those are yellow flowers"
												style="display: none">
											</a> 
											<a href="#"> 
											<img alt="Waterfall" src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile5.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile5.jpg"
												data-description="A waterfall is a place where water flows over a vertical drop or a series of steep drops in the course of a stream or river."
												style="display: none">
											</a> 
											<a href="#"> <img alt="Pumpkin"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile6.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile6.jpg"
												data-description="A pumpkin is a cultivar of a squash plant, most commonly of Cucurbita pepo, that is round, with smooth, slightly ribbed skin, and deep yellow to orange coloration."
												style="display: none">
											</a> 
											<a href="#"> <img alt="In the jungle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile7.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile7.jpg"
												data-description="This is my car" style="display: none">
											</a> 
											<a href="#"> <img alt="Note"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile8.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile8.jpg"
												data-description="This is a note" style="display: none">
											</a> 
											<a href="#"> <img alt="Off-Road Motorcycle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile9.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile9.jpg"
												data-description="This is a motorcycle"
												style="display: none">
											</a> 
											<a href="#"> <img alt="Adventure"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile10.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile10.jpg"
												data-description="River Adventure Camping"
												style="display: none">
											</a> 
											<a href="#"> <img alt="The winding road"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile1.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile1.jpg"
												data-description="The winding road description"
												style="display: none">
											</a> 
											<a href="#"> <img alt="Pancake"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile2.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile2.jpg"
												data-description="A pancake is a flat cake, often thin and round, prepared from a starch-based batter"
												style="display: none">
											</a> 
											<a href="#"> <img alt="Foreshore"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile3.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile3.jpg"
												data-description="The part of a shore between high- and low-water marks, or between the water and cultivated or developed land."
												style="display: none">
											</a> 
											<a href="#"> <img alt="Yellow Flowers"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile4.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile4.jpg"
												data-description="Those are yellow flowers"
												style="display: none">
											</a> 
											<a href="#"> <img alt="Waterfall"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile5.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile5.jpg"
												data-description="A waterfall is a place where water flows over a vertical drop or a series of steep drops in the course of a stream or river."
												style="display: none">
											</a> 
											<a href="#"> <img alt="Pumpkin"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile6.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile6.jpg"
												data-description="A pumpkin is a cultivar of a squash plant, most commonly of Cucurbita pepo, that is round, with smooth, slightly ribbed skin, and deep yellow to orange coloration."
												style="display: none">
											</a> 
											<a href="#"> <img alt="In the jungle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile7.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile7.jpg"
												data-description="This is my car" style="display: none">
											</a> 
											<a href="#"> <img alt="Note"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile8.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile8.jpg"
												data-description="This is a note" style="display: none">
											</a> 
											<a href="#"> <img alt="Off-Road Motorcycle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile9.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile9.jpg"
												data-description="This is a motorcycle"
												style="display: none">
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>


		<!--ASIDE-->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
		<!--===================================================-->
		<!--END ASIDE-->

		<!--MAIN NAVIGATION-->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
		<!--===================================================-->
		<!--END MAIN NAVIGATION-->

		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->
	</div>





	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>



	<!--Unite Gallery [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/unitegallery/js/unitegallery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/unitegallery/themes/slider/ug-theme-slider.js"></script>


	<!--Sparklines [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/sparkline/jquery.sparkline.min.js"></script>



	<!--Easy Pie Chart [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>





	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<script>
		$(document).on(
				'nifty.ready',
				function() {

					var lineSparklines2 = function() {
						$('#demo-sparklines-line-1-1').sparkline(
								[ 945, 754, 805, 855, 678, 987, 1026, 885, 878,
										922, 875, ], {
									type : 'line',
									width : '100%',
									height : '70',
									spotRadius : 3,
									lineWidth : 2,
									lineColor : '#03a9f4',
									fillColor : false,
									minSpotColor : false,
									maxSpotColor : false,
									highlightLineColor : '#03a9f4',
									highlightSpotColor : '#03a9f4',
									tooltipChartTitle : 'Earning',
									tooltipPrefix : '$ ',
									spotColor : '#03a9f4',
									valueSpots : {
										'0:' : '#03a9f4'
									}
								});
					};
					lineSparklines2();

					$("#demo-gallery-3").unitegallery({
						slider_enable_text_panel : true,
						slider_enable_bullets : false
					});

					// 전부다 새로고침 해버리기 
					$('#demo-update-interval').on('click', function() {
						$('.demo-pie').each(function() {
							// 여기서 임의의 숫자를 넣어주고 있다 여기서 숫자를 바꿔서 넣자 
							var newVal = Math.floor(100 * Math.random());
							$(this).data('easyPieChart').update(newVal);
						});
					});

					$('#demo-pie-7-1').easyPieChart(
							{
								barColor : '#efb239',
								scaleColor : '#969696',
								trackColor : 'rgba(0,0,0,.1)',
								lineWidth : 7,
								size : 200,
								onStep : function(from, to, percent) {
									$(this.el).find('.pie-value').text(
											Math.round(percent) + '%');
								}
							});

				});
	</script>




	<!--=================================================-->




</body>

</html>