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
<link href="${pageContext.request.contextPath }/assets/css/ionicons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/font-awesome.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">


<!--=================================================-->

<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>

<!--Demo [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/nifty-demo.min.css" rel="stylesheet">
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
						<h1 class="page-header text-overflow">커뮤니티</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">전체 </a></li>
						<li class="active">커뮤니티</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>



				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<hr class="new-section-md bord-no">
					<div class="row">
						<div class="col-sm-4">


							<!-- Upcoming Tasklist 맛집!!!!!!!!!!!! -->
							<!---------------------------------->
							<div>

								<a href="${pageContext.request.contextPath }/community/selectform?cpostType=1" class="pull-right btn btn-info btn-sm">바로가기</a>
								<h4 class="text-main">근처 맛집</h4>
								<hr>
								<br>
								<ul id="demo-tasklist-upcoming" class="sortable-list tasklist list-unstyled">
									<c:forEach items="${MainEatList}" var="List">
										<li id="demo-tasklist-12" class="task-info" onclick="location.href='${pageContext.request.contextPath }/community/read/${List.cpostNo}'">
											<p class="text-bold text-main text-sm "># ${List.cpostNo}</p> <img class="img-responsive mar-btm" src="${pageContext.request.contextPath }/assets/img/shared-img-4.jpg" alt="Image">
											<p class="text-bold text-main text-sm text-right">${List.cpostTitle}</p>
											<p class="pad-btm bord-btm">${List.cpostContent}</p> <a href="#" class="task-footer"> <span class="box-inline"> <span class="pad-rgt"><i class="demo-pli-speech-bubble-7"></i> 45</span> <span class="pad-rgt"><i class="demo-pli-like"></i> ${List.liked}</span>
											</span> <span class="text-sm"><i class="demo-pli-clock icon-fw text-main"></i>${List.regDate}</span>
										</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!---------------------------------->


						</div>
						<div class="col-sm-4">


							<!-- Upcoming Tasklist 카페!!!!!!!!!!!!!!!!!!!!!!!!!!!111-->
							<!---------------------------------->
							<div>
								<a href="${pageContext.request.contextPath }/community/selectform?cpostType=2" class="pull-right btn btn-info btn-sm">바로가기</a>
								<h4 class="text-main header-title m-t-0">카페</h4>
								<hr>
								<br> 
								<ul id="demo-tasklist-inprogress" class="sortable-list tasklist list-unstyled">
									<c:forEach items="${MaincafeList}" var="List">
										<li id="demo-tasklist-3" class="task-warning" onclick="location.href='${pageContext.request.contextPath }/community/read/${List.cpostNo}'">
											<p class="text-bold text-main text-sm "># ${List.cpostNo}</p> <img class="img-responsive mar-btm" src="${pageContext.request.contextPath }/assets/img/shared-img-2.jpg" alt="Image">
											<p class="text-bold text-main text-sm text-right">${List.cpostTitle}</p>
											<p class="pad-btm bord-btm">${List.cpostContent}</p> <a href="#" class="task-footer"> <span class="box-inline"> <span class="pad-rgt"><i class="demo-pli-speech-bubble-7"></i> 45</span> <span class="pad-rgt"><i class="demo-pli-like"></i> ${List.liked}</span>
											</span> <span class="text-sm"><i class="demo-pli-clock icon-fw text-main"></i>${List.regDate}</span>
										</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!---------------------------------->



						</div>
						<div class="col-sm-4">


							<!-- Upcoming Tasklist 자유글!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
							<!---------------------------------->
							<div>
								<a href="${pageContext.request.contextPath }/community/selectform?cpostType=3" class="pull-right btn btn-info btn-sm">바로가기</a>
								<h4 class="text-main header-title m-t-0">자유게시글</h4>
								<hr>
								<br>
								<ul id="demo-tasklist-completed" class="sortable-list tasklist list-unstyled">
								<c:forEach items="${MainList}" var="List">
									<li id="demo-tasklist-9" class="task-success">
									<p class="text-bold text-main text-sm "># ${List.cpostNo}</p> <img class="img-responsive mar-btm" src="${pageContext.request.contextPath }/assets/img/shared-img-3.jpg" alt="Image">
											<p class="text-bold text-main text-sm text-right">${List.cpostTitle}</p>
											<p class="pad-btm bord-btm">${List.cpostContent}</p> <a href="#" class="task-footer"> <span class="box-inline"> <span class="pad-rgt"><i class="demo-pli-speech-bubble-7"></i> 45</span> <span class="pad-rgt"><i class="demo-pli-like"></i> ${List.liked}</span>
											</span> <span class="text-sm"><i class="demo-pli-clock icon-fw text-main"></i>${List.regDate}</span>
									</a>
									</li>
									</c:forEach>
								</ul>
							</div>
							<!---------------------------------->


						</div>
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-dark btn-circle" onclick="location.href='${pageContext.request.contextPath }/community/writeform' ">
							<i class="demo-psi-pen-5 icon-2x"></i>
						</button>
					</div>
					<br> <br>

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




	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>


	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>
	<!--=================================================-->






</body>