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
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/ionicons.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">

<!--Animate.css [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/animate.css" rel="stylesheet">

<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>

<!--Bootstrap Validator [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrapValidator.css" rel="stylesheet">

<!--Chosen [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/chosen/chosen.min.css" rel="stylesheet">

<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">

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
						<div class="col-xs-10 col-xs-offset-1">
							<div class="panel">
								<div class="panel-body">
									<div class="col-xs-5 col-xs-offset-1">

										<!-- Panel  Blog -->
										<!--===================================================-->
										<div class="panel">
											<div class="blog-header">
												<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/logo2.svg" alt="Image">
											</div>
										</div>
									</div>
									<div class="cls-content col-lg-4 col-lg-offset-1 mar-rgt">
										<div class="cls-content-sm panel">
											<div class="panel-body">
												<c:if test="${authUser eq null }">
													<div class="mar-ver pad-btm">
														<h1 class="h3">Account Login</h1>
														<p>Sign In to your account</p>
													</div>
													<form action="user/login">
														<input type="hidden" name="url" value="${pageContext.request.contextPath }/index">
														<div class="form-group">
															<input type="text" class="form-control" name="email" placeholder="Email" autofocus>
														</div>
														<div class="form-group">
															<input type="password" name="password" class="form-control" placeholder="Password">
														</div>
														<div class="checkbox pad-btm text-left">
															<input id="demo-form-checkbox" class="magic-checkbox" type="checkbox"> <label for="demo-form-checkbox">Remember me</label>
														</div>
														<button class="btn btn-primary btn-lg btn-block" type="submit">Sign In</button>
													</form>
													<div class="pad-all">
														<a href="#" class="btn-link mar-lft pull-right" data-target='#joinMembershipModal' data-toggle='modal'>회원가입</a>
													</div>
												</c:if>
												
												<c:if test="${authUser ne null }">
													<div class="mar-ver pad-btm">
														<h1 class="h3">${authUser.userName }님 환영합니다!</h1>
													</div>
													<!-- 로그인 유저가 매니저인 경우 -->
													<c:if test="${authUser.userType eq 0 }">
														<div class="mar-ver pad-btm">
															<h1 class="h4">매니저 메뉴</h1>
															<button class="btn-link" data-target='#courseCreate' data-toggle='modal'>코스 생성</button>
														</div>
														
														<div class="mar-ver pad-btm">
															<h1 class="h5">관리중인 강의</h1>
															<div id="demo-carousel" class="carousel slide">
																<div id="indexCourseList" class="carousel-inner text-center">
																	<!--Item 1-->
																	<div class="item active">
																		<h4 class="text-main">강의가 없습니다.</h4>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
													<!-- 로그인 유저가 강사인 경우 -->
													<c:if test="${authUser.userType eq 1 }">
														<div class="mar-ver pad-btm">
															<h1 class="h4">강사 메뉴</h1>
															<a href="${pageContext.request.contextPath }/myPage/index" class="btn-link">mypage</a>
														</div>

														<div class="mar-ver pad-btm">
															<h1 class="h5">진행중인 강의</h1>
															<div id="demo-carousel" class="carousel slide">
																<div id="indexCourseList" class="carousel-inner text-center">
																	<!--Item 1-->
																	<div class="item active">
																		<h4 class="text-main">강의가 없습니다.</h4>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
													
													<!-- 로그인 유저가 학생인 경우 -->
													<c:if test="${authUser.userType eq 2 }">
														<div class="mar-ver pad-btm">
															<h1 class="h4">학생 메뉴</h1>
															<a href="${pageContext.request.contextPath }/myPage/indexforstudent" class="btn-link">mypage</a>
														</div>

														<div class="mar-ver pad-btm">
															<h1 class="h5">진행중인 강의</h1>
															<div id="demo-carousel" class="carousel slide">
																<div id="indexCourseList" class="carousel-inner text-center">

																	<!--Item 1-->
																	<div class="item active">
																		<h4 class="text-main">강의가 없습니다.</h4>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
												</c:if>
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
				</div>
				<!--===================================================-->
				<!--END Page content-->


			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->

		</div>

		<!-- SCROLL PAGE BUTTON -->
		<!--===================================================-->
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>
		<!--===================================================-->
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->
	<div class="modal fade" id="joinMembershipModal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">회원가입</h4>
				</div>
				<!--Modal body-->
				<div class="modal-body container-fluid" >
					<div class="panel">
						<div id="demo-bv-wz">
							<div class="wz-heading pad-top">

								<!--Nav-->
								<ul class="row wz-step wz-icon-bw wz-nav-off mar-top">
									<li class="col-xs-4"><a data-toggle="tab" href="#demo-bv-tab1"> <span class="text-danger"><i class="demo-pli-information icon-2x"></i></span>
											<p class="text-semibold mar-no">Account</p>
									</a></li>
									<li class="col-xs-4"><a data-toggle="tab" href="#demo-bv-tab2"> <span class="text-warning"><i class="demo-pli-male icon-2x"></i></span>
											<p class="text-semibold mar-no">Profile</p>
									</a></li>
									<li class="col-xs-4"><a data-toggle="tab" href="#demo-bv-tab3"> <span class="text-success"><i class="demo-pli-medal-2 icon-2x"></i></span>
											<p class="text-semibold mar-no">Finish</p>
									</a></li>
								</ul>
							</div>

							<!--progress bar-->
							<div class="progress progress-xs">
								<div class="progress-bar progress-bar-primary"></div>
							</div>


							<!--Form-->
							<form id="demo-bv-wz-form" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/joinmember">
								<div class="panel-body">
									<div class="tab-content">

										<!--First tab-->
										<div id="demo-bv-tab1" class="tab-pane">
											<div class="form-group">
												<label class="col-lg-3 control-label">Email</label>
												<div class="col-lg-7">
													<input type="text" class="form-control" name="email" placeholder="Email">
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">Password</label>
												<div class="col-lg-7">
													<input type="password" class="form-control" name="password" placeholder="Password">
												</div>
											</div>
										</div>

										<!--Second tab-->
										<div id="demo-bv-tab2" class="tab-pane fade">
											<div class="form-group">
												<label class="col-lg-3 control-label">이름</label>
												<div class="col-lg-7">
													<input type="text" placeholder="Name" name="userName" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">성별</label>
												<div class="col-lg-7">
													<div class="form-check mar-all">
														<input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="man" checked>
														<label class="form-check-label" for="exampleRadios1">남성 </label>
														<input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="woman">
  														<label class="form-check-label" for="exampleRadios2">여성 </label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">핸드폰 번호</label>
												<div class="col-lg-7">
													<input type="text" placeholder="Phone number" name="phoneNumber" class="form-control">
												</div>
											</div>
										</div>

										<!--Fourth tab-->
										<div id="demo-bv-tab3" class="tab-pane  mar-btm text-center">
											<h4>감사합니다.</h4>
											<p class="text-muted">Finish를 누르면 가입이 완료됩니다. <br>관리자 승인 후 서비스 이용이 가능합니다.</p>
										</div>
									</div>
								</div>

								<!--Footer button-->
								<div class="panel-footer text-right">
									<div class="box-inline">
										<button type="button" class="previous btn btn-primary">이전으로</button>
										<button type="button" class="next btn btn-primary">다음으로</button>
										<button type="submit" class="finish btn btn-warning" disabled>Finish</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<div class="modal fade" id="courseCreate" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">코스 생성</h4>
				</div>
				<!--Modal body-->
				<form action="${pageContext.request.contextPath }/course/create" method="post">
					<div class="modal-body ">
						<div class="panel">
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-5">
										<label class="control-labe"><span class="text-main text-bold mar-no">코스명</span></label>
										<input type="text" class="form-control" name="courseName">
									</div>
									<div class="col-xs-3">
										<label class="control-labe"><span class="text-main text-bold mar-no">강사</span></label>
										<select data-placeholder="Choose a Country..." id="teacher-select" name="teacherNo" tabindex="2">
											
										</select>
									</div>
									<div class="col-xs-2">
										<label class="control-labe"><span class="text-main text-bold mar-no">강의실 번호</span></label>
										<input type="text" class="form-control" name="lecRoomNo">
									</div>
									<div class="col-xs-2">
										<label class="control-labe"><span class="text-main text-bold mar-no">CoursePath</span></label>
										<input type="text" class="form-control" name="coursePath">
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-xs-12">
										<label class="control-labe"><span class="text-main text-bold mar-no">기간</span></label>
										<div class="col-xs-12" id="dp-range">
											<div class="input-daterange input-group" id="datepicker">
												<input type="text" class="form-control" id="subject-edit-start" name="startDate" /> <span class="input-group-addon">to</span> <input type="text" class="form-control" id="subject-edit-end" name="endDate" />
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-xs-12">
										<label class="control-labe"><span class="text-main text-bold mar-no">학생</span></label>
										<select id="student-multiselect" data-placeholder="학생들을 선택해 주세요." multiple tabindex="4" name="userNoList">
										
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
	
					<!--Modal footer-->
					<div class="modal-footer">
						<button class="btn btn-info" type="submit">확인</button>
						<button data-dismiss="modal" class="btn btn-default" type="button">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>
	
	<!--Bootstrap Validator [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrapValidator.js"></script>
	
	<!--Bootstrap Wizard [ OPTIONAL ]-->
    <script src="${pageContext.request.contextPath }/assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
    
    <!--Bootstrap Validator [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/form-wizard.js"></script>
	
	<!-- Chosen [ OPTIONAL ] -->
	<script src="${pageContext.request.contextPath }/assets/plugins/chosen/chosen.jquery.min.js"></script>
	
	<!--Bootstrap Datepicker [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>

</body>

<script type="text/javascript">

	$(document).ready(function() {
		var result = "${param.result}";
		
		if("${authUser}" != null){
			var userNo = "${authUser.userNo}";	
			var userType = "${authUser.userType}";
			
			$.ajax({
				url : "${pageContext.request.contextPath }/index/courselist",
				type : "post",
				data : {
					userNo : userNo,
					userType : userType
				},
				dataType : "json",
				success : function(map) {
					
					if(map.courseList.length > 0) {
						var CourseList = "";
						$("#indexCourseList").empty();
						
						for (var i = 0; i < map.courseList.length; i++) {
							// list 찾기 !!
							if(i == 0){
								CourseList += "<div class='item active'>";
							}else {
								CourseList += "<div class='item'>";
							}
	
							CourseList += "<h4 class='text-main'>" + map.courseList[i].courseName + "</h4>";
							CourseList += "<p>" + map.courseList[i].startDate + " ~ " + map.courseList[i].endDate + "</p>";
							if(userType == 0){
								CourseList += "<button class='btn-link' data-target='#joinMembershipModal' data-toggle='modal' data-courseno='" + map.courseList[i].courseNo + "'>관리하기</button>";
							}
							else {
								CourseList += "<a href='" + map.courseList[i].coursePath + "/main' class='btn-link'>이동하기</a>";
							}
							CourseList += "</div>";
	
							$("#indexCourseList").append(CourseList);
							
							CourseList = "";
						}
						$("#indexCourseList").append("<a class='carousel-control left' data-slide='prev' href='#demo-carousel'> <i class='demo-pli-arrow-left icon-2x'></i></a> ");
						$("#indexCourseList").append("<a class='carousel-control right' data-slide='next' href='#demo-carousel'> <i class='demo-pli-arrow-right icon-2x'></i></a>");
						
					}
					if(userType == 0){
						
						for(var i = 0; i < map.teacherList.length; i++){
							if(i == 0){
								$("#teacher-select").append("<option value='" + map.teacherList[i].userNo + "' selected='selected'>" + map.teacherList[i].userName + "</option>");
							}else{
								$("#teacher-select").append("<option value='" + map.teacherList[i].userNo + "' >" + map.teacherList[i].userName + "</option>");
							}
						}
						$('#teacher-select').chosen({width:'100%'});
						
						for(var i = 0; i < map.studentList.length; i++){
							$("#student-multiselect").append("<option value='" + map.studentList[i].userNo + "' >" + map.studentList[i].userName + "(" + map.studentList[i].email + ")</option>");
						}
						$('#student-multiselect').chosen({width:'100%'});
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
		if(result != null){
			if(result == 1){
				callNoty("info", "ion-alert", "top-right", 2500, "회원가입 성공", "회원가입을 성공 하였습니다.", "zoomIn", "fadeOut");
			}
		}
	});
	
	$('#dp-range .input-daterange').datepicker({
		format : "yyyy-mm-dd",
		todayBtn : "linked",
		autoclose : false,
		todayHighlight : false
	});
	
	function callNoty(color, icon, position, time, title, message, animationIn, animationOut){
		var notyContent = "";
		
		notyContent += "<div class='media-left'>";
		notyContent += "	<span class='icon-wrap icon-wrap-xs icon-circle alert-icon'>";
		notyContent += "		<i class='" + icon + " icon-2x'></i>";
		notyContent += "	</span>";
		notyContent += "</div>";
		notyContent += "<div class='media-body'>";
		notyContent += "	<h4 class='alert-title'>" + title + "</h4>";
		notyContent += "	<p class='alert-message'>" + message + "</p>";
		notyContent += "</div>";
		
		
		$.niftyNoty({
			type : color,
			container : 'floating',
			floating    : {
                position    : position,
                animationIn : animationIn,
                animationOut: animationOut
            },
            html : notyContent,
            closeBtn    : true,
			timer : time
		});
	}
</script>

</html>
