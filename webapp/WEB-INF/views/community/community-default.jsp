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

							<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Categories</p>
							<div class="list-group bg-trans pad-btm bord-btm">
								<a href="#" class="list-group-item list-item-sm">근처맛집</a> <a href="#" class="list-group-item list-item-sm">카페</a> <a href="#" class="list-group-item list-item-sm">자유게시판</a>
							</div>


							<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">BEST POST</p>
							<div class="list-group bg-trans pad-btm bord-btm">
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Lorem ipsum dolor sit amet</a><small class="box-block">6 Hours ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Consectetuer adipiscing elit</a><small class="box-block">2 days ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Sed diam nonummy nibh </a><small class="box-block">7 days ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Laoreet dolore magna aliquam erat volutpat.</a><small class="box-block">2 weeks ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Ut wisi enim ad minim veniam</a><small class="box-block">3 weeks ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Ut wisi enim ad minim veniam</a><small class="box-block">3 weeks ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Ut wisi enim ad minim veniam</a><small class="box-block">3 weeks ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Ut wisi enim ad minim veniam</a><small class="box-block">3 weeks ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Ut wisi enim ad minim veniam</a><small class="box-block">3 weeks ago</small>
								</div>
								<div class="list-group-item list-item-sm">
									<a href="#" class="btn-link">Ut wisi enim ad minim veniam</a><small class="box-block">3 weeks ago</small>
								</div>
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
							<br> &nbsp;&nbsp;
							<button class="btn btn-dark btn-circle ">
								<i class="demo-psi-pen-5 icon-2x"></i>
							</button>
							<br>
						</div>
						<div class="fluid">

							<div class="blog blog-list">

								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel sm">
									<div class="blog-header">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/shared-img-5.jpg" alt="Image">
									</div>
									<div class="blog-content">
										<div class="blog-title media-block">
											<div class="media-body">
												<a href="#" class="btn-link">
													<h2>Far far away, behind the word mountains</h2>
												</a>
											</div>
										</div>
										<div class="blog-body">
											<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
											<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
											<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">
											<span class="label label-success">Today</span>
										</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>519</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>23
										</div>
									</div>
								</div>
								<!--===================================================-->





								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel">
									<div class="blog-header">
										<div class="bg-info blog-img-sm text-center">
											<h3 class="text-light">
												<i class="demo-pli-mail-send icon-4x"></i>
											</h3>
										</div>
									</div>
									<div class="blog-content">
										<div class="blog-title media-block">
											<a href="#" class="btn-link">
												<h2>Blazzing fast</h2>
											</a>
										</div>
										<div class="blog-body">
											<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.</p>
											<p>I must explain to you how all this mistaken idea of denouncing pleasure was born and I will give you a complete account of the system.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">9 Days ago</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>65</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>8
										</div>
									</div>
								</div>
								<!--===================================================-->




								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel">
									<div class="blog-content">
										<div class="blog-title media-block">
											<a href="#" class="btn-link">
												<h2>The European languages</h2>
											</a>
										</div>
										<div class="blog-body">
											<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new
												common language would be desirable: one could refuse to pay expensive translators.</p>
											<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">9 Days ago</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>456</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>22
										</div>
									</div>
								</div>
								<!--===================================================-->


								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel">
									<div class="blog-header">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/shared-img.jpg" alt="Image">
									</div>
									<div class="blog-content">
										<div class="blog-title media-block">
											<a href="#" class="btn-link">
												<h2>The new common language</h2>
											</a>
										</div>
										<div class="blog-body">
											<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words.</p>
											<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure. Like these sweet mornings of spring which I enjoy with my whole heart.</p>
											<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">25 Days ago</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>81</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>4
										</div>
									</div>
								</div>
								<!--===================================================-->



								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel pad-all">
									<div class="blog-header">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/shared-img-3.jpg" alt="Image">
									</div>
									<div class="blog-content">
										<div class="blog-title media-block">
											<a href="#" class="btn-link">
												<h2>No one rejects, dislikes</h2>
											</a>
										</div>
										<div class="blog-body">
											<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure. Like these sweet mornings of spring which I enjoy with my whole heart.</p>
											<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.</p>
											<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">
											<span>1 month ago</span>
										</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>52</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>7
										</div>
									</div>
								</div>
								<!--===================================================-->

								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel">
									<div class="blog-content">
										<div class="blog-title media-block">
											<a href="#" class="btn-link">
												<h2>The European languages</h2>
											</a>
										</div>
										<div class="blog-body">
											<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new
												common language would be desirable: one could refuse to pay expensive translators.</p>
											<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">9 Days ago</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>456</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>22
										</div>
									</div>
								</div>
								<!--===================================================-->


								<!-- Panel  Blog -->
								<!--===================================================-->
								<div class="panel">
									<div class="blog-content">
										<div class="blog-title media-block">
											<a href="#" class="btn-link">
												<h2>The European languages</h2>
											</a>
										</div>
										<div class="blog-body">
											<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new
												common language would be desirable: one could refuse to pay expensive translators.</p>
											<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
										</div>
									</div>
									<div class="blog-footer">
										<div class="media-left">9 Days ago</div>
										<div class="media-body text-right">
											<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>456</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>22
										</div>
									</div>
								</div>
								<!--===================================================-->


								<div class="col-sm-8 text-right">
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
							</div>


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



</body>