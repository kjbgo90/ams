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

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">

<!--=================================================-->
<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>

<!--Summernote [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/summernote/summernote.min.css" rel="stylesheet">

<!--Dropzone [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css" rel="stylesheet">

<!--Bootstrap Datepicker [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">
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
		<!--===================================================-->
		<!-- content -->
		<div class="boxed">
			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				<div id="page-head">
					<!--Page Title-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<div id="page-title">
						<h1 class="page-header text-overflow">과제 게시판</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->
					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">App</a></li>
						<li class="active">과제 게시판</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->
				</div>
				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<!-- Contact Toolbar -->
					<!---------------------------------->
					<!---------------------------------->
					<form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${coursePath}/assignment/enrollAssignment">
						<div class="col-xs-9">
							<div class="form-group">
								<input id="assignmentTitle" type="text" placeholder="Blog Title" class="form-control input-lg" autofocus>
							</div>
							<div class="panel">
								<div class="panel-body">
									<div id="demo-summernote">
										<p></p>
									</div>
								</div>
							</div>
						</div>
						<div class="panel col-xs-3" style="background-color:#ffffff;">
							<div class="panel-body">
								<p class="text-main text-bold text-uppercase">파일 업로드</p>
								<!--Dropzonejs-->
								<!--===================================================-->
								<div class="dropzone-container">
									<form id="demo-dropzone" action="#">
										<div class="dz-default dz-message">
											<div class="dz-icon">
												<i class="demo-pli-upload-to-cloud icon-5x"></i>
											</div>
											<div>
												<span class="dz-text">Drop files to upload</span>
												<p class="text-sm text-muted">or click to pick manually</p>
											</div>
										</div>
										<!--
										<div class="fallback">
											<form action="#" method="post" enctype="multipart/form-data">
												<input name="file" type="file" multiple>
											</form>
										</div>
										-->
									</form>
								</div>
								<!--===================================================-->
								<!-- End Dropzonejs -->
								<hr>
								<div class="form-horizontal">
									<div class="form-group" style="padding-left:10px;">
										<label class="control-label text-left" for="demo-hor-inputpass">subject</label>
										<div class="">
											<div class="select">
												<select id="selectSubject" style="width:250px;">
													<c:forEach items="${subjectList}" var="subjectVo">
														<option value="${subjectVo.subjectNo}">${subjectVo.subjectTitle}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group"  style="padding-left:10px;">
										<label class="control-label text-left" for="demo-hor-inputpass">chapter</label>
										<div class="">
											<div class="select">
												<select id="selectChapter" style="width:250px;">
													<c:forEach items="${subjectList[0].chapterList}" var="chapterVo">
														<option value="${chapterVo.chapterNo}">${chapterVo.chapterContent}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label text-left" for="demo-hor-inputpass">제출기한</label>
										<div class="col-sm-7"></div>
									</div>
									<div class="form-group">
										<!--Bootstrap Datepicker : Inline-->
										<!--===================================================-->
										<div id="demo-dp-inline">
											<input id="select-day" type="hidden" value="">
											<div></div>
										</div>
										<!--===================================================-->
									</div>
									<div class="form-group">
										<button class="btn btn-lg btn-danger pull-right" id="btnEnroll">출제하기</button>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</form>>
				</div>
				<!--===================================================-->
				<!--End page content-->
			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->
		</div>
		<!-- /content -->
		<!--===================================================-->
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
		<!-- FOOTER -->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->
	</div>
	<!-- SCROLL PAGE BUTTON -->
	<!--===================================================-->
	<button class="scroll-top btn">
		<i class="pci-chevron chevron-up"></i>
	</button>
	<!--===================================================-->
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
	<!--Summernote [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/summernote/summernote.js"></script>
	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>
	<!--Bootstrap Datepicker [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<!-- blog-edit 에서 스크립트 페이지 찾기 sample page 안에 있음  -->
	<script>
		$(document).on('nifty.ready', function() {

			// DROPZONE.JS
			// =================================================================
			// Require Dropzone
			// http://www.dropzonejs.com/
			// =================================================================
			$('#demo-dropzone').dropzone({
				//url: '/file/post',
				//autoProcessQueue: false,
				addRemoveLinks : true,
				maxFiles : 1,
				init : function() {
					var myDropzone = this;
					myDropzone.on('maxfilesexceeded', function(file) {
						this.removeAllFiles();
						this.addFile(file);
					});
				}
			});

			// SUMMERNOTE
			// =================================================================
			// Require Summernote
			// http://hackerwins.github.io/summernote/
			// =================================================================
			$('#demo-summernote, #demo-summernote-full-width').summernote({
				height : '600px'
			});

			// BOOTSTRAP DATEPICKER
			// =================================================================
			// Require Bootstrap Datepicker
			// http://eternicode.github.io/bootstrap-datepicker/
			// =================================================================
			$('#demo-dp-txtinput input').datepicker();

			// BOOTSTRAP DATEPICKER WITH AUTO CLOSE
			// =================================================================
			// Require Bootstrap Datepicker
			// http://eternicode.github.io/bootstrap-datepicker/
			// =================================================================
			$('#demo-dp-component .input-group.date').datepicker({
				autoclose : true
			});

			// BOOTSTRAP DATEPICKER WITH RANGE SELECTION
			// =================================================================
			// Require Bootstrap Datepicker
			// http://eternicode.github.io/bootstrap-datepicker/
			// =================================================================
			$('#demo-dp-range .input-daterange').datepicker({
				format : "MM dd, yyyy",
				todayBtn : "linked",
				autoclose : true,
				todayHighlight : true
			});

			// INLINE BOOTSTRAP DATEPICKER
			// =================================================================
			// Require Bootstrap Datepicker
			// http://eternicode.github.io/bootstrap-datepicker/
			// =================================================================
			$('#demo-dp-inline div').datepicker({
				format : "MM dd, yyyy",
				todayBtn : "linked",
				autoclose : true,
				todayHighlight : true
			});

		});
		
		$("#selectSubject").on("change", function(){
			console.log(this.value);
			var subjectNo = this.value;
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/getChapterList",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({subjectNo : subjectNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						$("#selectChapter").empty();
						
						for(var i=0; i<response.data.length; i++){
							var str = "";
							str += "<option value=" + response.data[i].chapterNo + ">" + response.data[i].chapterContent + "</option>";
							$("#selectChapter").append(str);
						}
					} else {
						console.log("select 변경 실패");
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		$("#btnEnroll").on("click", function(){
			event.preventDefault();
			console.log("과제 출제");
			
			var assignmentTitle = $("#assignmentTitle").val();
			var assignmentContent = $('#demo-summernote').summernote('code');
			var endDate = $('#select-day').val();
			
		});
	</script>
</body>
</html>
