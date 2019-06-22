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

<title>File Manager | Nifty - Admin Template</title>


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

						<h4 class="text-main pad-btm bord-btm">assignment</h4>
						<br> <br>
						<h4>Timeline</h4>

								<!-- Timeline -->
								<!--===================================================-->
							
								
								<div class="timeline" id="selectTimelineList">

									<!-- Timeline header -->
									<div class="timeline-header">
										<div class="timeline-header-title bg-primary">
											Now
										</div>
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

							userNo = '${authUser.userNo}'
							console.log(userNo);
							
							$.ajax({
								url : "${pageContext.request.contextPath }/myPage/selectTimelineAllList",
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
										timelineStr += "		<div class='timeline-time'>"+list[i].regDate+"</div>";
										timelineStr += "	</div>";
										timelineStr += "	<div class='timeline-label'>";
										timelineStr += "		<p class='mar-no pad-btm'>";
										timelineStr += "		<a href='#' class='btn-link'>알림</a> ";
										timelineStr += "			commented on <a href='#' class='text-semibold'> <i></i>";
										timelineStr += "		</a>";
										timelineStr += "		</p>";
										timelineStr +=  list[i].timeLineContent
										timelineStr += "	</div>";
										timelineStr += "</div>";
									}
									$("#selectTimelineList").html(timelineStr);

									timelineStr = "";
								},
								error : function(XHR, status, error) {
									console.error(status + " : "
											+ error);
								}
							});
						});

							
	</script>




	<!--=================================================-->




</body>

</html>