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
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">제출 현황</h3>
							</div>
							<div class="panel-body">
								<h3 class="panel-title">자바</h3>
								<table id="" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>과제</th>
											<th>과제내용</th>
											<th>첨부 파일</th>
											<th>제출 기한</th>
											<th>제출 여부</th>
											<th>점수 여부</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="6">제출한 과제가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<h3 class="panel-title">자율 주행</h3>
								<table id="" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>과제</th>
											<th>과제내용</th>
											<th>첨부 파일</th>
											<th>제출 기한</th>
											<th>제출 여부</th>
											<th>점수 여부</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="6">제출한 과제가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<br> <br>
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
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>

	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!--Unite Gallery [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/unitegallery/js/unitegallery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/unitegallery/themes/slider/ug-theme-slider.js"></script>

	<!--Sparklines [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/sparkline/jquery.sparkline.min.js"></script>

	<!--Easy Pie Chart [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/easy-pie-chart/jquery.easypiechart.min.js"></script>

	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<script>
		$(document).on('nifty.ready',function() {

							userNo = '${authUser.userNo}'
							console.log(userNo);

							//qna List 
							$.ajax({
										url : "${pageContext.request.contextPath }/myPage/selectQna",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											if (list.length == 0) {
												$("#blogList").html("검색된 게시글이 없습니다.");
											} else {
												str = "";
												for (var i = 0; i < list.length; i++) {

													str += "<tr>"
													str += "<td>"
															+ list[i].rnum
															+ "</td>"
													str += "<td><a class='btn-link' href='${pageContext.request.contextPath }/${coursePath}/notice/read/"+list[i].postNo+"'>["
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
													str += "<td><i class='demo-pli-speech-bubble-5 icon-fw'></i>2</td>"
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
							/* 과제 현황 리스트 
							<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
							</tr>*/

						});
	</script>




	<!--=================================================-->




</body>

</html>