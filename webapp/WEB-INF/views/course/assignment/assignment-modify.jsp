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
<link href="${pageContext.request.contextPath }/assets/css/font-awesome.css" rel="stylesheet">

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

<!--Bootstrap Select [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">

<!--Select2 [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/select2/css/select2.min.css" rel="stylesheet">
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
						<li><a href="${pageContext.request.contextPath }/index"><i class="demo-pli-home"></i></a></li>
						<li><a href="${pageContext.request.contextPath }/${coursePath}/main">Course</a></li>
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
					<div>
						<input id="assignmentNo" type="hidden" name="assignmentNo" value="${assignmentVo.assignmentNo}">
						<input id="courseNo" type="hidden" name="courseNo" value="${assignmentVo.courseNo}">
						<input id="teacherNo" type="hidden" name="teacherNo" value="${authUser.userNo}">
						<input id="scheduleNo" type="hidden" name="scheduleNo" value="${assignmentVo.scheduleNo }">
						<div class="col-xs-9">
							<div class="form-group" style="margin-left:1px; margin-right:1px;">
								<input id="assignmentTitle" type="text" class="form-control input-lg" value="${assignmentVo.assignmentTitle }" autofocus>
							</div>
							<div class="panel">
								<div class="panel-body">
									<div id="demo-summernote">
										${assignmentVo.assignmentContent}
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
									<div id="dropzone">
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
									</div>
								</div>
								<!--===================================================-->
								<!-- End Dropzonejs -->
								<ul id="fileList" class="list-group">
								</ul>
								<hr>
								<div class="form-horizontal">
									<div class="form-group" style="padding-left:10px;">
										<label class="control-label text-left" for="demo-hor-inputpass">subject</label>
										<div class="">
											<div class="select">
												<select class="form-control"  id="selectSubject">
													<option value="${assignmentVo.subjectNo}">${assignmentVo.subjectTitle }</option>
													<c:forEach items="${subjectList}" var="subjectVo">
														<c:if test="${assignmentVo.subjectNo ne subjectVo.subjectNo }">
															<option value="${subjectVo.subjectNo}">${subjectVo.subjectTitle}</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group" style="padding-left:10px;">
										<label class="control-label text-left" for="demo-hor-inputpass">chapter</label>
										<div class="">
											<div class="select">
												<select class="form-control"  id="selectChapter">
													<option value="${assignmentVo.chapterNo}">${assignmentVo.chapterContent}</option>
													<c:forEach items="${subjectList}" var="subjectVo">
														<c:if test="${assignmentVo.subjectNo eq subjectVo.subjectNo }">
															<c:forEach items="${subjectVo.chapterList}" var="chapterVo">
																<c:if test="${assignmentVo.chapterNo ne chapterVo.chapterNo }">
																	<option value="${chapterVo.chapterNo}">${chapterVo.chapterContent}</option>
																</c:if>
															</c:forEach>
														</c:if>
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
											<input id="endDate" type="hidden" value="${assignmentVo.endDate}"> 
											<div></div>
										</div>
										<!--===================================================-->
									</div>
									<div>
										<span class="pull-right"><button class="btn btn-primary" id="btnEnroll">수정하기</button></span>
										<span class="pull-right" style="margin-right:5px;"><a href="${pageContext.request.contextPath }/${coursePath}/assignment/list"><button class="btn btn-danger">돌아가기</button></a></span>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
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
	<!--Bootstrap Select [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>

	<!--Select2 [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/select2/js/select2.min.js"></script>
	<!--Custom script [ DEMONSTRATION ]-->
	<!--===================================================-->
	<!-- blog-edit 에서 스크립트 페이지 찾기 sample page 안에 있음  -->
	<script>
		var fileList = [];
	
		// DROPZONE.JS
		// =================================================================
		// Require Dropzone
		// http://www.dropzonejs.com/
		// =================================================================
		//파일 업로드 드래그 앤 드롭할때 
		$("#dropzone").dropzone({
			url: "${pageContext.request.contextPath }/${coursePath}/assignment/upload" , 
			success : function(file, fileVo){
						console.log(file);
						console.log(fileVo);
						fileList.push(fileVo);
						console.log(fileList);
						console.log(fileList.length);
						
				    }
		});
		
		$(document).on('nifty.ready', function() {
			
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
				format : "yyyy-mm-dd",
				todayBtn : "linked",
				autoclose : true,
				todayHighlight : true
			});

		});
		
		$(document).ready(function() {
			var assignmentNo = $("[name=assignmentNo]").val();
			console.log(assignmentNo);
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/getFileList",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({assignmentNo : assignmentNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log(response.data);
						
						for(var i=0; i<response.data.length; i++){
							renderFileList(response.data[i], "down");
							fileList.push(response.data[i]);
						}
					} else {
						
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
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
			console.log("과제 수정");
			
			var assignmentNo = $("#assignmentNo").val();
			var assignmentTitle = $("#assignmentTitle").val();
			var assignmentContent = $('#demo-summernote').summernote('code');
			var selectDate = $('#select-day').val();
			var endDate = $("#endDate").val();
			var subjectNo = $("#selectSubject").val();
			var chapterNo = $("#selectChapter").val();
			var courseNo = $('#courseNo').val();
			var teacherNo = $('#teacherNo').val();
			var scheduleNo = $('#scheduleNo').val();
			
			var assignmentVo = {};
			assignmentVo["assignmentNo"] = assignmentNo;
			assignmentVo["assignmentTitle"] = assignmentTitle;
			assignmentVo["assignmentContent"] = assignmentContent;
			assignmentVo["endDate"] = endDate;
			assignmentVo["selectDate"] = selectDate;
			assignmentVo["subjectNo"] = subjectNo;
			assignmentVo["chapterNo"] = chapterNo;
			assignmentVo["courseNo"] = courseNo;
			assignmentVo["teacherNo"] = teacherNo;
			assignmentVo["scheduleNo"] = scheduleNo;
			
			if(fileList.length != 0){
				assignmentVo["fileList"] = fileList;
			}
			
			console.log(assignmentVo);
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/modifyAssignment",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(assignmentVo),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						alert("과제 수정 성공");
						window.location = "http://localhost:8088/ams/" + response.data + "/assignment/list";
					} else {
						alert("과제 수정 실패");
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		$("#fileList").on("click", "#btnDeleteFile", function(){
			console.log("delete file");
			var $this = $(this);
			var fileNo = $this.data("fileno");
			
			$("#file" + fileNo).remove();
			for(var i=0; i<fileList.length; i++){
				if(fileList[i].fileNo == fileNo){
					fileList.splice(i,1);
				}
			}
			
			console.log(fileList);
		});
		
		function renderFileList(fileUpLoadVo, updown) {
			console.log("renderFileList 실행");
			var str = "";
			str += "<li id='file" + fileUpLoadVo.fileNo + "' class='list-group-item'><a href=" + fileUpLoadVo.filepath + "> <strong>" + fileUpLoadVo.fileName + "</strong> <i class='demo-psi-paperclip icon-lg icon-fw'></i></a> ";
			str += "<span id='btnDeleteFile' class='btn btn-xs btn-danger pull-right' data-fileno=" + fileUpLoadVo.fileNo + "><i class='fa fa-trash'></i></span></li>";
			
			if (updown == "up") {
				$("#fileList").prepend(str);
			} else if (updown == "down") {
				$("#fileList").append(str);
			} else {
				console.log("updown 오류");
			}
		}
	</script>
</body>
</html>
