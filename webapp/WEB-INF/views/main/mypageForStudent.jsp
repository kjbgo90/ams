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

<title>AMS - MyPage</title>


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
							<div class="col-lg-6">
								<br> <br>
								<div class="panel">

									<!--Carousel-->
									<!--===================================================-->
									<div id="demo-carousel" class="carousel slide"
										cdata-ride="carousel">
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
								</br>

								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">제출 현황</h3>
									</div>
									<div class="panel-body">

										<table id="" class="table table-striped table-bordered"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>과제</th>
													<th>첨부 파일</th>
													<th>제출 기한</th>
													<th>제출한 날짜</th>
													<th>제출 여부</th>
													<th>점수 여부</th>
												</tr>
											</thead>
											<tbody id="assignmentList">
												<tr>
													<td colspan="6">제출한 과제가 없습니다.</td>
												</tr>
											</tbody>
										</table>
										<br> <br>
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
								<div class="panel">
									<div class="panel-heading"></div>
									<div class="pad-all">
										<div id="demo-gallery-3" style="display: none;">

											<a
												href="${pageContext.request.contextPath }/community/selectform?cpostType=1">
												<img alt="맛집"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile1.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/KakaoTalk_Image_2019-06-25-19-32-52.jpeg"
												data-description="강남역 주변 맛집 커뮤니티" style="display: none">
											</a> <a
												href="${pageContext.request.contextPath }/community/selectform?cpostType=2">
												<img alt="카페"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile2.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/cafe2.jpeg"
												data-description="강남역 주변 카페 커뮤니티" style="display: none">
											</a> <a
												href="${pageContext.request.contextPath }/community/selectform?cpostType=3">
												<img alt="자유게시판"
												src="${pageContext.request.contextPath }/assets/img/gallery/thumbs/tile3.jpg"
												data-image="${pageContext.request.contextPath }/assets/img/gallery/big/teamproject.jpg"
												data-description="" style="display: none">
											</a>
										</div>
									</div>
									<div class="panel-footer"></div>
								</div>

							</div>
							<div class="col-lg-6">
								<h4>CommunityList</h4>
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title">Newsfeed</h3>
									</div>
									<div class="nano" style="height: 360px">
										<div id="communityStrList" class="nano-content"></div>
									</div>
									<div class="panel-footer text-right">
										<button class="btn btn-sm btn-primary"
											onclick="location.href='${pageContext.request.contextPath}/community/mainform'">
											View all</button>
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





	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<script>
		$(document)
				.on(
						'nifty.ready',
						function() {

							var userNo = '${authUser.userNo}';
							var userType = '${authUser.userType}';
							console.log(userNo);

							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/selectAssignmentList",
										type : "post",
										dataType : "json",
										success : function(list) {
											console.log(list);
											console.log(list.length);

											if (list.length != 0) {
												assignmentListStr = "";
												if (list.length > 3) {
													for (var i = 0; i < 3; i++) {
														console.log(i);
														assList(list[i]);
													}
													$("#assignmentList").html(
															assignmentListStr)
												} else {
													for (var i = 0; i < list.length; i++) {
														console.log(i);
														assList(list[i]);
													}
													$("#assignmentList").html(
															assignmentListStr)

												}
											} else {
												console.log("empty!!");
											}

											assignmentListStr = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

							$
									.ajax({
										url : "${pageContext.request.contextPath }/index/courselist",
										type : "post",
										data : {
											userNo : userNo,
											userType : userType
										},
										dataType : "json",
										success : function(map) {
											console.log(map.courseList);
											console.log(map.courseList.length);

											if (map.courseList.length > 0) {
												var CourseList = "";
												$("#controlCourseList").empty();

												for (var i = 0; i < map.courseList.length; i++) {
													// list 찾기 !!
													if (i == 0) {
														CourseList += "<div class='item active'>";
													} else {
														CourseList += "<div class='item'>";
													}

													CourseList += "<h4 class='text-main'>"
															+ map.courseList[i].courseName
															+ "</h4>";
													CourseList += "<p>"
															+ map.courseList[i].startDate
															+ " ~ "
															+ map.courseList[i].endDate
															+ "</p>";
													if (userType == 0) {
														CourseList += "<button class='btn-link' data-target='#joinMembershipModal' data-toggle='modal' data-courseno='" + map.courseList[i].courseNo + "'>관리하기</button>";
													} else {
														CourseList += "<a href='${pageContext.request.contextPath }/" + map.courseList[i].coursePath + "/main' class='btn-link'>이동하기</a>";
													}
													CourseList += "</div>";

													$("#controlCourseList")
															.append(CourseList);

													CourseList = "";
												}
												$("#controlCourseList")
														.append(
																"<a class='carousel-control left' data-slide='prev' href='#demo-carousel'> <i class='demo-pli-arrow-left icon-2x'></i></a> ");
												$("#controlCourseList")
														.append(
																"<a class='carousel-control right' data-slide='next' href='#demo-carousel'> <i class='demo-pli-arrow-right icon-2x'></i></a>");

											}
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

							var lineSparklines2 = function() {
								$('#demo-sparklines-line-1-1').sparkline(
										[ 945, 754, 805, 855, 678, 987, 1026,
												885, 878, 922, 875, ], {
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
							$('#demo-update-interval')
									.on(
											'click',
											function() {
												$('.demo-pie')
														.each(
																function() {
																	// 여기서 임의의 숫자를 넣어주고 있다 여기서 숫자를 바꿔서 넣자 
																	var newVal = Math
																			.floor(100 * Math
																					.random());
																	$(this)
																			.data(
																					'easyPieChart')
																			.update(
																					newVal);
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

							//코스 리스트 뽑아서 나열 하자~ 

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
													str += "<td><a class='btn-link' href='${pageContext.request.contextPath }/"+list[i].coursePath+"/notice/read/"+list[i].postNo+"'>["
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
													str += "<td><i class='demo-pli-speech-bubble-5 icon-fw'></i>"
															+ list[i].replyCount
															+ "</td>"
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

						});

		/*
		<th>과제</th>
		<th>과제내용</th>
		<th>첨부 파일</th>
		<th>제출 기한</th>
		<th>제출 여부</th>
		<th>점수 여부</th>
		 */
		function assList(SubmitVo) {

			assignmentListStr += "<tr>";
			assignmentListStr += "<td>" + SubmitVo.assignmentTitle + "</td>";

			if (SubmitVo.fileList != null) {
				console.log(SubmitVo.fileList);

				if (SubmitVo.fileList.length != 0) {
					assignmentListStr += "<td>";
					for (var s = 0; s < SubmitVo.fileList.length; s++) {

						assignmentListStr += "<a href="+SubmitVo.fileList[s].filePath+" class='text-semibold text-main mar-no'>"
								+ SubmitVo.fileList[s].fileName + "</a><br>";

					}
					assignmentListStr += "</td>";
				} else {
					assignmentListStr += "<td>첨부파일이 없습니다.</td>";
				}

			} else {
				assignmentListStr += "<td>첨부파일이 없습니다.</td>";
			}

			assignmentListStr += "<td>" + SubmitVo.assignmentTitle + "</td>";
			if (SubmitVo.submitNo != 0) {
				assignmentListStr += "<td>" + SubmitVo.submitDate + "</td>";
				assignmentListStr += "<td>" + SubmitVo.scoreCheck + "</td>";
				if (SubmitVo.scoreCheck == 'true') {
					assignmentListStr += "<td>" + SubmitVo.score + "</td>";
				} else {
					assignmentListStr += "<td>미채점</td>";
				}

			} else {
				assignmentListStr += "<td> 미제출 </td>";

				//${pageContext.request.contextPath }/"+coursePath+"/assignment/list

				assignmentListStr += "<td colspan ='2'><a href='#'>제출하러 가기</a></td>";

				var courseNo = SubmitVo.courseNo;

				$
						.ajax({
							url : "${pageContext.request.contextPath }/myPage/selectCoursePath",
							type : "post",
							data : {
								courseNo : courseNo
							},
							dataType : "json",
							success : function(postVo) {
								console.log("coursePath")
								var coursePath = postVo.coursePath;
								console.log(coursePath);

							},
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});

			}

			assignmentListStr += "</tr>";
		}
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							console
									.log("---------------------load community info-------------------");
							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/selectCommunity",
										type : "post",

										dataType : "json",
										success : function(list) {
											$("#communityStrList").empty();

											for (var i = 0; i < list.length; i++) {
												renderCommunityPost(list[i]);
											}
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});
						})

		function renderCommunityPost(communityVo) {

			str = '';
			str += '<div class="panel-body bord-btm">';
			str += '   <p class="text-bold text-main text-sm">#'
					+ communityVo.cpostNo + '</p>';
			str += '   <p class="pad-btm">' + communityVo.cpostTitle + '</p>'
			str += '   <a href="#" class="task-footer">'
			str += '      <span class="box-inline">'
			str += '         <span class="pad-rgt"><i class="demo-pli-speech-bubble-7"></i>'
					+ communityVo.replyCount + '</span>';
			str += '         <span class="pad-rgt"><i class="demo-pli-like"></i>'
					+ communityVo.liked + '</span>'
			str += '      </span>'
			str += '      <span class="text-sm"><i class="demo-pli-clock icon-fw text-main"></i>'
					+ communityVo.regDate + '</span>'
			str += '   </a>'
			str += '</div>'

			$("#communityStrList").append(str);
		}
	</script>


	<!--=================================================-->




</body>

</html>