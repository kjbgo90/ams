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
<!--Dropzone [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css" rel="stylesheet">
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
				<div id="page-content">
					<div class="fixed-fluid">
						<div class="fluid col-xs-7">
							<!--과제 Accordion-->
							<!--===================================================-->
							<div class="panel-group accordion" id="accordion">
								<c:forEach items="${subjectList}" var="subjectVo">
									<div class="panel">
										<!--Accordion title-->
										<div class="panel-heading" style="padding-left: 15px;">
											<h4 class="panel-title text-main text-bold text-lg text-uppercase">
												<a data-parent="#accordion" data-toggle="collapse" href="#collapse${subjectVo.subjectNo}">${subjectVo.subjectTitle}</a>
											</h4>
										</div>
										<!--Accordion content-->
										<div class="panel-collapse collapse" id="collapse${subjectVo.subjectNo}">
											<div class="panel-body" style="padding-top:5px;">
												<div class="panel-group accordion" id="accordionInside${subjectVo.subjectNo}">
													<!--내부 판넬 -->
													<c:choose>
														<c:when test="${empty subjectVo.assignmentListBySub }">
															<div class="text-center" style="padding-top: 40px; font-size: 20px; height: 100px;">
																<i class="pli-folder-hide icon-lg"></i> 과제함이 비었습니당~
															</div>
														</c:when>
														<c:otherwise>
															<c:forEach items="${subjectVo.assignmentListBySub}" var="assignmentVo">
																<div class="panel panel-bordered-primary">
																	<div class="panel-heading">
																		<h4 class="panel-title">
																			<a id="submitPage" data-assignno="${assignmentVo.assignmentNo}" data-parent="#accordionInside${subjectVo.subjectNo}" data-toggle="collapse" href="#collapse${subjectVo.subjectNo}Inside${assignmentVo.assignmentNo}">${assignmentVo.assignmentTitle}</a>
																		</h4>
																	</div>
																	<div class="panel-collapse collapse" id="collapse${subjectVo.subjectNo}Inside${assignmentVo.assignmentNo}">
																		<div class="panel-body">
																			<div class="row">
																				<div class="col-sm-7 toolbar-left">
																					<!--Sender Information-->
																					<div class="media">
																						<span class="media-left"> <img src="${pageContext.request.contextPath }${assignmentVo.logoPath}" class="img-circle img-sm" alt="Profile Picture">
																						</span>
																						<div class="media-body text-left">
																							<div class="text-bold">${assignmentVo.userName}</div>
																							<small class="text-muted">${assignmentVo.email}</small>
																						</div>
																					</div>
																				</div>
																				<div class="col-sm-5 toolbar-right">
																					<!--Details Information-->
																					<p class="mar-no">
																						<small class="text-muted">${assignmentVo.startDate}</small>
																					</p>
																				</div>
																			</div>
																			<p>${assignmentVo.assignmentContent}</p>
																		</div>
																		<!--List group-->
																		<ul class="list-group">
																			<li class="list-group-item">Chapter : ${assignmentVo.chapterContent}</li>
																			<li class="list-group-item">제출기한 : ${assignmentVo.endDate} 까지</li>
																			<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
																			</a></li>
																		</ul>
																	</div>
																</div>
															</c:forEach>
														</c:otherwise>
													</c:choose>
													<!--내부 판넬 -->
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!--===================================================-->
							<!--End 과제 Accordion-->
						</div>
						<div class="panel col-xs-5">
							<p class="pad-hor mar-top text-main text-bold text-lg text-uppercase" id="assignTitle" style="padding-left: 3px;">${lastAssignment.assignmentTitle }</p>
							<div class="panel panel-bordered-primary">
								<div class="panel-body">
									<form id="submitForm" method="post">
										<input type="hidden" name="userNo" value="${authUser.userNo }"> <input type="hidden" name="assignmentNo" value="${lastAssignment.assignmentNo }">
										<div class="row">
											<div class="col-sm-7 toolbar-left">
												<!--Sender Information-->
												<div class="media">
													<span class="media-left"> <img src="${pageContext.request.contextPath }${authUser.logoPath }" class="img-circle img-sm" alt="Profile Picture">
													</span>
													<div class="media-body text-left">
														<div class="text-bold">${authUser.userName }</div>
														<small class="text-muted">${authUser.email }</small>
													</div>
												</div>
											</div>
											<div class="col-sm-5 toolbar-right"></div>
										</div>
										<div>
											<p>comment</p>
											<textarea form="submitForm" name="submitContent" style="width: 100%; height: 80px;"></textarea>
										</div>
										<div>
											<div class="bord-top pad-ver">
												<!-- The fileinput-button span is used to style the file input field as button -->
												<span class="btn btn-primary fileinput-button dz-clickable"> <i class="fa fa-plus"></i> <span>파일 첨부</span>
												</span>
												<div id="dz-previews">
													<div id="dz-template" class="pad-top bord-top">
														<div class="media">
															<div class="media-body">
																<!--This is used as the file preview template-->
																<div class="media-block">
																	<div class="media-left">
																		<img class="dz-img" data-dz-thumbnail>
																	</div>
																	<div class="media-body">
																		<p class="text-main text-bold mar-no text-overflow" data-dz-name></p>
																		<span class="dz-error text-danger text-sm" data-dz-errormessage></span>
																		<p class="text-sm" data-dz-size></p>
																		<div id="dz-total-progress" style="opacity: 0">
																			<div class="progress progress-xs active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
																				<div class="progress-bar progress-bar-success" style="width: 0%;" data-dz-uploadprogress></div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="media-right">
																<button data-dz-remove class="btn btn-xs btn-danger dz-cancel">
																	<i class="demo-psi-trash"></i>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div>
												<input id="btnSubmit" type="button" class="btn btn-lg btn-danger pull-right" value="제출하기">
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="panel panel-bordered-primary" style="padding-left:10px; padding-right:10px;">
								<div class="panel-heading">
									<h3 class="panel-title text-bold" style="padding-left:7px">제출자 명단</h3>
								</div>
								<!--Table-->
								<table class="table">
									<thead>
										<tr>
											<th>Name</th>
											<th>File</th>
											<th>Date</th>
											<th>Detail</th>
										</tr>
									</thead>
									<tbody id="tbody">
										<c:forEach items="${submitList}" var="submitVo">
											<tr id="tr${submitVo.submitNo }">
												<td>${submitVo.userName}</td>
												<c:choose>
													<c:when test="${submitVo.fileName eq null}">
														<td>없음</td>
													</c:when>
													<c:otherwise>
														<td><a href="#"> <strong>${submitVo.fileName}</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
														</a></td>
													</c:otherwise>
												</c:choose>
												<td>${submitVo.submitDate}</td>
												<td><button id="submit-detail" class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal" data-submitno="${submitList.get(i).submitNo}">click</button></td>
											</tr>
										</c:forEach>
										<tr>
											<td>김재봉</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td>이종현</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td>강보은</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td>구민수</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td>이건창</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Default Bootstrap Modal-->
		<!--===================================================-->
		<div class="modal fade" id="demo-default-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!--Modal header-->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<i class="pci-cross pci-circle"></i>
						</button>
						<h4 class="modal-title">과제 상세보기</h4>
					</div>
					<!--Modal body-->
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-7 toolbar-left">
								<!--Sender Information-->
								<div class="media">
									<span class="media-left"> <img id="modal-logoPath" src="${pageContext.request.contextPath }${authUser.logoPath}" class="img-circle img-sm" alt="Profile Picture">
									</span>
									<div class="media-body text-left">
										<div class="text-bold" id="modal-userName">${authUser.userName }</div>
										<small class="text-muted" id="modal-email">${authUser.email }</small>
									</div>
								</div>
							</div>
							<div class="col-sm-5 toolbar-right">
								<!--Details Information-->
								<p class="mar-no">
									<small class="text-muted" id="modal-submitDate">Sunday 02, June 2019</small>
								</p>
							</div>
						</div>
						<div id="modal-submitContent">과제 제출했습니다. 이렇게 저렇게 실행하세요.</div>
					</div>
					<ul class="list-group" id="modal-fileName">
					</ul>
					<!--Modal footer-->
					<div class="modal-footer">
						<button class="btn btn-danger" id="btnDelete" data-submitno="">Delete</button>
						<button data-dismiss="modal" class="btn btn-primary" type="button">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->
		<!--End Default Bootstrap Modal-->
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
	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>
	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>
	<!--Form File Upload [ SAMPLE ]-->
	<script src="${pageContext.request.contextPath }/assets/js/form-file-upload.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#collapse${lastAssignment.subjectNo}").attr("class","panel-collapse collapse in");
			$("#collapse${lastAssignment.subjectNo}Inside${lastAssignment.assignmentNo}").attr("class","panel-collapse collapse in");
		});
	
		$("#accordion").on("click", "#submitPage", function(){
			console.log("제출함 보여주기");
			var $this = $(this);
			var assignmentNo = $this.data("assignno");
			console.log(assignmentNo);
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/getAssignment",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({assignmentNo : assignmentNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log("과제 제출 페이지 보기");
						console.log(response.data);
						
						$("#assignTitle").text(response.data.assignmentVo.assignmentTitle);
						$("[name=assignmentNo]").val(response.data.assignmentVo.assignmentNo);
						
						$("#tbody").empty();
						console.log(response.data.submitList);
						for(i=0; i<response.data.submitList.length; i++){
							renderList(response.data.submitList[i], "down");
						}
						
					} else {
						console.log("과제 제출 페이지 보기 실패~");
					}

				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		$("#btnSubmit").on("click",function() {
			console.log("submit");
			var form = new FormData(document
					.getElementById("submitForm"));
			console.log(form);

			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/submit",
				type : "post",
				contentType : false,
				processData : false,
				data : form,

				dataType : "json",

				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log("제출 성공");
						
						renderList(response.data, "up");
					} else {
						console.log("제출 실패");
					}
					
					$("[name=submitContent]").val('');
				},
				error : function(XHR, status, error) {
					console.error(status + " : "
							+ error);
				}
			});
		});
		
		$("#tbody").on("click", "#submit-detail", function(){
			console.log("submit-detail");
			var $this = $(this);
			var submitNo = $this.data("submitno");
			console.log(submitNo);
			
			$("#modal-userName").empty();
			$("#modal-email").empty();
			$("#modal-submitDate").empty();
			$("#modal-submitContent").empty();
			$("#modal-fileName").empty();
			$("#btnDelete").data("submitno", "");
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/getSubmit",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({submitNo : submitNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log("과제 상세보기");
						
						$("#modal-logoPath").attr("src", "${pageContext.request.contextPath }" + response.data.logoPath);
						$("#modal-userName").append(response.data.userName);
						$("#modal-email").append(response.data.email);
						$("#modal-submitDate").append(response.data.submitDate);
						$("#modal-submitContent").append(response.data.submitContent);
						$("#btnDelete").data("submitno", response.data.submitNo);
						if(response.data.fileName != null){
							$("#modal-fileName").append("<li class='list-group-item'>첨부파일 : <a href='#'> <strong>" + response.data.fileName + "</strong> <i class='demo-psi-paperclip icon-lg icon-fw'></i></a></li>");
						} else {
							$("#modal-fileName").append("<li class='list-group-item'>첨부파일 : <a href='#'> <strong>없음</strong></a></li>");
						}
						$("#demo-default-modal").modal();
					} else {
						console.log("모달 띄우기 실패");
					}

				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		$("#btnDelete").on("click", function(){
			console.log("delete 실행");
			var $this = $(this);
			var submitNo = $this.data("submitno");
			console.log(submitNo);
			
			$.ajax({

				url : "${pageContext.request.contextPath }/${coursePath}/assignment/deleteSubmit",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify({submitNo : submitNo}),

				dataType : "json",
				success : function(response) {
					/*성공시 처리해야될 코드 작성*/
					if (response.result === "success") {
						console.log("제출한 과제 삭제 성공");
						
						$("#tr" + response.data).remove();
					} else {
						console.log("제출한 과제 삭제 실패");
						alert("본인의 과제만 삭제 가능합니다.")
					}
					$("#demo-default-modal").modal("hide");
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		function renderList(submitVo, updown) {
			console.log("renderList 실행");
			var str = "";
			str += "<tr id='tr" + submitVo.submitNo + "'>";
			str += "	<td>" + submitVo.userName + "</td>";
			if(submitVo.fileName == null){
				str += "	<td>없음</td>";
			} else {
				str += "	<td><a href='#'> <strong>" + submitVo.fileName + "</strong> <i class='demo-psi-paperclip icon-lg icon-fw'></i></a></td>";
			}
			str += "	<td>" + submitVo.submitDate + "</td>";
			str += "	<td><button id='submit-detail' class='btn btn-sm btn-primary' data-target='#demo-default-modal' data-toggle='modal' data-submitno=" + submitVo.submitNo + ">click</button></td>";
			str += "</tr>";
			
			if (updown == "up") {
				$("#tbody").prepend(str);
			} else if (updown == "down") {
				$("#tbody").append(str);
			} else {
				console.log("updown 오류");
			}
		}
	</script>
</body>
</html>
