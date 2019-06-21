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
					<div class="fixed-fluid">
						<div class="fixed-sm-350 pull-sm-right">
							<br>

							<div>
								<iframe src="https://www.google.com/maps/embed/v1/place?q=New+York+University&amp;key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" style="width: 100%; height: 200px;"></iframe>
							</div>
							<hr>
							<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">
								LIKE<i class="icon-lg icon-fw demo-pli-map-marker-2"></i>
							</p>

							<ul class="list-inline mar-hor">
								<c:forEach items="${getlikedList}" var="List">
									<li class="tag tag-sm" style=""><a href="#">${List.cpostTitle}</a></li>
									<span class="mar-rgt">&nbsp;&nbsp;&nbsp;<i class="demo-psi-heart-2 icon-fw"></i>${List.liked}</span>
									<br>
								</c:forEach>
							</ul>
							<hr>
							<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">BEST POST</p>
							<div class="list-group bg-trans pad-btm bord-btm">
								<c:forEach items="${getlikedList}" var="List">
									<div class="list-group-item list-item-sm">
										<a href="#" class="btn-link">${List.cpostTitle}</a><small class="box-block">${List.regDate}</small>
									</div>
								</c:forEach>
							</div>




							<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Recent Comments</p>
							<div class="list-group bg-trans">
								<a href="#" class="list-group-item">
									<div class="media-left pos-rel">
										<img class="img-circle img-xs" src="${pageContext.request.contextPath }/assets/img/profile-photos/7.png" alt="Profile Picture">
									</div>
									<div class="media-body">
										<p class="mar-no text-main">Brittany Meyer</p>
										<small>9 minutes ago</small>
										<p class="pad-top text-sm">I think so</p>
									</div>
								</a> <a href="#" class="list-group-item">
									<div class="media-left pos-rel">
										<img class="img-circle img-xs" src="${pageContext.request.contextPath }/assets/img/profile-photos/4.png" alt="Profile Picture">
									</div>
									<div class="media-body">
										<p class="mar-no text-main">Donald Brown</p>
										<small>3 hours ago</small>
									</div>
								</a>

							</div>
							<hr>
							<br> &nbsp;
							<button class="btn btn-dark btn-circle" onclick="location.href='${pageContext.request.contextPath }/community/regform' ">
								<i class="demo-psi-pen-5 icon-2x"></i>
							</button>
							<br>
						</div>
						<div class="fluid">

							<div class="blog blog-list">

								<!-- Panel  Blog -->
								<!--===================================================-->
								<c:forEach items="${communityList}" var="List">
									<div class="panel sm">
										<div class="blog-header">
											<img class="img-responsive" src="${pageContext.request.contextPath}/assets/img/shared-img-5.jpg" alt="Image">
										</div>
										<div class="blog-content">
											<div class="blog-title media-block">
												<div class="media-body">
													<a href="${pageContext.request.contextPath }/community/read/${List.cpostNo}" class="btn-link">
														<h2>${List.cpostTitle}</h2>
													</a>
												</div>
											</div>
											<div class="blog-body">
												<p>${List.cpostContent}</p>
											</div>
										</div>
										<div class="blog-footer">
											<div class="media-left">
												<span class="label label-success">${List.regDate}</span>
											</div>
											<div class="media-body text-right">
												<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>${List.liked}</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>23
											</div>
										</div>

									</div>
								</c:forEach>

						</div>
					</div>

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
	<script type="text/javascript">
		$("document").ready(function() {
			var currentDate =  new Date();
			resultDate = new Date(currentDate);
			console.log("안녕: " + currentDate);
			/* currentDate = currentDate.getFullYear() + "/" + pad( (currentDate.getMonth()+1), 2 ) + "/"+ currentDate.getDate() + ""
			console.log("currentDate", currentDate);  */
			timegap = (currentDate - resultDate)/(60*60*1000);
			var curYear = resultDate.getFullYear();
			var curMonth = (resultDate.getMonth() + 1);
			var curDay = resultDate.getDate();
			//console.log(timegap);
			console.log("-------------------------------");
			$.ajax({
				url : "${pageContext.request.contextPath }/community/dueDate",
				type : "post",
				dataType : "json",	
				success : function(list) {
					console.log(list);
					
				
					/* for(var i=0; i<list.length; i++){
						var differentiate = (list[i].regDate - resultDate)/(60*60*1000);
						console.log(differentiate);
					} */
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
			
			
		});
	</script>


</body>