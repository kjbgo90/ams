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
						<h1 class="page-header text-overflow">질의응답</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">코스 </a></li>
						<li class="active">질의응답</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->


				</div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">


					<!-- Search -->
					<!--===================================================-->
					<div class="row pad-btm">

						<form action="#" method="post" class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor"></form>
					</div>

					<!-- Toolbar -->
					<!--===================================================-->
					<hr class="new-section-xs bord-no">

					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title" style="padding-left: 30px; padding-top: 10px;">질의응답</h3>
						</div>
						<hr>

						<div class="row pad-btm">
							<form action="#" method="post" class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor" style="padding-left: 500px;">
								<div class="input-group mar-btm">
									<input type="text" placeholder="Search posts..." class="form-control input-sm"> <span class="input-group-btn">
										<button class="btn btn-primary btn-sm" type="button">검색</button>
									</span>
								</div>
							</form>
						</div>
						<!--Posts Table-->
						<!--===================================================-->
						<div class="panel-body" style="padding-left: 79px; padding-right: 70px;">

							<div class="table-responsive">
								<table class="table table-striped table-vcenter">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>등록일</th>
											<th>과정</th>
											<th>글쓴이</th>
											<th>조회수</th>
											<th>댓글수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td><a class="btn-link" href="#">궁금합니다8</a>&nbsp;&nbsp;
												<div class="label label-warning">N</div></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>java</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>2</td>
										</tr>
										<tr>
											<td>9</td>
											<td><a class="btn-link" href="#">궁금합니다8</a>&nbsp;&nbsp;
												<div class="label label-warning">N</div></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>oracle</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>8</td>
											<td><a class="btn-link" href="#">궁금합니다8</a>&nbsp;&nbsp;
												<div class="label label-warning">N</div></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>oracle</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>7</td>
											<td><a class="btn-link" href="#">궁금합니다8</a></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>git</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>6</td>
											<td><a class="btn-link" href="#">궁금합니다8</a></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>spring</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>5</td>
											<td><a class="btn-link" href="#">궁금합니다8</a></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>oracle</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>4</td>
											<td><a class="btn-link" href="#">궁금합니다8</a></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>spring</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>3</td>
											<td><a class="btn-link" href="#">궁금합니다8</a></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>부트스트랩</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>3</td>
										</tr>
										<tr>
											<td>2</td>
											<td><a class="btn-link" href="#">궁금합니다8</a></td>
											<td><span class="text-muted">Oct 22, 2014</span></td>
											<td>프로젝트</td>
											<td><a href="#" class="btn-link">강보은</a></td>
											<td>22</td>
											<td><i class="demo-pli-speech-bubble-5 icon-fw"></i>2</td>
										</tr>

									</tbody>
								</table>
							</div>
							<br> <br>
							<div class="row">

								<div class="col-sm-7 text-right">
									<ul class="pagination">
										<li class="disabled"><a href="#" class="demo-pli-arrow-left"></a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><span>...</span></li>
										<li><a href="#">20</a></li>
										<li><a href="#" class="demo-pli-arrow-right"></a></li>
									</ul>
								</div>
								<div class="col-sm-5 text-right">
									<button class="btn btn-primary btn-sm" style="margin-right: 50px;">글작성</button>
								</div>
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





	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!--=================================================-->

</body>
</html>
