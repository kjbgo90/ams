<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Blog | Nifty - Admin Template</title>
<!--STYLESHEET-->
<!--=================================================-->
<!--나눔 고딕 Font [ OPTIONAL ] -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">
<!--=================================================-->
<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>
<!--Bootstrap Select [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
<!--Select2 [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/select2/css/select2.min.css" rel="stylesheet">
<!--Morris.js [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/morris-js/morris.min.css" rel="stylesheet">
<!--=================================================

    REQUIRED
    You must include this in your project.


    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.


    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.


    DEMONSTRATION
    This is to be removed, used for demonstration purposes only. This category must not be included in your project.


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
		<!--===================================================-->
		<!-- content -->
		<div class="boxed">
			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				<div id="page-head">
					<!--Page Title-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<div id="page-title">
						<h1 class="page-header text-overflow">과제 게시판</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->
					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">App</a></li>
						<li class="active">통계</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->
				</div>

				<!--Page content-->
				<!--===================================================-->
				<input id="courseNo" type="hidden" value="${courseVo.courseNo}">
				<div id="page-content">
					<div class="col-xs-3">
						<div class="panel">
							<p class="pad-hor text-main text-bold text-lg text-uppercase" id="assignTitle" style="padding-top: 15px;">JAVA 웹개발자 고급과정</p>
							<div class="list-group" id="userList">
								<a class="list-group-item list-item-sm" id="statisticMain" href=""> <span class="media-left" style="padding-top: 4px; padding-right:7px;">
								<button class="btn btn-dark btn-icon btn-circle"><i class="pli-male-female"></i></button>
								</span> <span class="media-body text-left" style="padding-top: 12px;"> <span class="text-bold">전체보기</span>
								</span>
								</a>
								
								<c:forEach items="${userList }" var="userVo">
									<a class="list-group-item list-item-sm" id="userClick" data-userno="${userVo.userNo}" href=""> <span
										class="media-left" style="padding-top: 4px;"> <img src="${pageContext.request.contextPath }${userVo.logoPath}" class="img-circle img-xs" alt="Profile Picture">
									</span> <span class="media-body text-left" style="padding-top: 3px;"> <span class="text-bold">${userVo.userName }</span><br> <small class="text-muted">${userVo.email }</small>
									</span>
									</a> 
								</c:forEach>
								
							</div>
						</div>
					</div>
					<div class="col-xs-9">
						<div class="row">
							<div class="col-xs-8">
								<!-- Line Chart -->
								<!---------------------------------->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title text-main text-bold">과제별 평균 점수</h3>
									</div>
									<div class="pad-all" id="reset-graph">
										<div id="demo-morris-line-legend" class="text-center"></div>
										<div id="demo-morris-line" style="height: 250px"></div>
									</div>
									<!--Chart information-->
									<div class="panel-body">
										<div class="row">
											<div class="col-xs-8">
												<p class="text-bold text-uppercase text-main text-lg" style="padding-left:10px;">전체 평균</p>
												<div class="col-xs-5">
													<div class="media">
														<span class="text-4x text-thin text-main" id="totalAverage"></span> <span class="mar-no text-lg"> / 100</span>
													</div>
												</div>
												<div class="col-xs-7">
													<p>
														<span class="text-lg">최고 점수</span> <span class="pad-lft text-semibold text-lg"> <span class="text-lg" id="maxAverage"></span> <span class="labellabel-danger mar-lft"> <i
																class="pci-caret-up text-danger"></i> <span id="max-avg"></span>
														</span>
														</span>
													</p>
													<p>
														<span class="text-lg">최저 점수</span> <span class="pad-lft text-semibold text-lg"> <span class="text-lg" id="minAverage"></span> <span class="labellabel-success mar-lft"> <i
																class="pci-caret-down text-success"></i> <span id="avg-min"></span>
														</span>
														</span>
													</p>
												</div>
												<hr>
											</div>
											<div class="col-xs-4">
												<p class="text-uppercase text-main text-bold">최근 과제</p>
												<ul class="list-unstyled">
													<li>
														<div class="media pad-btm">
															<span class="text-2x text-thin text-main" id="lastAssignmentTitle"></span>
														</div>
													</li>
													<li class="pad-btm">
														<div class="clearfix">
															<p class="pull-left mar-no">제출</p>
															<p class="pull-right mar-no" id="submitPercent"></p>
														</div>
														<div class="progress progress-sm">
															<div class="progress-bar progress-bar-info" style="width: 0%;" id="progress-bar-submit">
																<span class="sr-only" id="submitProgress"></span>
															</div>
														</div>
													</li>
													<li>
														<div class="clearfix">
															<p class="pull-left mar-no">미제출</p>
															<p class="pull-right mar-no" id="unsubmitPercent"></p>
														</div>
														<div class="progress progress-sm">
															<div class="progress-bar progress-bar-danger" style="width: 0%;" id="progress-bar-unsubmit">
																<span class="sr-only" id="unsubmitProgress"></span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="panel pad-btm">
									<div class="panel-heading">
										<h3 class="panel-title text-main text-bold">질문이 많은 과목</h3>
									</div>
									<div class="panel-body pad-no" id="qnaList">
										<div class="panel col-xs-4" style="text-align: center;">
											<div class="panel-heading">
												<h3 class="panel-title">JAVA프로그래밍</h3>
											</div>
											<!--Thick-->
											<!--===================================================-->
											<div id="demo-pie-1" class="demo-pie pie-title-center" data-percent="50">
												<span class="pie-value text-thin text-2x"></span>
											</div>
											<!--===================================================-->
											<!-- End Thick -->
										</div>
										<div class="col-xs-4" style="text-align: center;">
											<div class="panel-heading">
												<h3 class="panel-title">데이터구조</h3>
											</div>
											<!--Thick-->
											<!--===================================================-->
											<div id="demo-pie-2" class="demo-pie pie-title-center" data-percent="35">
												<span class="pie-value text-thin text-2x"></span>
											</div>
											<!--===================================================-->
											<!-- End Thick -->
										</div>
										<div class="col-xs-4" style="text-align: center;">
											<div class="panel-heading">
												<h3 class="panel-title">Oracle</h3>
											</div>
											<!--Thick-->
											<!--===================================================-->
											<div id="demo-pie-3" class="demo-pie pie-title-center" data-percent="15">
												<span class="pie-value text-thin text-2x"></span>
											</div>
											<!--===================================================-->
											<!-- End Thick -->
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-4">
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title text-main text-bold">수업 이해도</h3>
									</div>
									<div id="reset-donut" class="panel-body" style="text-align: center;">
										<!-- Donut Chart -->
										<!---------------------------------->
										<div id="demo-morris-donut" class="morris-donut" style="height: 220px;"></div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title text-main text-bold">
											<span>Feedback</span>
											<span class="label label-default pull-right mar-top">미응답</span>
											<span class="label label-warning pull-right mar-top">NO</span>
											<span class="label label-dark pull-right mar-top">YES</span>
										</h3>
									</div>
									<div class="panel-body" id="feedbackList">
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
		<!-- /content -->
		<!--===================================================-->
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
		<!-- FOOTER -->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->
	</div>
	<!-- SCROLL PAGE BUTTON -->
	<!--===================================================-->
	<button class="scroll-top btn">
		<i class="pci-chevron chevron-up"></i>
	</button>
	<!--===================================================-->
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
	<!--=================================================-->
	<!--Bootstrap Select [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<!--Select2 [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/select2/js/select2.min.js"></script>
	<!--Morris.js [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/morris-js/morris.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/morris-js/raphael-js/raphael.min.js"></script>
	<!--Easy Pie Chart [ OPTIONAL ]-->
    <script src="${pageContext.request.contextPath }/assets/plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>
	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<!-- blog-edit 에서 스크립트 페이지 찾기 sample page 안에 있음  -->
	<script type="text/javascript">
	
		$(document).ready(function() {
			console.log("통계 페이지 실행");
			var courseNo = $("#courseNo").val();
			console.log(courseNo);
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/statistic/main",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({courseNo : courseNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log("통계 메인 출력");
						
						$("#totalAverage").text(response.data.totalAverage);
						$("#maxAverage").text(response.data.maxAverage);
						$("#minAverage").text(response.data.minAverage);
						$("#max-avg").text(Math.round((response.data.maxAverage-response.data.totalAverage)*100)/100);
						$("#avg-min").text(Math.round((response.data.totalAverage-response.data.minAverage)*100)/100);
						$("#lastAssignmentTitle").text(response.data.lastAssignmentTitle);
						$("#submitPercent").text(response.data.submitPercent+"%");
						$("#submitProgress").text(response.data.submitPercent+"% Complete");
						$("#progress-bar-submit").attr("style", "width:" + response.data.submitPercent + "%;");
						$("#unsubmitPercent").text(response.data.unsubmitPercent+"%");
						$("#unsubmitProgress").text(response.data.unsubmitPercent+"% Complete");
						$("#progress-bar-unsubmit").attr("style", "width:" + response.data.unsubmitPercent + "%;");
						
						var avg_data = [];
						
						for(var i=0; i<response.data.asList.length; i++){
							avg_data.push({'elapsed' : response.data.asList[i].assignmentTitle, 'value' : response.data.asList[i].average});
						}
						console.log(response.data.asList);
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
						
						$("#feedbackList").empty();
						for(var i=0; i<response.data.feedbackList.length; i++){
							renderFeedback(response.data.feedbackList[i]);
						}
						
						Morris.Donut({
					        element: 'demo-morris-donut',
					        data: [
					            {label: 'NO', value: response.data.totalNoPercent},
					            {label: 'YES', value: response.data.totalYesPercent},
					            {label: '미응답', value: response.data.totalNonResponsePercent}
					        ],
					        colors: [
					            '#ec407a',
					            '#03a9f4',
					            '#d8dfe2'
					        ],
					        resize:true
					    });
						
						$("#qnaList").empty();
						console.log(response.data.qnaList.length)
						for(var i=0; i<response.data.qnaList.length; i++){
							renderQnaList(response.data.qnaList[i]);
							
							if( i == 0){
								$('#demo-pie-' + response.data.qnaList[i].subjectNo).easyPieChart({
									barColor :'#ab47bc',
							        scaleColor: false,
							        trackColor : 'rgba(0,0,0,.1)',
							        lineWidth : 10,
							        size : 130,
							        onStep: function(from, to, percent) {
							            $(this.el).find('.pie-value').text(Math.round(percent) + '%');
							        }
								 });
							} else if ( i == 1){
								$('#demo-pie-' + response.data.qnaList[i].subjectNo).easyPieChart({
									barColor :'#8bc34a',
							        scaleColor: false,
							        trackColor : 'rgba(0,0,0,.1)',
							        lineWidth : 10,
							        size : 130,
							        onStep: function(from, to, percent) {
							            $(this.el).find('.pie-value').text(Math.round(percent) + '%');
							        }
								 });
							} else if ( i == 2){
								$('#demo-pie-' + response.data.qnaList[i].subjectNo).easyPieChart({
									barColor :'#ffb300',
							        scaleColor: false,
							        trackColor : 'rgba(0,0,0,.1)',
							        lineWidth : 10,
							        size : 130,
							        onStep: function(from, to, percent) {
							            $(this.el).find('.pie-value').text(Math.round(percent) + '%');
							        }
								 });
							}
						}
					} else {
						console.log("통계 메인 출력 실패");
					}

				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
	
		$("#statisticMain").on("click", function(){
			event.preventDefault();
			console.log("통계 페이지 실행");
			var courseNo = $("#courseNo").val();
			console.log(courseNo);
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/statistic/main",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({courseNo : courseNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log("통계 메인 출력");
						
						$("#totalAverage").text(response.data.totalAverage);
						$("#maxAverage").text(response.data.maxAverage);
						$("#minAverage").text(response.data.minAverage);
						$("#max-avg").text(Math.round((response.data.maxAverage-response.data.totalAverage)*100)/100);
						$("#avg-min").text(Math.round((response.data.totalAverage-response.data.minAverage)*100)/100);
						$("#lastAssignmentTitle").text(response.data.lastAssignmentTitle);
						$("#submitPercent").text(response.data.submitPercent+"%");
						$("#submitProgress").text(response.data.submitPercent+"% Complete");
						$("#progress-bar-submit").attr("style", "width:" + response.data.submitPercent + "%;");
						$("#unsubmitPercent").text(response.data.unsubmitPercent+"%");
						$("#unsubmitProgress").text(response.data.unsubmitPercent+"% Complete");
						$("#progress-bar-unsubmit").attr("style", "width:" + response.data.unsubmitPercent + "%;");
						
						var avg_data = [];
						
						for(var i=0; i<response.data.asList.length; i++){
							avg_data.push({'elapsed' : response.data.asList[i].assignmentTitle, 'value' : response.data.asList[i].average});
						}
						console.log(response.data.asList);
						console.log(avg_data);
						
						$("#reset-graph").empty();
						var str = "";
						str += "<div id='demo-morris-line-legend' class='text-center'></div>";
						str += "<div id='demo-morris-line' style='height: 250px'></div>";
						$("#reset-graph").append(str);
						
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
						
						$("#feedbackList").empty();
						for(var i=0; i<response.data.feedbackList.length; i++){
							renderFeedback(response.data.feedbackList[i]);
						}
						
						$("#reset-donut").empty();
						var resetDonut ="";
						resetDonut += "<div id='demo-morris-donut' class='morris-donut' style='height: 220px;'></div>";
						$("#reset-donut").append(resetDonut);
						
						Morris.Donut({
					        element: 'demo-morris-donut',
					        data: [
					            {label: 'NO', value: response.data.totalNoPercent},
					            {label: 'YES', value: response.data.totalYesPercent},
					            {label: '미응답', value: response.data.totalNonResponsePercent}
					        ],
					        colors: [
					            '#ec407a',
					            '#03a9f4',
					            '#d8dfe2'
					        ],
					        resize:true
					    });
						
						$("#qnaList").empty();
						console.log(response.data.qnaList.length)
						for(var i=0; i<response.data.qnaList.length; i++){
							renderQnaList(response.data.qnaList[i]);
							
							if( i == 0){
								$('#demo-pie-' + response.data.qnaList[i].subjectNo).easyPieChart({
									barColor :'#ab47bc',
							        scaleColor: false,
							        trackColor : 'rgba(0,0,0,.1)',
							        lineWidth : 10,
							        size : 130,
							        onStep: function(from, to, percent) {
							            $(this.el).find('.pie-value').text(Math.round(percent) + '%');
							        }
								 });
							} else if ( i == 1){
								$('#demo-pie-' + response.data.qnaList[i].subjectNo).easyPieChart({
									barColor :'#8bc34a',
							        scaleColor: false,
							        trackColor : 'rgba(0,0,0,.1)',
							        lineWidth : 10,
							        size : 130,
							        onStep: function(from, to, percent) {
							            $(this.el).find('.pie-value').text(Math.round(percent) + '%');
							        }
								 });
							} else if ( i == 2){
								$('#demo-pie-' + response.data.qnaList[i].subjectNo).easyPieChart({
									barColor :'#ffb300',
							        scaleColor: false,
							        trackColor : 'rgba(0,0,0,.1)',
							        lineWidth : 10,
							        size : 130,
							        onStep: function(from, to, percent) {
							            $(this.el).find('.pie-value').text(Math.round(percent) + '%');
							        }
								 });
							}
						}
					} else {
						console.log("통계 메인 출력 실패");
					}

				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		$("#userList").on("click", "#userClick", function(){
			event.preventDefault();
			console.log("학생 클릭");
			
			var $this = $(this);
			var userNo = $this.data("userno");

			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/statistic/student",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({userNo : userNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						
					} else {
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		function renderFeedback(feedbackVo){
			var str = "";
			
			str += "<div>";
			str += "<p>Q." + feedbackVo.fbqContent + "<br>Subject: " + feedbackVo.subjectTitle + "<br>Chapter: " + feedbackVo.chapterContent + "</p>";
			str += "<div class='progress progress-lg'>";
			str += "	<div style='width: " + feedbackVo.yesPercent + "%;' class='progress-bar progress-bar-dark'>" + feedbackVo.yesPercent + "%</div>";
			str += "	<div style='width: " + feedbackVo.noPercent + "%' class='progress-bar progress-bar-warning'>" + feedbackVo.noPercent + "%</div>";
			str += "</div>";
			str += "<br>";
			str += "</div>";

			$("#feedbackList").append(str);
		}
		
		function renderQnaList(qnaVo){
			var str = "";
			
			str += "<div class='panel col-xs-4' style='text-align: center;'>";
			str += "	<div class='panel-heading'>";
			str += "		<h3 class='panel-title'>" + qnaVo.subjectTitle + "</h3>";
			str += "	</div>";
			str += "	<div id='demo-pie-" + qnaVo.subjectNo + "' class='demo-pie pie-title-center' data-percent=" + qnaVo.qnaPercent + ">";
			str += "		<span class='pie-value text-thin text-2x'></span>";
			str += "	</div>";
			str += "</div>";

			$("#qnaList").append(str);
		}
		
	</script>
</body>
</html>
