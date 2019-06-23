<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>

<head>

<style>
#map {
	height: 400px;
	width: 100%;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>community-write</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--Open Sans Font [ OPTIONAL ]-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700'
	rel='stylesheet' type='text/css'>


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


<!--Dropzone [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css"
	rel="stylesheet">

<!--=================================================

    REQUIRED
    You must include this in your project.


    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.


    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.


    DEMONSTRATION
    This is to be removed, used forÂ demonstration purposes only.Â This category must not be included in your project.


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
		<!--NAVBAR-->
		<!--===================================================-->
		<!-- header -->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!--===================================================-->
		<!--END NAVBAR-->
		<!--===================================================-->

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
				<div id="page-content">
					<div class="row">
						<div class="col-lg-8">

							<div class="fluid">

								<div class="blog blog-list">

									<!-- Panel  Blog -->
									<!--===================================================-->
									<c:forEach items="${communityList}" var="List">
										<div class="panel sm">
											<div class="blog-header">
												<img class="img-responsive"
													src="${pageContext.request.contextPath}/assets/img/shared-img-5.jpg"
													alt="Image">
											</div>
											<div class="blog-content">
												<div class="blog-title media-block">
													<div class="media-body">
														<a
															href="${pageContext.request.contextPath }/community/read/${List.cpostNo}"
															class="btn-link">
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
													<span class="mar-rgt">
														<i class="demo-pli-heart-2 icon-fw"></i>${List.liked}
													</span> 
													<i class="demo-pli-speech-bubble-5 icon-fw"></i>${List.replyCount }
												</div>
											</div>

										</div>
									</c:forEach>

								</div>
							</div>

						</div>
						<div class="col-lg-4">

							<!--Page content-->
							<!--===================================================-->
							<div id="page-content">
								<!-- <div class="panel"> -->
									<!-- <div class="panel-heading"></div> -->
									<!-- <div class="panel-body"> -->
										<div class="fixed-fluid">
											<!-- map -->
											<div class="fixed-sm-350 pull-sm-right">
												<div id="map"></div>
											</div>
										</div>
										<hr>
										<p
											class="pad-hor mar-top text-main text-bold text-sm text-uppercase">
											HOT PLACE<i class="icon-lg icon-fw demo-pli-map-marker-2"></i>
										</p>

										<!-- 누나랑 상의 foreach의 존재 유무 -->
										<ul class="list-inline mar-hor" id="hotplaces">

										</ul>
										<hr>



										<p
											class="pad-hor mar-top text-main text-bold text-sm text-uppercase">BEST
											POST</p>
										<div class="list-group bg-trans pad-btm bord-btm">
											<c:forEach items="${getlikedList}" var="List">
												<div class="list-group-item list-item-sm">
													<a href="#" class="btn-link">${List.cpostTitle}</a><small
														class="box-block">${List.regDate}</small>
												</div>
											</c:forEach>
										</div>




										<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Recent Comments</p>
										<div class="list-group bg-trans">
											<a href="#" class="list-group-item">
												<div class="media-left pos-rel">
													<img class="img-circle img-xs"
														src="${pageContext.request.contextPath }/assets/img/profile-photos/7.png"
														alt="Profile Picture">
												</div>
												<div class="media-body">
													<p class="mar-no text-main">Brittany Meyer</p>
													<small>9 minutes ago</small>
													<p class="pad-top text-sm">I think so</p>
												</div>
											</a> <a href="#" class="list-group-item">
												<div class="media-left pos-rel">
													<img class="img-circle img-xs"
														src="${pageContext.request.contextPath }/assets/img/profile-photos/4.png"
														alt="Profile Picture">
												</div>
												<div class="media-body">
													<p class="mar-no text-main">Donald Brown</p>
													<small>3 hours ago</small>
												</div>
											</a>
											
											

										</div>
										<hr>
										<br> &nbsp;
										<button class="btn btn-dark btn-circle"
											onclick="location.href='${pageContext.request.contextPath }/community/writeform' ">
											<i class="demo-psi-pen-5 icon-2x"></i>
										</button>
										<br>



									<!-- </div> -->
								<!-- </div> -->
							</div>
						</div>
					</div>

					<!--===================================================-->

				</div>

			</div>
			<!--===================================================-->
			<!--End page content-->

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
		<!--END CONTENT CONTAINER-->

		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

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
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--Dropzone [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>





	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!-- GMaps -->
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4&libraries=places"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/gmaps.js"></script>

	<!--=================================================-->

	<script type="text/javascript">
		Dropzone.autoDiscover = false;

		var fileList = [];

		// DROPZONE.JS
		// =================================================================
		// Require Dropzone
		// http://www.dropzonejs.com
		// =================================================================
		//파일 업로드 드래그 앤 드롭할때 
		$("#dropzone").dropzone({
			url : "${pageContext.request.contextPath }/community/upload",
			success : function(file, fileVo) {
				console.log(file);
				console.log(fileVo);
				fileList.push(fileVo);
				console.log(fileList);
				console.log(fileList.length);
			}
		});
	</script>


	<script type="text/javascript">
	
		$(document).on('nifty.ready', function() {
			var bit_lat = 37.4946083;
			var bit_lng = 127.0254167;

			var searched_address;
			var searched_lat;
			var searched_lng;

			// GMAPS
			// =================================================================
			// Require gmaps
			// -----------------------------------------------------------------
			// http://hpneo.github.io/gmaps/
			// =================================================================

			// Marker
			// =================================================================

			var geocoder = new google.maps.Geocoder;

			/* var markerMap = new GMaps({
				el : '#map',
				lat : 37.4946083,
				lng : 127.0254167,

			}); */

		});
		
		$(document).ready(function() {
				
				var markerMap = new GMaps({
					el : '#map',
					lat : 37.4946083,
					lng : 127.0254167,

				});
				
				console.log("-------------------HOT PLCAE-------------------");
				$.ajax({
					url : "${pageContext.request.contextPath }/community/hotPlaces?cpostType=2",
					type : "post",

					dataType : "json",
					success : function(result) {
						renderHotPlaces(markerMap, result);
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
				
				
				$("#page-content").on("click", "#businessName", function(){
					var lat = $(this).data("lat");
					var lng = $(this).data("lng");
					console.log(lat);
					console.log(lng);
					markerMap.setCenter(lat, lng);
				});
		});
		
		
		function addMarker(input_map, input_businessName, input_address, input_lat, input_lng){
			input_map.addMarker({
				lat : input_lat,
				lng : input_lng,
				title : 'Location',
				click : function(e) {
					$.niftyNoty({
						type : "info",
						icon : "fa fa-info",
						message : "You clicked in the marker",
						container : 'floating',
						timer : 3500
					});
				},
				infoWindow : {
					content : '<div>'+ input_businessName +'</div><div>'+ input_address +'</div>'
				}
			});
		}
		
		function setCenter(input_map, input_lat, input_lng){
			input_map.setCenter(input_lat, input_lng);
		}
		
		function renderHotPlaces(map, list) {
			$("#hotplaces").empty();
			for (var i = 0; i < list.length; i++) {
				str = '';
				str += '<li class="tag tag-sm" id="businessName" data-lat="'+ list[i].latitude +'" data-lng="'+ list[i].longitude +'" style=""><a href="#">'+ list[i].businessName + '</a></li>';
				str += '<span class="mar-rgt">&nbsp;&nbsp;&nbsp;<i class="demo-psi-heart-2 icon-fw"></i>'+ list[i].liked + '</span><br/>'
				addMarker(map, list[i].businessName, list[i].address, list[i].latitude, list[i].longitude);
				$("#hotplaces").append(str);
			}
		}
		
		
	</script>


</body>
</html>
