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


<!--Dropzone [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css"
	rel="stylesheet">

<!--Chosen [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/chosen/chosen.css"
	rel="stylesheet">


<!--JSTree [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/jstree/themes/default/style.css"
	rel="stylesheet">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery.gdocsviewer.min.js"></script>


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
						<h1 class="page-header text-overflow">나의 자료실</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li>자료실</li>
						<li class="active">나의 자료실
						</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->
				</div>

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="panel">
						<div class="pad-all file-manager">
							<div class="fixed-fluid">
								<div class="fixed-sm-200 pull-sm-left file-sidebar">
									<div class="bord-btm pad-btm">
										<button data-target="#lg-modal" data-toggle="modal"
											class="btn btn-warning">UPLOAD</button>
									</div>
									<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Folders</p>
									<div class="list-group bg-trans pad-btm bord-btm">
										<div id="fileTree">
											<ul id="fileTreeList">

											</ul>
										</div>
									</div>
									<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Tags</p>
									<ul id="tagList" class="list-inline mar-hor">
									</ul>
								</div>
								<div class="fluid file-panel">
									<div class="bord-btm pad-ver">

										<!-- 바뀌게 만들기  -->
										<ol id="changeFolder" class="breadcrumb">
											<li class="active">home</li>
										</ol>
									</div>
									<div class="file-toolbar bord-btm">
										<div class="btn-file-toolbar">
											<a class="btn btn-icon add-tooltip" id="goHome"
												data-original-title="Home" data-toggle="tooltip"> <i
												class="icon-2x demo-pli-home"></i>
											</a> <a class="btn btn-icon add-tooltip" id="refreshHere"
												data-original-title="Refresh" data-toggle="tooltip"> <i
												class="icon-2x demo-pli-reload-3"></i>
											</a>
										</div>
										<div class="btn-file-toolbar">
											<a class="btn btn-icon add-tooltip" data-original-title="New Folder" data-target="#sm-modal" data-toggle="modal">
												<i class="icon-2x demo-pli-folder"></i>
											</a>
										</div>
										<div class="btn-file-toolbar pull-right">
											<a class="btn btn-icon add-tooltip" id="deleteAnybody"
												data-original-title="Delete" data-toggle="tooltip"> <i
												class="icon-2x demo-pli-recycling"></i>
											</a> <a class="btn btn-icon add-tooltip" id="downloadFile"
												data-original-title="Download" data-toggle="tooltip"> <i
												class="icon-2x demo-pli-download-from-cloud"></i>
											</a>
										</div>
									</div>
									<ul id="fileList" class="file-list">

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



			<!-- SCROLL PAGE BUTTON -->
			<!--===================================================-->
			<button class="scroll-top btn">
				<i class="pci-chevron chevron-up"></i>
			</button>
			<!--===================================================-->
		</div>


		<input id="dataRoomNoByInput" value="-1" class="hidden magic-checkbox"
			name="dataRoomNoByInput" type="checkbox" checked="checked">




		<!--  모달 창  -->
		<!--Large Bootstrap Modal-->
		<!--===================================================-->
		<div id="lg-modal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<i class="pci-cross pci-circle"></i>
						</button>
						<h4 class="modal-title" id="myLargeModalLabel">UPLOAD</h4>
					</div>
					<div class="modal-body">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">UPLOAD FILE AND INSERT TAG</h3>
							</div>
							<div class="panel-body">
								<p class="text-main text-bold mar-no bord-btm">Drag’n’drop file uploads</p>
								<p>And then insert tag here</p>
								<!-- Multiple Select Choosen
							 		태크, 코스, 파일 개별적으로 저장 -->
								<!--===================================================-->

								<select id="tag-multiselect" class="tag_muti"
									data-placeholder="Choose a Course..." multiple tabindex="4">
								</select>

								<!--===================================================-->

								<br> <br> <br> <br>


								<!--Dropzonejs-->
								<!--===================================================-->

								<div id="dropzone" class="dropzone ">
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
										<input name="file" type="file" multiple>
									</div>
								</div>
								<!-- 위에 저장된 파일들의 정보들을 가져와서 리스트들을 뽑아보자  -->
								<div class="bord-btm pad-btm">
									<button id="insertTagFileUpLoad" data-target="#lg-modal"
										type="submit" data-toggle="modal" class="btn tbn-default">UPLOAD</button>
								</div>

								<!--===================================================-->
								<!-- End Dropzonejs -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->
		<!--End Large Bootstrap Modal-->




		<!--Small Bootstrap Modal-->
		<!--===================================================-->
		<div id="sm-modal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<i class="pci-cross pci-circle"></i>
						</button>
						<h4 class="modal-title" id="mySmallModalLabel">Small modal</h4>
					</div>
					<div class="modal-body">
						<input id="inputAddFolder" type="text" value="">
						<button type="submit" id="newFolder" class="btn btn-primary" data-target="#sm-modal" data-toggle="modal">폴더생성</button>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->
		<!--End Small Bootstrap Modal-->

		<!--===================================================-->
		<!-- END OF CONTAINER -->

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




	<!--=================================================-->
	<!--Dropzone [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>



	<!--Chosen [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/chosen/chosen.jquery.js"></script>



	<!--JSTree [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/jstree/jstree.js"></script>


	<script type="text/javascript">
		//클릭 안했을때 
		$(document).on('nifty.ready',function() {
									
							
							var dataRoomNoByInput = $('input:checkbox[name="dataRoomNoByInput"]:checked').val();

							console.log(dataRoomNoByInput);
							var courseNo = '${courseNo}';
							console.log('${coursePath}');
							console.log('${courseNo}');
							
							// 코스 넘버의 proomno = 0 인것을 가지고 와야한다. 
							
												
							
							$.ajax({
										url : "${pageContext.request.contextPath }/{coursePath}/dataroom/selectListAtFirst",
										type : "post",
										data : {
											courseNo : courseNo
										},
										dataType : "json",
										success : function(CourseDataroomVo) {
											console.log(CourseDataroomVo);
											console.log(CourseDataroomVo.dataRoomNo);
											$("#dataRoomNoByInput").val(CourseDataroomVo.dataRoomNo);
											
											
											var dataRoomNo =  $('input:checkbox[name="dataRoomNoByInput"]:checked').val();
											console.log(dataRoomNo);
											

											$.ajax({
														url : "${pageContext.request.contextPath }/{coursePath}/dataroom/selectFolderVo",
														type : "post",
														data : {
															dataRoomNo : dataRoomNo
														},
														dataType : "json",
														success : function(pRoomNo) {
															console.log(pRoomNo);
															if (pRoomNo != 0) {
																strList += "	<li>";
																strList += "		<div class='file-control'>";
																strList += "			<label for='file-list-1'></label>";
																strList += "		</div>";
																strList += "		<div class='file-attach-icon'></div> ";
																strList += "		<div id ='FolderBefore'>";
																strList += "			<div class='media-block'>";
																strList += "				<div class='media-left'>";
																strList += "					<i class='demo-psi-folder' data-dataroomno="+pRoomNo+"></i>";
																strList += "				</div>";
																strList += "				<div class='media-body'>";
																strList += "					<p class='file-name single-line'>...</p>";
																strList += "				</div>";
																strList += "			</div>";
																strList += "		</div>";
																strList += "	</li>";
															console.log("hi")	
															console.log(strList);
															$("#fileList").prepend(strList);
															strList = "";
															}
															

															//2. 폴더하고 파일리스트 뽑아주는것 
															$.ajax({
																		url : "${pageContext.request.contextPath }/{coursePath}/dataroom/folderList",
																		type : "post",
																		dataType : "json",
																		data : {
																			courseNo : courseNo,
																			dataRoomNo : dataRoomNo
																		},
																		success : function(list) {
																			console.log(list);
																			console.log(list[0].dataRoomNo);
																			var no = list[0].dataRoomNo;

																			strList2 = "";
																			strList = "";
																			

																						console.log(dataRoomNo);
																						console.log( "살려줘 !!!!!!!!!!!!");

																			for (var i = 0; i < list.length; i++) {
																				console.log(list.length);
																				strFolderList(list[i]);
																			}
																			$("#fileList").append(strList);
																			strList = "";

																			$.ajax({
																						url : "${pageContext.request.contextPath }/{coursePath}/dataroom/fileList",
																						type : "post",
																						data : {
																							courseNo : courseNo,
																							dataRoomNo : dataRoomNo
																						},
																						dataType : "json",
																						success : function(list) {
																							console.log(list);
																							console
																									.log(list[0].dataRoomNo);
																							var no = list[0].dataRoomNo;

																							for (var i = 0; i < list.length; i++) {
																								console
																										.log(list.length);

																								strFileList(list[i]);

																							}
																							$("#fileList")
																									.append(
																											strList2);

																							strList2 = "";
																						},
																						error : function(XHR,
																								status, error) {
																							console
																									.error(status
																											+ " : "
																											+ error);
																						}
																			});

																		},
																		error : function(XHR, status, error) {
																			console.error(status + " : "
																					+ error);
																		}
															});

															//!폴더하고 파일리스트 뽑아주는것 

														},
														error : function(XHR, status, error) {
															console.error(status + " : " + error);
														}
											});
									
											
											//태그 리스트
											tagList = "";
											$.ajax({
														url : "${pageContext.request.contextPath }/{coursePath}/dataroom/tagList",
														type : "post",
														dataType : "json",
														success : function(list) {
															console.log(list);
															console.log(list[0].dataTagNo);
															var no = list[0].dataTagNo;

															for (var i = 0; i < list.length; i++) {
																console.log(list.length);
																console
																		.log(list[i].dataTagName)
																// list 찾기 !!

																tagList += "<li id="+"dataTagNo"+list[i].dataTagNo+" data-dataTagNo="+list[i].dataTagNo+" class='tag tag-sm btn'>"
																		+ list[i].dataTagName
																		+ "</li>";

															}
															$("#tagList").html(tagList);

															tagList = "";
														},
														error : function(XHR, status, error) {
															console.error(status + " : "
																	+ error);
														}
											});
											
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
							});
							
							
						

							//태득 선택했을때 나오는 파일 리스트들 
							strList2 = "";
							$("#tagList").on("click","li",function() {
												console
														.log("select tag List !!")

												$this = $(this);
												console.log($this);
												var dataTagNo = $this
														.data("datatagno");
												console.log(dataTagNo);

												$.ajax({
															url : "${pageContext.request.contextPath }/{coursePath}/dataroom/SelectTagOnByDataTagNo",
															type : "post",
															data : {
																dataTagNo : dataTagNo
															},
															dataType : "json",
															success : function(
																	list) {
																console
																		.log(list);
																if (list.length != 0) {
																	for (var i = 0; i < list.length; i++) {
																		console
																				.log(list.length);

																		strFileList(list[i]);

																	}
																} else {
																	console
																			.log("empty !!")
																}
																$("#fileList")
																		.html(
																				strList2);

																strList2 = "";
															},
															error : function(
																	XHR,
																	status,
																	error) {
																console
																		.error(status
																				+ " : "
																				+ error);
															}
												});

							});

							//업로드할때 태그 
							tagList2 = "";
							$.ajax({
										url : "${pageContext.request.contextPath }/{coursePath}/dataroom/tagList",
										type : "post",
										dataType : "json",
										success : function(list) {
											console.log(list);
											console.log(list[0].dataTagNo);
											var no = list[0].dataTagNo;

											for (var i = 0; i < list.length; i++) {
												console.log(list.length);
												console
														.log(list[i].dataTagName)
												// list 찾기 !!

												tagList2 += "<option value="+list[i].dataTagNo+">"
														+ list[i].dataTagName
														+ "</option>";

											}
											$("#tag-multiselect").html(tagList2);
											$("#tag-multiselect").chosen({
												width : '100%'
											});

											tagList2 = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
							});

		});

		$("file-control").on("click", function() {
			console.log("asdf");
		});

		// 폴더  클릭시 생성되는 이벤
		$("#fileList").on("click","i",function() {
							strList = "";
							console.log("hi")
							$this = $(this);
							console.log($this);
							var dataRoomNo = $this.data("dataroomno");
							
							if(dataRoomNo != null){
							console.log(dataRoomNo);
							$("#dataRoomNoByInput").val(dataRoomNo);

							var dataRoomNoByInput2 = $(
									'input:checkbox[name="dataRoomNoByInput"]:checked')
									.val();
							console.log(dataRoomNoByInput2);

							var courseNo = '${courseNo}';
							$("#fileList").empty("")
							strList = "";
							$.ajax({
								url : "${pageContext.request.contextPath }/{coursePath}/dataroom/selectFolderVo",
								type : "post",
								data : {
									dataRoomNo : dataRoomNo
								},
								dataType : "json",
								success : function(pRoomNo) {
									console.log(pRoomNo);
									if (pRoomNo != 0) {
										strList += "	<li>";
										strList += "		<div class='file-control'>";
										strList += "			<label for='file-list-1'></label>";
										strList += "		</div>";
										strList += "		<div class='file-attach-icon'></div> ";
										strList += "		<div id ='FolderBefore'>";
										strList += "			<div class='media-block'>";
										strList += "				<div class='media-left'>";
										strList += "					<i class='demo-psi-folder' data-dataroomno="+pRoomNo+"></i>";
										strList += "				</div>";
										strList += "				<div class='media-body'>";
										strList += "					<p class='file-name single-line'>...</p>";
										strList += "				</div>";
										strList += "			</div>";
										strList += "		</div>";
										strList += "	</li>";
									console.log("hi")	
									console.log(strList);
									$("#fileList").prepend(strList);
									strList = "";
									}
									

									//2. 폴더하고 파일리스트 뽑아주는것 
									$.ajax({
												url : "${pageContext.request.contextPath }/{coursePath}/dataroom/folderList",
												type : "post",
												dataType : "json",
												data : {
													courseNo : courseNo,
													dataRoomNo : dataRoomNo
												},
												success : function(list) {
													console.log(list);
													console.log(list[0].dataRoomNo);
													var no = list[0].dataRoomNo;

													strList2 = "";
													strList = "";
													

																console.log(dataRoomNo);
																console.log( "살려줘 !!!!!!!!!!!!");

													for (var i = 0; i < list.length; i++) {
														console.log(list.length);
														strFolderList(list[i]);
													}
													$("#fileList").append(strList);
													strList = "";

													$.ajax({
																url : "${pageContext.request.contextPath }/{coursePath}/dataroom/fileList",
																type : "post",
																data : {
																	courseNo : courseNo,
																	dataRoomNo : dataRoomNo
																},
																dataType : "json",
																success : function(list) {
																	console.log(list);

																	for (var i = 0; i < list.length; i++) {
																		console
																				.log(list.length);

																		strFileList(list[i]);

																	}
																	$("#fileList")
																			.append(
																					strList2);

																	strList2 = "";
																},
																error : function(XHR,
																		status, error) {
																	console
																			.error(status
																					+ " : "
																					+ error);
																}
													});

												},
												error : function(XHR, status, error) {
													console.error(status + " : "
															+ error);
												}
									});

									//!폴더하고 파일리스트 뽑아주는것 

								},
								error : function(XHR, status, error) {
									console.error(status + " : " + error);
								}
					});
							}
							
							
							
							
							
							
							
							
							
							//바뀔때마다 폴더 이름 바꾸고 no도 바꿔버리기 
							changeFolderStr = ""
							changeFolderStr += "<li data-dataroomno="+CourseDataroomVo.dataRoomNo+">home</li>"
							changeFolderStr += "<li data-dataroomno="+CourseDataroomVo.dataRoomNo+">home</li>"
							changeFolderStr += "<li class='active' data-dataroomno="+CourseDataroomVo.dataRoomNo+">home</li>"
							$("#changeFolder").html();
		});

		$(".file-details").on("click", function() {
			console.log("hi")
		})

		//3.  새로고침 
		$("#refreshHere").on("click",function() {
							console.log("refresh here!!");
							$("#fileList").empty("")
							strList = "";
							var dataRoomNo = $(
									'input:checkbox[name="dataRoomNoByInput"]:checked')
									.val();
							if (dataRoomNo == -1) {
								console.log("-1~~");
								var dataRoomNo = 1;
							}
							var courseNo = '${courseNo}';
							$.ajax({
								url : "${pageContext.request.contextPath }/{coursePath}/dataroom/selectFolderVo",
								type : "post",
								data : {
									dataRoomNo : dataRoomNo
								},
								dataType : "json",
								success : function(pRoomNo) {
									console.log(pRoomNo);
									if (pRoomNo != 0) {
										strList += "	<li>";
										strList += "		<div class='file-control'>";
										strList += "			<label for='file-list-1'></label>";
										strList += "		</div>";
										strList += "		<div class='file-attach-icon'></div> ";
										strList += "		<div id ='FolderBefore'>";
										strList += "			<div class='media-block'>";
										strList += "				<div class='media-left'>";
										strList += "					<i class='demo-psi-folder' data-dataroomno="+pRoomNo+"></i>";
										strList += "				</div>";
										strList += "				<div class='media-body'>";
										strList += "					<p class='file-name single-line'>...</p>";
										strList += "				</div>";
										strList += "			</div>";
										strList += "		</div>";
										strList += "	</li>";
									console.log("hi")	
									console.log(strList);
									$("#fileList").prepend(strList);
									strList = "";
									}
									

									//2. 폴더하고 파일리스트 뽑아주는것 
									$.ajax({
												url : "${pageContext.request.contextPath }/{coursePath}/dataroom/folderList",
												type : "post",
												dataType : "json",
												data : {
													courseNo : courseNo,
													dataRoomNo : dataRoomNo
												},
												success : function(list) {
													console.log(list);
													console.log(list[0].dataRoomNo);
													var no = list[0].dataRoomNo;

													strList2 = "";
													strList = "";
													

																console.log(dataRoomNo);
																console.log( "살려줘 !!!!!!!!!!!!");

													for (var i = 0; i < list.length; i++) {
														console.log(list.length);
														strFolderList(list[i]);
													}
													$("#fileList").append(strList);
													strList = "";

													$.ajax({
																url : "${pageContext.request.contextPath }/{coursePath}/dataroom/fileList",
																type : "post",
																data : {
																	courseNo : courseNo,
																	dataRoomNo : dataRoomNo
																},
																dataType : "json",
																success : function(list) {
																	console.log(list);
																	console
																			.log(list[0].dataRoomNo);
																	var no = list[0].dataRoomNo;

																	for (var i = 0; i < list.length; i++) {
																		console
																				.log(list.length);

																		strFileList(list[i]);

																	}
																	$("#fileList")
																			.append(
																					strList2);

																	strList2 = "";
																},
																error : function(XHR,
																		status, error) {
																	console
																			.error(status
																					+ " : "
																					+ error);
																}
													});

												},
												error : function(XHR, status, error) {
													console.error(status + " : "
															+ error);
												}
									});

									//!폴더하고 파일리스트 뽑아주는것 

								},
								error : function(XHR, status, error) {
									console.error(status + " : " + error);
								}
					});
			
		});

		// 4. 폴더 생성 버튼 클릭시 나오는 버튼 
		$("#newFolder").on("click",function() {
							var courseNo = '${courseNo}';
							strList = "";
							var dataRoomNo = $('input:checkbox[name="dataRoomNoByInput"]:checked').val();
							if (dataRoomNo == -1) {
								console.log("-1~~~");
								var dataRoomNo = 1;
							}
							var dataRoomName = $("#inputAddFolder").val();
							console.log("add new folder " + dataRoomNo);
							console.log(dataRoomName);
							console.log(courseNo);
							$.ajax({
										url : "${pageContext.request.contextPath }/{coursePath}/dataroom/insertFolderByDataRoomNo",
										type : "post",
										data : {
											dataRoomName : dataRoomName,
											dataRoomNo : dataRoomNo,
											courseNo : courseNo
										},
										dataType : "json",
										success : function(CourseDataroomVo) {
											console.log("new folder ")
											console.log(CourseDataroomVo);

											strFolderList(CourseDataroomVo);
											$("#fileList").append(strList);
											strList = "";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
							});
						});

		
		//삭제할 수 있게 만들자! 
		$("#deleteAnybody").on("click",function() {
							console.log("delete anybody ")
						
							var checkedfilelength = $('input:checkbox[name="checkingFileBox"]:checked').length
							console.log(checkedfilelength);

							for(i=0;i<checkedfilelength;i++){
					        	console.log( i + "번째 파일 : " + $("input[name='checkingFileBox']").eq(i).attr("value") );
					        	var fileNo = $("input[name='checkingFileBox']").eq(i).attr("value");
					        	
					        	
					        	$.ajax({
									url : "${pageContext.request.contextPath }/{coursePath}/dataroom/deleteFile",
									type : "post",
									data : {
										fileNo:fileNo
									},
									dataType : "json",
									success : function() {
										console.log(dataRoomNo +"번째 삭제 ~")
										
									},
									error : function(XHR, status, error) {
										console.error(status + " : "
												+ error);
									} 
								});
					        	
					        	
					        	
					        }
							
							var checkedfolderlength = $('input:checkbox[name="checkingFolderBox"]:checked').length
							console.log(checkedfolderlength);
							
							 for(i=0;i<checkedfolderlength;i++){
						        	console.log( i + "번째 폴더 : " + $("input[name='checkingFolderBox']").eq(i).attr("value") );
						        	var dataRoomNo = $("input[name='checkingFolderBox']").eq(i).attr("value");

									//체크박스에 폴더가 있을 시에 폴더안에 데이터들이 있으면 삭제 불가능하게 만들자 
						        	
						        	/* 
						        	$.ajax({
										url : "${pageContext.request.contextPath }/dataroom/deleteFolder",
										type : "post",
										data : {
											dataRoomNo:dataRoomNo
										},
										dataType : "json",
										success : function(boolean) {
											if(boolean == 'true'){
												
												
											}
											
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										} 
									});*/
									
									
						        	
						        }

							//삭제된후에 같은 데이터룸의 리스트들을 다시 뽑아와야한다.

		});

		
		//다운로드 파일들 
		$("#downloadFile").on("click", function() {
			console.log("download this  ")
			//파일말고 폴더를 클릭했을 때에는 파일만 다운로드 가능하게 만들거나 폴더에 있는 모든 리스트들을 다운받기 
			//alert 경고 표시 
			
			var checkingFolderBox = $('input:checkbox[name="checkingFolderBox"]:checked').length
			console.log(checkedfilelength);
			
			if(checkingFolderBox == 0){
				
				var checkedfilelength = $('input:checkbox[name="checkingFileBox"]:checked').length
				
				console.log(checkedfilelength);
				
		        for(i=0;i<checkedfilelength;i++){
		        	var fileNo = $('input:checkbox[name="checkingFileBox"]:checked').eq(i).attr("value") 
		        	console.log(fileNo);
		        	
		        	window.open("${pageContext.request.contextPath }/{coursePath}/dataroom/downloadFile?fileNo="+fileNo);
		        	
		        	console.log(fileNo +"open");
		        	/* console.log( i + "번째 폴더 : " + $('input:checkbox[name="checkingFileBox"]:checked').eq(i).attr("value") );
		        	var fileNo = $('input:checkbox[name="checkingFileBox"]:checked').eq(i).attr("value") 
		        	console.log(fileNo);
		        	$.ajax({
						url : "${pageContext.request.contextPath }/dataroom/downloadFile",
						type : "post",
						data : {
							fileNo:fileNo
						},
						dataType : "json",
						success : function() {
							console.log("다운로드중~")
							
						},
						error : function(XHR, status, error) {
							console.error(status + " : "
									+ error);
						} 
					});*/
		        }console.log(fileNo +"close");
				
			}else{
				console.log("don't download !!");
				alert("폴더는 다운로드 받을 수 없습니다.");
			}

		});

		strList2 = "";
		strList = "";

		//집으로 ~~
		$("#goHome").on("click",function() {
							var courseNo = '${courseNo}';
							var dataRoomNo = 1
							console.log("go Home !!");

							$("#fileList").empty("")

							strList = "";
							$.ajax({
								url : "${pageContext.request.contextPath }/{coursePath}/dataroom/selectFolderVo",
								type : "post",
								data : {
									dataRoomNo : dataRoomNo
								},
								dataType : "json",
								success : function(pRoomNo) {
									console.log(pRoomNo);
									if (pRoomNo != 0) {
										strList += "	<li>";
										strList += "		<div class='file-control'>";
										strList += "			<label for='file-list-1'></label>";
										strList += "		</div>";
										strList += "		<div class='file-attach-icon'></div> ";
										strList += "		<div id ='FolderBefore'>";
										strList += "			<div class='media-block'>";
										strList += "				<div class='media-left'>";
										strList += "					<i class='demo-psi-folder' data-dataroomno="+pRoomNo+"></i>";
										strList += "				</div>";
										strList += "				<div class='media-body'>";
										strList += "					<p class='file-name single-line'>...</p>";
										strList += "				</div>";
										strList += "			</div>";
										strList += "		</div>";
										strList += "	</li>";
									console.log("hi")	
									console.log(strList);
									$("#fileList").prepend(strList);
									strList = "";
									}
									

									//2. 폴더하고 파일리스트 뽑아주는것 
									$.ajax({
												url : "${pageContext.request.contextPath }/{coursePath}/dataroom/folderList",
												type : "post",
												dataType : "json",
												data : {
													courseNo : courseNo,
													dataRoomNo : dataRoomNo
												},
												success : function(list) {
													console.log(list);
													console.log(list[0].dataRoomNo);
													var no = list[0].dataRoomNo;

													strList2 = "";
													strList = "";
													

																console.log(dataRoomNo);
																console.log( "살려줘 !!!!!!!!!!!!");

													for (var i = 0; i < list.length; i++) {
														console.log(list.length);
														strFolderList(list[i]);
													}
													$("#fileList").append(strList);
													strList = "";

													$.ajax({
																url : "${pageContext.request.contextPath }/{coursePath}/dataroom/fileList",
																type : "post",
																data : {
																	courseNo : courseNo,
																	dataRoomNo : dataRoomNo
																},
																dataType : "json",
																success : function(list) {
																	console.log(list);
																	console
																			.log(list[0].dataRoomNo);
																	var no = list[0].dataRoomNo;

																	for (var i = 0; i < list.length; i++) {
																		console
																				.log(list.length);

																		strFileList(list[i]);

																	}
																	$("#fileList")
																			.append(
																					strList2);

																	strList2 = "";
																},
																error : function(XHR,
																		status, error) {
																	console
																			.error(status
																					+ " : "
																					+ error);
																}
													});

												},
												error : function(XHR, status, error) {
													console.error(status + " : "
															+ error);
												}
									});

									//!폴더하고 파일리스트 뽑아주는것 

								},
								error : function(XHR, status, error) {
									console.error(status + " : " + error);
								}
					});
			

		});

		function strFileList(CourseDataroomVo) {
			// list 찾기 !!
			strList2 += "<li>";
			strList2 += "	<div class='file-control'>";
			strList2 += "		<input id="+"dataRoomList"+CourseDataroomVo.fileNo+" value="+CourseDataroomVo.fileNo+" class='magic-checkbox' name='checkingFileBox' type='checkbox'> ";
			strList2 += "		<label for="+"dataRoomList"+CourseDataroomVo.fileNo+"></label>";
			strList2 += "	</div>";
			strList2 += "	<div class='file-settings'>";
			strList2 += "	</div>";
			strList2 += "	<div class='file-attach-icon'></div> ";
			// 폴더는 폴더 안으로 들어가게 하고 파일중에 pdf이면 어디선가에서 프리뷰로 보게 했으면 좋겠다 

			var ext = CourseDataroomVo.fileName.split('.').pop().toLowerCase();
			console.log(ext)

			if (ext == 'jpg') {
				strList2 += "	<a class='file-details'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-file-jpg'></i>";

			} else if (ext == 'html') {
				strList2 += "	<a class='file-details'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-file-html'></i>";

			} else if (ext == 'txt') {
				strList2 += "	<a class='file-details'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-file-txt'></i>";

			} else if (ext == 'doc') {
				strList2 += "	<a class='file-details'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-doc'></i>";

			} else if (ext == 'pdf') {
				strList2 += "	<a href='https://docs.google.com/gview?url="
						+ CourseDataroomVo.filePath
						+ "&embedeede=true' class='embed file-details' id='test'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-doc'></i>";

			} else if (ext == 'ppt') {
				strList2 += "	<a href='https://docs.google.com/gview?url="
						+ CourseDataroomVo.filePath
						+ "&embedeede=true' class='embed file-details' id='test'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-doc'></i>";

			} else {
				strList2 += "	<a class='file-details'>";
				strList2 += "		<div class='media-block'>";
				strList2 += "			<div class='media-left'>";
				strList2 += "				<i class='demo-pli-file'></i>";

			}

			strList2 += "			</div>";
			strList2 += "			<div class='media-body/>";
			strList2 += "				<p class='file-name'>" + CourseDataroomVo.fileName
					+ "</p>";
			strList2 += "				<small>folder</small>";
			strList2 += "			</div>";
			strList2 += "		</div>";
			strList2 += "	</a>";
			strList2 += "</li>";
		}

		function strFolderListAtFirst(dataRoomNo) {
			strList = "";


			console.log(dataRoomNo);
			console.log( "살려줘 !!!!!!!!!!!!");

			$.ajax({
						url : "${pageContext.request.contextPath }/{coursePath}/dataroom/selectFolderVo",
						type : "post",
						data : {
							dataRoomNo : dataRoomNo
						},
						dataType : "json",
						success : function(pRoomNo) {
							console.log(pRoomNo);
							if (pRoomNo != 0) {
								strList += "	<li>";
								strList += "		<div class='file-control'>";
								strList += "			<label for='file-list-1'></label>";
								strList += "		</div>";
								strList += "		<div class='file-attach-icon'></div> ";
								strList += "		<div id ='FolderBefore'>";
								strList += "			<div class='media-block'>";
								strList += "				<div class='media-left'>";
								strList += "					<i class='demo-psi-folder' data-dataroomno="+pRoomNo+"></i>";
								strList += "				</div>";
								strList += "				<div class='media-body'>";
								strList += "					<p class='file-name single-line'>...</p>";
								strList += "				</div>";
								strList += "			</div>";
								strList += "		</div>";
								strList += "	</li>";
							console.log("hi")	
							console.log(strList);
							$("#fileList").append(strList);
							strList = "";
							}
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
			});
				
			
			
			

		}

		function strFolderList(CourseDataroomVo) {

			// list 찾기 !!
			strList += "<li>";
			strList += "	<div class='file-control'>";
			strList += "		<input id="+"2dataRoomList"+CourseDataroomVo.dataRoomNo+" class='magic-checkbox' value="+CourseDataroomVo.dataRoomNo+" name='checkingFolderBox' type='checkbox'> ";
			strList += "		<label for="+"2dataRoomList"+CourseDataroomVo.dataRoomNo+"></label>";
			strList += "	</div>";
			strList += "	<div class='file-settings'>";
			strList += "	</div>";
			strList += "	<div class='file-attach-icon'></div> ";
			// 폴더는 폴더 안으로 들어가게 하고 파일중에 pdf이면 어디선가에서 프리뷰로 보게 했으면 좋겠다 
			strList += "	<a class='file-details'>";
			strList += "		<div class='media-block'>";
			strList += "			<div class='media-left'>";
			strList += "				<i class='demo-psi-folder' data-dataroomno="+CourseDataroomVo.dataRoomNo+"></i>";
			strList += "			</div>";
			strList += "			<div class='media-body/>";
			strList += "				<p class='file-name'>"
					+ CourseDataroomVo.dataRoomName + "</p>";
			strList += "				<small>folder</small>";
			strList += "			</div>";
			strList += "		</div>";
			strList += "	</a>";
			strList += "</li>";
		}

		//앞으로 저장될 파일 리스트들 
		var fileList = [];
		var tagNoList = [];

		//파일 업로드 드래그 앤 드롭할때 
		$("#dropzone").dropzone({
			url : "${pageContext.request.contextPath }/{coursePath}/dataroom/upload",
			success : function(file, fileVo) {
				console.log(file);
				console.log(fileVo);
				fileList.push(fileVo);
				console.log(fileList);
				console.log(fileList.length);
			}
		});

		// 리스트 파일들을 태그 붙여서 업로드 할거다 
		$("#insertTagFileUpLoad").on("click",function() {
			
							
							console.log("file upload");
							var dataRoomNo = $(
									'input:checkbox[name="dataRoomNoByInput"]:checked')
									.val();
							if (dataRoomNo == -1) {
								console.log("`1~~~");
								var dataRoomNo = 1;
							}

							tagNoList = $("#tag-multiselect").val()
							console.log(tagNoList)
							console.log(tagNoList.length)

							if (fileList.length == 0) {
								alert('파일을 넣어주세요 !')
							} else {
								for (var i = 0; i < fileList.length; i++) {
									CourseDataroomVo = fileList[i];
									console.log(CourseDataroomVo.filePath);
									console.log(CourseDataroomVo);
									console.log(tagNoList)
									console.log(dataRoomNo);
									
									var fileName = CourseDataroomVo.fileName;
									var filePath = CourseDataroomVo.filePath;
									var fileSize = CourseDataroomVo.fileSize;
									var saveName = CourseDataroomVo.saveName;

									var jsonData = {
										fileName : fileName,
										filePath : filePath,
										fileSize : fileSize,
										saveName : saveName,
										tagNoList : tagNoList,
										dataRoomNo : dataRoomNo
									}

									$.ajax({
												url : "${pageContext.request.contextPath }/{coursePath}/dataroom/fileUploadInDB",
												type : "post",
												data : JSON.stringify(jsonData),
												dataType : "json",
												contentType : "application/json; charset=UTF-8",
												success : function() {
													window.location.replace("${pageContext.request.contextPath }/${coursePath}/dataroom/form")
												},
												error : function(XHR, status,
														error) {
													console.error(status
															+ " : " + error);
												}
									});
								}
							}
		});
		
		
		
		
		$("#changeFolder").on("click","li",function(){
			console.log("changeFolder");
		});
	</script>



</body>

</html>