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
<link
	href="${pageContext.request.contextPath }/assets/plugins/unitegallery/css/unitegallery.min.css"
	rel="stylesheet">

<!--DataTables [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/datatables/media/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/plugins/datatables/extensions/Responsive/css/responsive.dataTables.min.css"
	rel="stylesheet">

<!--Morris.js [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/morris-js/morris.min.css" rel="stylesheet">
<!--=================================================

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
							<h4 class="text-main pad-btm bord-btm">select class</h4>
							<br>
							<div class="col-lg-6">
								<div class="panel">

									<!--Carousel-->
									<!--===================================================-->
									<div id="demo-carousel" class="carousel slide"
										cdata-ride="carousel">

										<!--Indicators-->
										<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
									
										<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

										<div id="controlCourseList" class="carousel-inner text-center">

											<!--Item 1-->
											<div class="item active">
												<h4 class="text-main">강좌가 없습니다.</h4>
												<p>Nulla vitae elit libero, a pharetra augue mollis
													interdum.</p>
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
									
									<div class="pad-all" id="reset-graph">
										<div id="demo-morris-line-legend" class="text-center"></div>
										<div id="demo-morris-line" style="height: 250px"></div>
									</div>
									
								</div>
								<div class="demorow">
									<div class="col-lg-6">
										<div class="panel">
											<div class="panel-heading">
												<h3 class="panel-title">최근 과제 제출률</h3>
											</div>
											<div class="panel-body" style="text-align:center">

												<!--Data Percent-->
												<!--===================================================-->
												<div id="demo-pie-7-1" class="demo-pie pie-title-center"
													data-percent="0">
													<span class="pie-value text-thin text-2x"></span>
												</div>
												<!--===================================================-->
												<!-- End Data Percent -->
												<div class="panel-heading"></div>
												<div class="panel-body"></div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 blog">
										<br> <br>
										<!-- Panel  Blog -->
										<!--===================================================-->
										<div class="panel">

											<div id="assignmentPercentInfo" class="blog-header bg-warning pad-all">
												
											</div>
											<div class="blog-content">
												<div class="blog-title media-block">
													<div id="assignmentPercentFileList"
														class="media-right textright">
														<a href="#"
															class="btn btn-icon demo-pli-paperclip icon-lg add-tooltip"
															data-original-title="Add file 22" data-container="body"></a>
													</div>
													<div id="assignmentPercentTitle" class="media-body">
														<a href="#" class="btn-link">
															<h2>최근 과제 1</h2>
														</a>
													</div>
												</div>
												<div id="assignmentPercentContent" class="blog-body">
													<p>최근 과제 내용~~</p>
												</div>
											</div>
											<div class="blog-footer">
												<div id="assignmentPercentRegdate" class="media-left">17 Days ago</div>
											</div>
											<br> <br>
											<button id="demo-update-interval"
												class="btn btn-block  btn-primary">Update Chart</button>
											<br> <br>

										</div>
									</div>
								</div>
								

							</div>
							<div class="col-lg-6">

								<h4>Timeline</h4>

								<!-- Timeline -->
								<!--===================================================-->
								<div class="timeline" id="selectTimelineList">

									<!-- Timeline header -->
									<div class="timeline-header">
										<div class="timeline-header-title bg-primary">Now</div>
									</div>
									<div class="timeline-entry">
										<div class="timeline-stat">
											<div class="timeline-icon"></div>
											<div class="timeline-time"></div>
										</div>
										<div class="timeline-label">
											<span>게시글이 없습니다.</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						
						<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">출제한 과제들</h3>
									</div>
									<div class="panel-body">

										<table class="table table-striped table-bordered"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>코스 이름</th>
													<th>챕터</th>
													<th>타이틀</th>
													<th>파일</th>
													<th>제출일</th>
													<th>제출 마감일</th>
												</tr>
											</thead>
											<tbody id="assignmentListForTeacher">
												<tr>
													<td colspan="6">출제한 과제가 없습니다.</td>
												</tr>
											</tbody>
										</table>
										<br> <br>
									</div>
								</div>
								<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">질의 응답</h3>
							</div>
							<div class="panel-body">

								<table class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>등록일</th>
											<th>과정</th>
											<th>글쓴이</th>
											<th>조회수</th>
											<th>댓글</th>
										</tr>
									</thead>
									<tbody id="selectQnaList">
										<tr>
											<td colspan="7">질문글이 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<br> <br>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<h4>Community</h4>
								<!--===================================================-->
								<!-- End Timeline -->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">Enable title text</h3>
									</div>
									<div class="pad-all">
										<div id="demo-gallery-3" style="display: none;">

											<a href="#"> <img alt="The winding road"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile1.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile1.jpg"
												data-description="The winding road description"
												style="display: none">
											</a> <a href="#"> <img alt="Pancake"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile2.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile2.jpg"
												data-description="A pancake is a flat cake, often thin and round, prepared from a starch-based batter"
												style="display: none">
											</a> <a href="#"> <img alt="Foreshore"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile3.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile3.jpg"
												data-description="The part of a shore between high- and low-water marks, or between the water and cultivated or developed land."
												style="display: none">
											</a> <a href="#"> <img alt="Yellow Flowers"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile4.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile4.jpg"
												data-description="Those are yellow flowers"
												style="display: none">
											</a> <a href="#"> <img alt="Waterfall"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile5.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile5.jpg"
												data-description="A waterfall is a place where water flows over a vertical drop or a series of steep drops in the course of a stream or river."
												style="display: none">
											</a> <a href="#"> <img alt="Pumpkin"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile6.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile6.jpg"
												data-description="A pumpkin is a cultivar of a squash plant, most commonly of Cucurbita pepo, that is round, with smooth, slightly ribbed skin, and deep yellow to orange coloration."
												style="display: none">
											</a> <a href="#"> <img alt="In the jungle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile7.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile7.jpg"
												data-description="This is my car" style="display: none">
											</a> <a href="#"> <img alt="Note"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile8.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile8.jpg"
												data-description="This is a note" style="display: none">
											</a> <a href="#"> <img alt="Off-Road Motorcycle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile9.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile9.jpg"
												data-description="This is a motorcycle"
												style="display: none">
											</a> <a href="#"> <img alt="Adventure"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile10.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile10.jpg"
												data-description="River Adventure Camping"
												style="display: none">
											</a> <a href="#"> <img alt="The winding road"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile1.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile1.jpg"
												data-description="The winding road description"
												style="display: none">
											</a> <a href="#"> <img alt="Pancake"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile2.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile2.jpg"
												data-description="A pancake is a flat cake, often thin and round, prepared from a starch-based batter"
												style="display: none">
											</a> <a href="#"> <img alt="Foreshore"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile3.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile3.jpg"
												data-description="The part of a shore between high- and low-water marks, or between the water and cultivated or developed land."
												style="display: none">
											</a> <a href="#"> <img alt="Yellow Flowers"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile4.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile4.jpg"
												data-description="Those are yellow flowers"
												style="display: none">
											</a> <a href="#"> <img alt="Waterfall"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile5.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile5.jpg"
												data-description="A waterfall is a place where water flows over a vertical drop or a series of steep drops in the course of a stream or river."
												style="display: none">
											</a> <a href="#"> <img alt="Pumpkin"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile6.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile6.jpg"
												data-description="A pumpkin is a cultivar of a squash plant, most commonly of Cucurbita pepo, that is round, with smooth, slightly ribbed skin, and deep yellow to orange coloration."
												style="display: none">
											</a> <a href="#"> <img alt="In the jungle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile7.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile7.jpg"
												data-description="This is my car" style="display: none">
											</a> <a href="#"> <img alt="Note"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile8.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile8.jpg"
												data-description="This is a note" style="display: none">
											</a> <a href="#"> <img alt="Off-Road Motorcycle"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile9.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/tile9.jpg"
												data-description="This is a motorcycle"
												style="display: none">
											</a>
										</div>
									</div>
								</div>

							</div>
							<div class="col-lg-6">
								<h4>CommunityList</h4>
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">Newsfeed</h3>
									</div>
									<div class="nano" style="height: 360px">
										<div class="nano-content">
											<div class="panel-body bord-btm">
												<p class="text-bold text-main text-sm">#68464</p>
												<p class="pad-btm">To achieve this, it would be
													necessary to have uniform grammar, pronunciation and more
													common words.</p>
												<a href="#" class="task-footer"> <span
													class="box-inline"> <label
														class="label label-warning">Feature Request</label> <label
														class="label label-danger">Bug</label>
												</span>
												</a>
											</div>
											<div class="panel-body bord-btm">
												<p class="text-bold text-main text-sm">#45684</p>
												<p class="pad-btm">A small river named Duden flows by
													their place and supplies it with the necessary regelialia.
													It is a paradisematic country, in which roasted parts of
													sentences fly into your mouth.</p>
												<a href="#" class="task-footer"> <span
													class="box-inline"> <span class="pad-rgt"><i
															class="demo-pli-speech-bubble-7"></i> 45</span> <span
														class="pad-rgt"><i class="demo-pli-like"></i> 45</span>
												</span> <span class="text-sm"><i
														class="demo-pli-clock icon-fw text-main"></i>9:25</span>
												</a>
											</div>
											<div class="panel-body bord-btm">
												<p class="text-bold text-main text-sm">#84564</p>
												<div class="task-img">
													<img class="img-responsive" src="img/shared-img-2.jpg"
														alt="Image">
												</div>
												<p class="pad-btm">No one rejects, dislikes, or avoids
													pleasure itself, because it is pleasure.</p>
												<a href="#" class="task-footer"> <span
													class="box-inline"> <span class="pad-rgt"><i
															class="demo-pli-heart-2"></i> 54K</span>
												</span> <span class="text-sm"><i
														class="demo-pli-clock icon-fw text-main"></i>03:08</span>
												</a>
											</div>
											<div class="panel-body bord-btm">
												<p class="text-bold text-main text-sm">#23255</p>
												<p class="pad-btm">The new common language will be more
													simple and regular than the existing European languages.</p>
												<a href="#" class="task-footer"> <span
													class="box-inline"> <img class="img-xs img-circle"
														src="img/profile-photos/8.png" alt="task-user">
														Brenda Fuller
												</span>
												</a>
											</div>
											<div class="panel-body bord-btm">
												<p class="text-bold text-main text-sm">#34522</p>
												<p class="pad-btm">To take a trivial example, which of
													us ever undertakes laborious physical exercise, except to
													obtain some advantage from it?</p>
												<a href="#" class="task-footer"> <span class="text-sm"><i
														class="demo-pli-clock icon-fw text-main"></i>9:25</span>
												</a>
											</div>
											<div class="panel-body bord-btm">
												<p class="text-bold text-main text-sm">#45684</p>
												<p class="pad-btm">A small river named Duden flows by
													their place and supplies it with the necessary regelialia.
													It is a paradisematic country, in which roasted parts of
													sentences fly into your mouth.</p>
												<a href="#" class="task-footer"> <span
													class="box-inline"> <span class="pad-rgt"><i
															class="demo-pli-speech-bubble-7"></i> 45</span> <span
														class="pad-rgt"><i class="demo-pli-like"></i> 45</span>
												</span> <span class="text-sm"><i
														class="demo-pli-clock icon-fw text-main"></i>9:25</span>
												</a>
											</div>
										</div>
									</div>
									<div class="panel-footer text-right">
										<button class="btn btn-sm btn-Default">Load more</button>
										<button class="btn btn-sm btn-primary">View all</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">최근 공지 사항</h3>
							</div>
							<div class="panel-body">

								<!-- 공지사항 리스트 딱 세개만 뽑자 최근 거만  -->
								<table class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>번호</th>
											<th>등록일</th>
											<th>제목</th>
											<th>글쓴이</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody id="selectNotice">
										<tr>
											<td colspan="5">공지사항이 없습니다 .</td>

										</tr>
									</tbody>
								</table>
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
		<c:import url="/WEB-INF/views/includes/otherNavigation.jsp"></c:import>
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
	<script
		src="${pageContext.request.contextPath }/assets/plugins/unitegallery/js/unitegallery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/plugins/unitegallery/themes/slider/ug-theme-slider.js"></script>


	<!--Sparklines [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/sparkline/jquery.sparkline.min.js"></script>



	<!--Easy Pie Chart [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>

	<!--Morris.js [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/morris-js/morris.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/morris-js/raphael-js/raphael.min.js"></script>


	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<script type="text/javascript">
		$(document)
				.on(
						'nifty.ready',
						function() {

							//userNo = '${authUser.userNo}'
							userNo = 2;
							console.log(userNo);

							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/getAssignmentByTeacherNo",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											console.log(list);

										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});
							var courseNo = 1

							$.ajax({
										url : "${pageContext.request.contextPath }/myPage/assignmentAverageList",
										type : "post",
										data : {
											courseNo : courseNo
										},
										dataType : "json",
										success : function(map) {
											console.log(map);
											
											//과제 제출률 
											$("#assignmentPercentInfo").html("<blockquote class='bq-sm bq-open bq-close mar-no'>과제 제출률이 현저히 낮습니다!!222</blockquote>")
											
											//과제 타이틀 
											$("#assignmentPercentTitle").html("<a href='#' class='btn-link'><h2>"+map.lastAssignmentTitle+"</h2></a>")
											
											//과제 내용
											$("#assignmentPercentContent").html("<p>최근 과제 내용~~</p>")
											
											
											//과제 기한
											$("#assignmentPercentRegdate").html("17 Days ago")
											
											
											var aa = $('#demo-pie-7-1').data('percent' );
											console.log(aa);
											
											var avg_data = [];
							                  
							                  for(var i=0; i<map.asList.length; i++){
							                     avg_data.push({'elapsed' : map.asList[i].assignmentTitle, 'value' : map.asList[i].average});
							                  }
							                  console.log(map.asList);
							                  
							                  
							                  
							                  
							                  
							                  console.log(avg_data);
							                  
							                  Morris.Line({
							                     element : 'demo-morris-line',
							                     data : avg_data,
							                     xkey : 'elapsed',
							                     ykeys : [ 'value' ],
							                     labels : [ '평균점수' ],
							                     gridEnabled : true,
							                     gridLineColor : 'rgba(0,0,0,.1)',
							                     gridTextColor : '#8f9ea6',
							                     gridTextSize : '11px',
							                     lineColors : [ '#177bbb' ],
							                     lineWidth : 2,
							                     parseTime : false,
							                     resize : true,
							                     hideHover : 'auto'
							                  });

											// $('.demo-pie').each(function() {
																// 여기서 임의의 숫자를 넣어주고 있다 여기서 숫자를 바꿔서 넣자 
																var newVal = 20 //map.submitPercent;
											//					$(this).data('easyPieChart').update(newVal);
											//				});

										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});
						


							$("#demo-gallery-3").unitegallery({
								slider_enable_text_panel : true,
								slider_enable_bullets : false
							});

							$('#demo-pie-7-1').easyPieChart(
									{
										barColor : '#efb239',
										scaleColor : '#969696',
										trackColor : 'rgba(0,0,0,.1)',
										lineWidth : 7,
										size : 200,
										onStep : function(from, to, percent) {
											$(this.el).find('.pie-value').text(Math.round(percent) + '%');
										}
									});

							//코스 리스트 뽑아서 나열 하자~ 
							CourseList = "";
							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/courseList",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											console.log(list);
											console.log(list.length);

											for (var i = 0; i < list.length; i++) {
												// list 찾기 !!

												CourseList += "<div class='item active'>";
												CourseList += "<h4 class='text-main' data-courseno="+list[i].courseNo+">"+list[i].courseName+"</h4>";
												CourseList += "<p>2010.04.02~2016.05.07</p>";
												CourseList += "<p>";
												CourseList += "<a href=''>이동하기</a>";
												CourseList += "</p>";
												CourseList += "</div>";

											}
											$("#controlCourseList").html(
													CourseList);

											CourseList = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

							//noticeList 
							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/selectNotice",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {

											if (list.length == 0) {
												$("#blogList").html(
														"등록된 게시글이 없습니다.");
											} else {
												str = "";
												for (var i = 0; i < list.length; i++) {
													courseNo = list[i].courseNo
													str += "<tr>"
													str += "<td>"
															+ list[i].rnum
															+ "</td>"
													str += "<td><a class='btn-link' href='${pageContext.request.contextPath }/"+list[i].coursePath+"/notice/read/"+list[i].postNo+"'>["
															+ list[i].category
															+ "]"
															+ list[i].postTitle
															+ "</a></td>"
													str += "<td><span class='text-muted'>"
															+ list[i].regDate
															+ "</span></td>"
													str += "<td><a href='${pageContext.request.contextPath }/${coursePath}/notice/read/"+list[i].postNo+" class='btn-link'>"
															+ list[i].userName
															+ "</a></td>"
													str += "<td>" + list[i].hit
															+ "</td>"
													str += "</tr>"

												}
												$("#selectNotice").html(str);
												str = "";

												/*
												<tr>
												<td>11</td>
												<td>2011/04/25</td>
												<td>Edinburgh</td>
												<td>Tiger Nixon</td>
												<td>11</td>
												</tr>
												 */
											}

										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

							//qna List 
							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/selectQna",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											if (list.length == 0) {
												$("#blogList").html(
														"검색된 게시글이 없습니다.");
											} else {
												str = "";
												for (var i = 0; i < list.length; i++) {

													str += "<tr>"
													str += "<td>"
															+ list[i].rnum
															+ "</td>"
													str += "<td><a class='btn-link' href='${pageContext.request.contextPath }/${coursePath}/notice/read/"+list[i].postNo+"'>["
															+ list[i].subjectTitle
															+ "]"
															+ list[i].postTitle
															+ "</a>&nbsp;&nbsp;<div class='label label-warning'>N</div></td>"
													str += "<td><span class='text-muted'>"
															+ list[i].regDate
															+ "</span></td>"
													str += "<td>"
															+ list[i].subjectTitle
															+ "</td>"
													str += "<td><a href='${pageContext.request.contextPath }/${coursePath}/notice/read/"+list[i].postNo+"' class='btn-link'>"
															+ list[i].userName
															+ "</a></td>"
													str += "<td>" + list[i].hit
															+ "</td>"
													str += "<td><i class='demo-pli-speech-bubble-5 icon-fw'></i>2</td>"
													str += "</tr>"

													/*<tr>
														<td>Tiger Nixon</td>
														<td>System Architect</td>
														<td>Edinburgh</td>
														<td>61</td>
														<td>2011/04/25</td>
														<td>$320,800</td>
														<td>$320,800</td>
													</tr>*/

												}
												$("#selectQnaList").html(str);
												str = "";
											}

										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});
							/* 과제 현황 리스트 
							<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
							</tr>*/

							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/selectTimelineList",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											console.log(list);
											console.log(list.length);

											timelineStr = "";
											timelineStr += "<div class='timeline-header'>";
											timelineStr += "<div class='timeline-header-title bg-primary'>Now</div>";
											timelineStr += "</div>";

											for (var i = 0; i < list.length; i++) {
												// list 찾기 !!

												timelineStr += "<div class='timeline-entry'>";
												timelineStr += "	<div class='timeline-stat'>";
												timelineStr += "		<div class='timeline-icon'></div>";
												timelineStr += "		<div class='timeline-time'>"
														+ list[i].regDate
														+ "</div>";
												timelineStr += "	</div>";
												timelineStr += "	<div class='timeline-label'>";
												timelineStr += "		<p class='mar-no pad-btm'>";
												timelineStr += "		<a href='#' class='btn-link'>알림</a> ";
												timelineStr += "			commented on <a href='#' class='text-semibold'> <i></i>";
												timelineStr += "		</a>";
												timelineStr += "		</p>";
												timelineStr += list[i].timeLineContent
												timelineStr += "	</div>";
												timelineStr += "</div>";
											}
											$("#selectTimelineList").html(
													timelineStr);

											timelineStr = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/getAssignmentByTeacherNo",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											console.log(list);
											assignmentListForTeacherstr = "";
											for (var i = 0; i < list.length; i++) {
												assignmentListForTeacherstr += "<tr>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].courseName
														+ "</td>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].chapterContent
														+ "</td>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].assignmentTitle
														+ "</td>";
												//첨부 파일 
												if (list[i].fileList != null) {
													console
															.log(list[i].fileList);

													if (list[i].fileList.length != 0) {
														assignmentListForTeacherstr += "<td>";
														for (var s = 0; s < list[i].fileList.length; s++) {
															var sa = s + 1;
															assignmentListForTeacherstr += "<a href="+list[i].fileList[s].filePath+" class='text-semibold text-main mar-no'>"
																	+ sa
																	+ "."
																	+ list[i].fileList[s].fileName
																	+ "</a><br>";

														}
														assignmentListForTeacherstr += "</td>";
													} else {
														assignmentListForTeacherstr += "<td>첨부파일이 없습니다.</td>";
													}

												} else {
													assignmentListForTeacherstr += "<td>첨부파일이 없습니다.</td>";
												}
												assignmentListForTeacherstr += "<td>"
														+ list[i].startDate
														+ "</td>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].endDate
														+ "</td>";
												assignmentListForTeacherstr += "</tr>";
											}
											$("#assignmentListForTeacher")
													.html(
															assignmentListForTeacherstr);
											assignmentListForTeacherstr = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

						});
	</script>







</body>

</html>