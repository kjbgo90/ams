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
								<h3 class="panel-title">과제 목록</h3>
								<table class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>레포트 제목</th>
											<th>레포트 파일</th>
											<th>과제 타이틀</th>
											<th>제출 일자</th>
											<th>점수 여부</th>
											<th>점수</th>
										</tr>
									</thead>
									<tbody id="assignmentList">
										<tr>
											<td colspan="6">제출한 과제가 없습니다.</td>
										</tr>
									</tbody>
								</table>
								<br> <br>

							</div>
						</div>
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">출제한 과제들</h3>
							</div>
							<div class="panel-body">

								<table class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>코스 이름</th>
											<th>챕터</th>
											<th>타이틀</th>
											<th>파일</th>
											<th>제출일</th>
											<th>제출 마감일</th>
										</tr>
									</thead>
									<tbody id="assignmentListForTeacher">
										<tr>
											<td colspan="6">출제한 과제가 없습니다.</td>
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

							//qna List 
							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/getSubmitListByUserNo",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											console.log(list);
											assignmentListStr = "";
											for (var i = 0; i < list.length; i++) {
												assList(list[i]);
											}
											$("#assignmentList").html(
													assignmentListStr);
											assignmentListStr = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});
							/* 과제 현황 리스트 
											<th>레포트 제목 </th>
											<th>레포트 파일</th>
											<th>과제 타이틀</th>
											<th>제출 일자</th>
											<th>점수 여부 </th>
											<th>점수 </th>
							<tr>
							<td>"+list[i].+"</td>
							<td>"+list[i].+"</td>
							<td>"+list[i].+"</td>
							<td>"+list[i].+"</td>
							<td>"+list[i].+"</td>
							<td>"+list[i].+"</td>
							</tr>*/

							function assList(SubmitVo) {

								assignmentListStr += "<tr>";
								//레포트 제목 
								assignmentListStr += "<td>"
										+ SubmitVo.assignmentTitle + "</td>";
								//첨부 파일 
								if (SubmitVo.fileList != null) {
									console.log(SubmitVo.fileList);

									if (SubmitVo.fileList.length != 0) {
										assignmentListStr += "<td>";
										for (var s = 0; s < SubmitVo.fileList.length; s++) {

											assignmentListStr += "<a href="+SubmitVo.fileList[s].filePath+" class='text-semibold text-main mar-no'>"
													+ SubmitVo.fileList[s].fileName
													+ "</a><br>";

										}
										assignmentListStr += "</td>";
									} else {
										assignmentListStr += "<td>첨부파일이 없습니다.</td>";
									}

								} else {
									assignmentListStr += "<td>첨부파일이 없습니다.</td>";
								}
								//과제 타이틀 
								assignmentListStr += "<td>"
										+ SubmitVo.assignmentTitle + "</td>";
								//제출 일자
								// 과제 채점 여부 , 점수 
								if (SubmitVo.submitNo != 0) {
									assignmentListStr += "<td>"
											+ SubmitVo.submitDate + "</td>";
									assignmentListStr += "<td>"
											+ SubmitVo.scoreCheck + "</td>";
									if (SubmitVo.scoreCheck == 'true') {
										assignmentListStr += "<td>"
												+ SubmitVo.score + "</td>";
									} else {
										assignmentListStr += "<td>미채점</td>";
									}

								} else {

									//${pageContext.request.contextPath }/"+coursePath+"/assignment/list

								}

								assignmentListStr += "</tr>";
							}

							var userNo = 2;
							$
									.ajax({
										url : "${pageContext.request.contextPath }/myPage/getAssignmentByTeacherNo",
										type : "post",
										data : {
											userNo : userNo
										},
										dataType : "json",
										success : function(list) {
											console.log(list);
											assignmentListForTeacherstr = "";
											for (var i = 0; i < list.length; i++) {
												assList(list[i]);
												assignmentListForTeacherstr += "<tr>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].courseName
														+ "</td>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].chapterContent
														+ "</td>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].assignmentTitle
														+ "</td>";
														//첨부 파일 
														if (list[i].fileList != null) {
															console.log(list[i].fileList);

															if (list[i].fileList.length != 0) {
																assignmentListForTeacherstr += "<td>";
																for (var s = 0; s < list[i].fileList.length; s++) {
																	var sa = s+ 1; 
																	assignmentListForTeacherstr += "<a href="+list[i].fileList[s].filePath+" class='text-semibold text-main mar-no'>"
																			+sa+"."+ list[i].fileList[s].fileName
																			+ "</a><br>";

																}
																assignmentListForTeacherstr += "</td>";
															} else {
																assignmentListForTeacherstr += "<td>첨부파일이 없습니다.</td>";
															}

														} else {
															assignmentListForTeacherstr += "<td>첨부파일이 없습니다.</td>";
														}
												assignmentListForTeacherstr += "<td>"
														+ list[i].startDate
														+ "</td>";
												assignmentListForTeacherstr += "<td>"
														+ list[i].endDate
														+ "</td>";
												assignmentListForTeacherstr += "</tr>";
											}
											$("#assignmentListForTeacher")
													.html(
															assignmentListForTeacherstr);
											assignmentListForTeacherstr = "";
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