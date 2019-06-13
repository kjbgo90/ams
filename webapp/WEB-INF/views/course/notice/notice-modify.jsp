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

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">


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
rhd

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
						<h1 class="page-header text-overflow">공지사항</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">코스 </a></li>
						<li class="active">공지사항</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${coursePath}/notice/modify">
						<input type="hidden" name="postNo" value="${postVo.postNo}" >
						<!-- Contact Toolbar -->
						<!---------------------------------->

						<!---------------------------------->

						<div class="fixed-fluid">
							<div class="fixed-sm-300 pull-sm-right">
								<div class="panel">
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
												<div class="fallback">
													<form action="#" method="post" enctype="multipart/form-data">
														<input name="file" type="file" multiple>
													</form>
												</div>
											</form>
										</div>
										<!--===================================================-->
										<!-- End Dropzonejs -->


										<hr>


										<div class="form-horizontal">
											<div class="form-group"></div>
											<br>

											<div class="form-group">

												<!--Bootstrap Datepicker : Inline-->
												<!--===================================================-->
												<p class="text-main text-bold text-uppercase" style="margin-left: 10px;">
													공지등록 &nbsp; <input id="demo-checkbox-addons" class="magic-checkbox" type="checkbox"> <label for="demo-checkbox-addons"></label>
												</p>

												<div id="demo-dp-inline">
													<input id="select-day" type="hidden" value="">
													<div></div>
												</div>
												<!--===================================================-->


											</div>
										</div>
										<hr>
										<div class="form-group text-left" style="padding-left: 20px;">
											<!--Save draft button-->
											<button id="mail-save-btn" type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath }/${coursePath}/notice/list' ">
												<i class="-unread icon-lg icon-fw" ></i> 취소
											</button>


											<!--Discard button-->
											<button id="discard-btn" type="submit" class="btn btn-primary">
												<i class="icon-lg icon-fw"></i> 수정
											</button>
										</div>

									</div>
								</div>


							</div>
							<div class="fluid">

								<div class="panel">
									<div class="panel-body">
										<div class="row">
											<div class="col-sm-4">
												<div class="media pad-ver">
													<div class="media-left">
														<a href="#" class="box-inline"><img alt="Profile Picture" class="img-md img-circle" src="${pageContext.request.contextPath }/${authUser.logoPath }"></a>
													</div>
													<div class="media-body pad-top">
														<a href="#" class="box-inline"> <span class="text-lg text-semibold text-main">${authUser.userName }</span>
															<p class="text-sm">${authUser.email }</p>
														</a>
													</div>
												</div>
											</div>
										</div>


										<br>
										<!--Dropdowns Addons-->
										<!--===================================================-->
										<form class="form-horizontal">
											<div class="input-group mar-btm">
												<div class="input-group-btn dropdown"></div>
												<div class="input-group-btn dropdown"></div>

												<!-- <input type="text" placeholder="이름" class="form-control"> -->
											</div>
										</form>
										<!--===================================================-->
										<!--End Dropdowns Addons-->

										<%-- <form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${coursePath}/notice/write"> --%>
										<input type="hidden" name="userNo" value="${authUser.userNo }">

										<div class="input-group mar-btm">

											<!-- Bootstrap Select : primary -->
											<!--===================================================-->
											<div class="row">
												<div class="col-sm-6">
													<select class="selectpicker " id="cate">
														<option>공지</option>
														<option>긴급</option>
													</select>
													<!-- <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
													카테고리 <i class="dropdown-caret"></i>
												</button>
												<ul class="dropdown-menu" id="cate">
													<li><a href="#" >[공지]</a></li>s
													<li><a href="#" >[긴급]</a></li>
													<li class="divider"></li>
													<li><a href="#">Separated link</a></li>
												</ul> -->
												</div>
												<div class="col-sm-6">
													<input type="text" placeholder="제목" class="form-control " id="postTitle" value="${postVo.postTitle}">
												</div>
											</div>
										</div>



										<div id="demo-summernote">${postVo.postContent}</div>
										<%-- <div class="form-group text-left" style="padding-left: 20px;">
											<!--Save draft button-->
											<button id="mail-save-btn" type="button" class="btn btn-default">
												<i class="-unread icon-lg icon-fw" onclick="location.href='${pageContext.request.contextPath }/${coursePath}/notice/list' "></i> 취소
											</button>


											<!--Discard button-->
											<button id="discard-btn" type="submit" class="btn btn-primary">
												<i class="icon-lg icon-fw"></i> 작성
											</button>
										</div> --%>
										<!-- </form> -->
									</div>

								</div>
							</div>
						</div>
					</form>
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
						"Webapp/WEB-INF/views/blog/admin/blog-admin-write.jsp"
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

		//공지사항 저장 버튼 클릭할때
		$("#discard-btn").on("click", function() {
			event.preventDefault();
			console.log("저장");
			var markstr = $('#demo-summernote').summernote('code');
			var cate = $('#cate').val();
			var postTitle = $('#postTitle').val();
			var selectedDate = $('#select-day').val();
			var postResult = {};
			postResult["postNo"] = getUrlParams().postNo;
 			postResult["postTitle"] = postTitle;
			postResult["category"] = cate;
			postResult["postContent"] = markstr;
			postResult["regDate"] = selectedDate;

			console.log(markstr);
			console.log(cate);
			console.log(postTitle);
			console.log(selectedDate);
			//카테고리, 제목, 본문,  달력날자
			console.log("${pageContext.request.contextPath}/${coursePath}/notice/update");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/notice/update", //컨트롤주소
				type : "post",
				//dataType: "json",          // ajax 통신으로 받는 타입
			    contentType : 'application/json; charset=utf-8',
                data : JSON.stringify(postResult),  

				//여기부턴 받을때
				//dataType : "json",
				success : function(coursePath) {
				  console.log("성공 ");
				  window.location="http://localhost:8088/ams/" + coursePath + "/notice/list";
				
					
					
				},
		        error:function(jqXHR, textStatus, errorThrown) {
		          console.log("에러" + textStatus + " : " + errorThrown);
		        }
			}); 
			

		});
		
		function getUrlParams() {
		    var params = {};
		    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
		    return params;
		} 
	</script>

</body>
</html>
