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

<title>Manage Posts | Nifty - Admin Template</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--나눔 고딕 Font [ OPTIONAL ] -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">


<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/ionicons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">


<!--=================================================-->

<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>


<!--Animate.css [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/animate.css" rel="stylesheet">

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

		<div class="boxed">



			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				<div id="page-head">

					<!--Page Title-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<div id="page-title">
						<h1 class="page-header text-overflow">과목관리</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">교육과정 </a></li>
						<li class="active">과목관리</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->


				</div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">


					<!-- Search -->
					<!--===================================================-->


					<!-- Toolbar -->
					<!--===================================================-->

					<div class="panel">
						<div class="panel-heading"></div>
						<div class="panel-body  col-sm-3">
							<div class="pad-btm form-inline">
								<div class="row">
									<div class="col-sm-6 table-toolbar-left">
										<span style="font-size: 20px;">과목</span>


									</div>
									<div class="col-sm-6 table-toolbar-right">
										<button id="demo-btn-addrow" class="btn btn-purple" data-target="#subject-regist-modal" data-toggle="modal">
											<i class="demo-pli-add"></i> 과목등록
										</button>

									</div>
								</div>
							</div>
							<div class="table-responsive">
								<div class="panel">
									<!-- <div class="panel-heading">
					                 <h3 class="panel-title">챕터명</h3>
					            </div> -->

									<!--Hover Rows-->
									<!--===================================================-->

									<table class="table table-hover table-vcenter" style="border: 1px solid #b3b3b3">
										<thead>
											<tr>

												<th>과목명</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><span class="text-main text-semibold">Java프로그래밍</span> <br> <small class="text-muted">2019-03-04 - 2019-03-15</small></td>
												<td><i class="btn btn-circle pad-no pli-gear" data-target="#subject-edit-modal" data-toggle="modal"></i></td>
											</tr>
											<tr>
												<td><span class="text-main text-semibold">데이터구조와 알고리즘</span> <br> <small class="text-muted">2019-03-04 - 2019-03-15</small></td>
												<td><i class="btn btn-circle pad-no pli-gear" data-target="#subject-edit-modal" data-toggle="modal"></i></td>
											</tr>
											<tr>
												<td><span class="text-main text-semibold">Oracle</span> <br> <small class="text-muted">2019-03-04 - 2019-03-15</small></td>
												<td><i class="btn btn-circle pad-no pli-gear" data-target="#subject-edit-modal" data-toggle="modal"></i></td>
											</tr>
											<tr>
												<td><span class="text-main text-semibold">Spring_Jsp</span> <br> <small class="text-muted">2019-03-04 - 2019-03-15</small></td>
												<td><i class="btn btn-circle pad-no pli-gear" data-target="#subject-edit-modal" data-toggle="modal"></i></td>
											</tr>
											<tr>
												<td><span class="text-main text-semibold">리눅스 시스템관리</span> <br> <small class="text-muted">2019-03-04 - 2019-03-15</small></td>
												<td><i class="btn btn-circle pad-no pli-gear" data-target="#subject-edit-modal" data-toggle="modal"></i></td>
											</tr>
											<tr>
												<td><span class="text-main text-semibold">아마존 웹 서비스(AWS)</span> <br> <small class="text-muted">2019-03-04 - 2019-03-15</small></td>
												<td><i class="btn btn-circle pad-no pli-gear" data-target="#subject-edit-modal" data-toggle="modal"></i></td>
											</tr>
										</tbody>
									</table>

									<!--===================================================-->
									<!--End Hover Rows-->

								</div>
							</div>
						</div>

						<div class="panel-body  col-sm-9">
							<div class="pad-btm form-inline">
								<div class="row">
									<div class="col-sm-6 table-toolbar-left">
										<span style="font-size: 20px;">챕터</span>

									</div>
									<div class="col-sm-6 table-toolbar-right">
										<button id="demo-btn-addrow" class="btn btn-purple" data-target="#chapter-regist-modal" data-toggle="modal">
											<i class="demo-pli-add"></i> 챕터등록
										</button>
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-striped" border="1" style="border: 1px solid #b3b3b3">
									<thead>
										<tr>
											<th>챕터명</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><span>01.sprint_시작하기</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal">[편집]</a></td>
										</tr>
										<tr>
											<td><span>02.sprint_주요어노테이션</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
										</tr>
										<tr>
											<td><span>03.sprint_mybatis</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal">[편집]</a></td>
										</tr>
										<tr>
											<td><span>04.sprint_어플리케이션_어키텍쳐</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
										</tr>
										<tr>
											<td><span>05.자바스트립_jquery_ajax</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
										</tr>
										<tr>
											<td><span>06.첨부파일_MutipartResolver</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
										</tr>
										<tr>
											<td><span>07.트렌젝션_페이징</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
										</tr>
										<tr>
											<td><span>08.interceptor_Annotation활용</span></td>
											<td><a class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--===================================================-->
						<!--End Data Table-->

						<div class="row pad-btm"></div>
						<!--Posts Table-->
						<!--===================================================-->
						<div class="panel-body" style="padding-left: 79px; padding-right: 70px;">


							<div class="row">

								<div class="col-sm-7 text-right"></div>

							</div>
						</div>
						<!--===================================================-->
						<!--End Posts Table-->




					</div>
					<!--===================================================-->
					<!--End page content-->

				</div>
				<!--===================================================-->
				<!--END CONTENT CONTAINER-->



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

			</div>

		</div>

		<!-- FOOTER -->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->


		<!-- SCROLL PAGE BUTTON -->
		<!--===================================================-->
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>
		<!--===================================================-->
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->

	<!-- modal창들 -->
	<!--===================================================-->
	<div class="panel panel-trans">
		<div class="panel-body demo-nifty-modal">

			<!--Static Examplel-->
			<div class="modal fade" id="subject-regist-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<i class="pci-cross pci-circle"></i>
							</button>
							<h4 class="modal-title">과목등록</h4>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="demo-hor-inputemail">과목명</label>
								<div class="col-sm-9">
									<input type="email" id="demo-hor-inputemail" class="form-control" style="margin-left: -10px;">
								</div>
							</div>

							<!--Bootstrap Datepicker : Range-->
							<!--===================================================-->
							<br> <br> <label class="col-sm-3 control-label" for="demo-hor-inputemail">기간</label>
							<div id="demo-dp-range">
								<div class="input-daterange input-group" id="datepicker" style="width: 407px;">
									<input type="text" class="form-control" name="start" /> <span class="input-group-addon">to</span> <input type="text" class="form-control" name="end" />
								</div>
							</div>
							<br>
							<!--===================================================-->

						</div>

						<div class="modal-footer">
							<button class="btn btn-primary" type="button">등록</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="subject-edit-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<i class="pci-cross pci-circle"></i>
							</button>
							<h4 class="modal-title">과목편집</h4>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="demo-hor-inputemail">과목명</label>
								<div class="col-sm-9">
									<input type="email" id="demo-hor-inputemail" class="form-control" style="margin-left: -10px;">
								</div>
							</div>

							<!--Bootstrap Datepicker : Range-->
							<!--===================================================-->
							<br> <br> <label class="col-sm-3 control-label" for="demo-hor-inputemail">기간</label>
							<div id="demo-dp-range">
								<div class="input-daterange input-group" id="datepicker" style="width: 407px;">
									<input type="text" class="form-control" name="start" /> <span class="input-group-addon">to</span> <input type="text" class="form-control" name="end" />
								</div>
							</div>
							<br>
							<!--===================================================-->


						</div>

						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal" type="button">삭제</button>
							<button class="btn btn-primary" type="button">수정</button>
						</div>
					</div>
				</div>
			</div>


			<div class="modal fade" id="chapter-regist-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<i class="pci-cross pci-circle"></i>
							</button>
							<h4 class="modal-title">챕터등록</h4>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="demo-hor-inputemail">과목명</label>
								<div class="col-sm-9">
									<input type="email" id="demo-hor-inputemail" class="form-control" style="margin-left: -10px;">
								</div>
							</div>

						</div>

						<div class="modal-footer">
							<button class="btn btn-primary" type="button">등록</button>
						</div>
					</div>
				</div>
			</div>


			<div class="modal fade" id="chapter-edit-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<i class="pci-cross pci-circle"></i>
							</button>
							<h4 class="modal-title">챕터편집</h4>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="demo-hor-inputemail">과목명</label>
								<div class="col-sm-9">
									<input type="email" id="demo-hor-inputemail" class="form-control" style="margin-left: -10px;">
								</div>
							</div>

						</div>

						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal" type="button">삭제</button>
							<button class="btn btn-primary" type="button">수정</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--===================================================-->
	<!-- END 모달창 -->



	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!--=================================================-->

	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootbox.js"></script>

	<!--Modals [ SAMPLE ]-->
	<script src="${pageContext.request.contextPath }/assets/js/ui-modals.js"></script>

</body>
</html>
