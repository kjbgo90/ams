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

<title>Manage Posts | Nifty - Admin Template</title>


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


<!--Animate.css [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/animate.css" rel="stylesheet">

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

		<div class="boxed">

			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				<div id="page-head">

					<!--Page Title-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<div id="page-title">
						<h1 class="page-header text-overflow">과목관리</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->

					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">교육과정 </a></li>
						<li class="active">과목관리</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->
				</div>
				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="panel">
						<div class="panel-heading">
							<br>
							<h3 class="panel-title text-2x">과목관리</h3>
						</div>
						<hr>
						<div class="panel-body  col-sm-3">
							<div class="pad-btm form-inline">
								<div class="row">
									<div class="col-sm-6 table-toolbar-left">
										<span style="font-size: 20px;">과목</span>


									</div>
									<div class="col-sm-6 table-toolbar-right">
										<button class="btn btn-purple" data-target="#subject-regist-modal" data-toggle="modal">
											<i class="demo-pli-add"></i> 과목등록
										</button>

									</div>
								</div>
								<div class="row">
									<div class="list-group" id="subjectList">
										<c:forEach items="${SCListMap.subjectList }" var="vo" >
											<a href="#" class="list-group-item subjectPick subject${vo.subjectNo }" data-subjectno="${vo.subjectNo }"> 
												<span class="text-main text-semibold subTitle">${vo.subjectTitle }</span><br> 
												<small class="text-muted subDate">${vo.startDate } - ${vo.endDate }</small>
											</a>
										</c:forEach>
									</div>
								</div>
							</div>

						</div>

						<div class="panel-body  col-sm-9">
							<div class="pad-btm form-inline">
								<div class="row">
									<div class="col-sm-6 table-toolbar-left">
										<span style="font-size: 20px;">챕터</span>

									</div>
									<div class="col-sm-6 table-toolbar-right">
										<button id="chapter-regist-button" class="btn btn-purple" data-target="#chapter-regist-modal" data-toggle="modal">
											<i class="demo-pli-add"></i> 챕터등록
										</button>
									</div>
								</div>
								<div class="row">
									<div class="table-responsive">
										<table class="table table-striped bord-all" id="chapterTable">
											<thead>
												<tr class="text-2x row">
													<th class="col-sm-9">
														<span id="subjectTitle" data-subno="${SCListMap.subjectVo.subjectNo }">${SCListMap.subjectVo.subjectTitle } </span> 
														<i class="btn btn-circle pad-no pli-gear subjectEdit"
															data-end="${SCListMap.subjectVo.endDate}" data-start="${SCListMap.subjectVo.startDate}" data-sno="${SCListMap.subjectVo.scheduleNo}" 
															data-title="${SCListMap.subjectVo.subjectTitle}" data-no="${SCListMap.subjectVo.subjectNo}" data-memo="${SCListMap.subjectVo.scheduleMemo}" 
															data-target="#subject-edit-modal" data-toggle="modal">
														</i>
													</th>
													<th class="col-sm-3">관리</th>
												</tr>
											</thead>
											<tbody class="chapterBody">
												<c:forEach items="${SCListMap.chapterList }" var="vo">
													<tr class="chapterManage chapter${vo.chapterNo } row" data-chapterno="${vo.chapterNo }" data-chaptercon="${vo.chapterContent }">
														<td class="col-sm-9"><span>${vo.chapterContent }</span></td>
														<td class="col-sm-3"><a href="#" class="btn-link" data-target="#chapter-edit-modal" data-toggle="modal"> [편집]</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
						<!--===================================================-->
						<!--End Data Table-->

						<div class="row pad-btm"></div>
						<!--Posts Table-->
						<!--===================================================-->
						<div class="panel-body" style="padding-left: 79px; padding-right: 70px;">

							<div class="row">

								<div class="col-sm-7 text-right"></div>

							</div>
						</div>
						<!--===================================================-->
						<!--End Posts Table-->

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
		<!-- modal창들 -->
		<!--===================================================-->
		<div class="panel panel-trans">
			<div class="panel-body demo-nifty-modal">
	
				<!--Static Examplel-->
				<div class="modal fade" id="subject-regist-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<i class="pci-cross pci-circle"></i>
								</button>
								<h4 class="modal-title">과목등록</h4>
							</div>
							<form method="post" action="${pageContext.request.contextPath }/${coursePath }/management/subject/write">
								<div class="modal-body">
									<div class="form-group">
										<div class="row mar-top">
											<label class="col-sm-3 control-label text-center">과목명</label>
											<div class="col-sm-9">
												<input placeholder="과목명" type="text" name="subjectTitle" class="form-control">
											</div>
										</div>
										<div class="row mar-top">
											<label class="col-sm-3 control-label text-center">기간</label>
											<div class="col-sm-9" id="dp-range">
												<div class="input-daterange input-group" id="datepicker">
													<input type="text" placeholder="과목 시작일" class="form-control" name="startDate" /> 
													<span class="input-group-addon">to</span> 
													<input type="text" placeholder="과목 종료일" class="form-control" name="endDate" />
												</div>
											</div>
										</div>
										<div class="row mar-top">
											<label class="col-sm-3 control-label text-center">과목정보</label>
											<div class="col-sm-9">
												<textarea placeholder="과목정보를 입력해주세요" rows="5" class="form-control" name="scheduleMemo"></textarea>
											</div>
										</div>
									</div>
								</div>
	
								<div class="modal-footer">
									<button class="btn btn-primary" type="submit">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
	
				<div class="modal fade" id="subject-edit-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<i class="pci-cross pci-circle"></i>
								</button>
								<h4 class="modal-title">과목편집</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<div class="row mar-top">
										<label class="col-sm-3 control-label text-center">과목명</label>
										<div class="col-sm-9">
											<input type="text" id="subject-edit-title" class="form-control">
										</div>
									</div>
									
									<div class="row mar-top">
										<label class="col-sm-3 control-label text-center">기간</label>
										<div class="col-sm-9" id="dp-range">
											<div class="input-daterange input-group" id="datepicker">
												<input type="text" class="form-control" id="subject-edit-start" /> <span class="input-group-addon">to</span> <input type="text" class="form-control" id="subject-edit-end" />
											</div>
										</div>
									</div>
									<div class="row mar-top">
										<label class="col-sm-3 control-label text-center">과목정보</label>
										<div class="col-sm-9">
											<textarea rows="5" class="form-control" id="subject-edit-scheduleMemo"></textarea>
										</div>
									</div>
									
								</div>
								
							</div>
	
							<div class="modal-footer">
								<div class="row">
									<div class="form-group col-sm-2 col-sm-offset-8">
										<form method="post" action="${pageContext.request.contextPath }/${coursePath }/management/subject/delete">
											<input type="hidden" id="subject-edit-scheduleNo" name="delScheduleNo"> <input type="hidden" id="subject-edit-subjectNo" name="delSubjectNo">
											<button class="btn btn-danger" type="submit">삭제</button>
										</form>
									</div>
									<button class="btn btn-primary col-sm-1" id="subject-edit">수정</button>
								</div>
							</div>
						</div>
					</div>
				</div>
	
	
				<div class="modal fade" id="chapter-regist-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<i class="pci-cross pci-circle"></i>
								</button>
								<h4 class="modal-title">챕터등록</h4>
							</div>
	
							<div class="modal-body">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="demo-hor-inputemail">챕터명</label>
									<div class="col-sm-9">
										<input type="text" name="chapterContent" class="form-control">
									</div>
									<input type="hidden" id="regist-subject-no"> 
								</div>
	
							</div>
	
							<div class="modal-footer">
								<button class="btn btn-primary" id="chapter-regist">등록</button>
							</div>
	
						</div>
					</div>
				</div>
	
	
				<div class="modal fade" id="chapter-edit-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<i class="pci-cross pci-circle"></i>
								</button>
								<h4 class="modal-title">챕터편집</h4>
							</div>
	
							<div class="modal-body">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="demo-hor-inputemail">챕터명</label>
									<div class="col-sm-9">
										<input type="text" id="edit-chapter-content" class="form-control"> <input type="hidden" id="edit-chapter-no"> 
									</div>
								</div>
	
							</div>
	
							<div class="modal-footer">
								<div class="row">
									<button class="btn btn-danger col-sm-1 col-sm-offset-9" id="chapter-del">삭제</button>
									<button class="btn btn-primary col-sm-1 col-sm-offset-1" id="chapter-edit">수정</button>
								</div>
							</div>
						</div>
					</div>
				</div>
	
	
			</div>
		</div>
		<!--===================================================-->
		<!-- END 모달창 -->
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

	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootbox.js"></script>

	<!--Modals [ SAMPLE ]-->
	<script src="${pageContext.request.contextPath }/assets/js/ui-modals.js"></script>


</body>

<script type="text/javascript">
	/* bootstrap-datepicker사용하는 스크립트 */
	$('#dp-range .input-daterange').datepicker({
		format : "yyyy-mm-dd",
		todayBtn : "linked",
		autoclose : false,
		todayHighlight : false
	});

	/* 과목명 테이블 클릭시 색깔이 변하고, 챕터 새로운 챕터 리스트를 불러오는 스크립트 */
	$("#subjectList").on("click", ".subjectPick", function() {
		var $this = $(this);
		var subjectNo = $this.data("subjectno");
		
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/management/subject/pick",
			type : "post",
			data : {subjectNo : subjectNo },
			dataType : "json",
			success : function(map) {
				$("#chapterTable").empty();
				chapterTableRender(map);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});

	/* 챕터 내용을 수정하는 모달창에 정보를 띄우는 스크립트 */
	$("#chapterTable").on("click", ".chapterManage", function() {
		var $this = $(this);
		var chapterNo = $this.data("chapterno");
		var chapterContent = $this.data("chaptercon");

		$("#edit-chapter-content").val("");
		$("#edit-chapter-no").val("");

		$("#edit-chapter-content").val(chapterContent);
		$("#edit-chapter-no").val(chapterNo);
	});

	$("#chapter-edit").on("click", function() {
		var chapterNo = $("#edit-chapter-no").val();
		var chapterContent = $("#edit-chapter-content").val();
		var chapterClass = ".chapter" + chapterNo;

		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/management/chapter/edit",
			type : "post",
			data : {chapterNo : chapterNo,
					chapterContent : chapterContent},
			dataType : "json",
			success : function(chapterVo) {
				chapterEditRender(chapterVo, chapterClass);
				$("#chapter-edit-modal").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	/* 서브젝트 수정 모달창에 정보를 넣어주는 스크립트 */
	$("#chapterTable").on("click", ".subjectEdit", function() {
		var $this = $(this);
		var subjectNo = $this.data("no");
		var subjectTitle = $this.data("title");
		var scheduleNo = $this.data("sno");
		var startDate = $this.data("start");
		var endDate = $this.data("end");
		var scheduleMemo = $this.data("memo");

		$("#subject-edit-title").val("");
		$("#subject-edit-start").val("");
		$("#subject-edit-end").val("");
		$("#subject-edit-subjectNo").val("");
		$("#subject-edit-scheduleNo").val("");
		$("#subject-edit-scheduleMemo").val("");

		$("#subject-edit-title").val(subjectTitle);
		$("#subject-edit-start").val(startDate);
		$("#subject-edit-end").val(endDate);
		$("#subject-edit-subjectNo").val(subjectNo);
		$("#subject-edit-scheduleNo").val(scheduleNo);
		$("#subject-edit-scheduleMemo").val(scheduleMemo);

	});

	/* 수정된 데이터를 바탕으로 subject를 수정하는 ajax 스크립트 */
	$("#subject-edit").on("click", function() {
		var subjectVo = {subjectTitle : $("#subject-edit-title").val(),
						 startDate : $("#subject-edit-start").val(),
						 endDate : $("#subject-edit-end").val(),
						 subjectNo : $("#subject-edit-subjectNo").val(),
						 scheduleNo : $("#subject-edit-scheduleNo").val(),
						 scheduleMemo : $("#subject-edit-scheduleMemo").val()};
		
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/management/subject/edit",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(subjectVo),
			dataType : "json",
			success : function(subjectVo) {
				var subjectClass = ".subject" + $("#subjectTitle").data("subno");
				
				$("#subjectTitle").empty();
				$("#subjectTitle").html(subjectVo.subjectTitle);
				$(subjectClass).children(".subTitle").empty();
				$(subjectClass).children(".subTitle").html(subjectVo.subjectTitle);
				$(subjectClass).children(".subDate").empty();
				$(subjectClass).children(".subDate").html(subjectVo.startDate + " - " + subjectVo.endDate);
				$("#subject-edit-modal").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	/* 선택된 과목에 챕터를 등록하는 정보를 모달창에 넣어주는 스크립트 */
	$("#chapter-regist-button").on("click", function() {
		var subjectNo = $("#subjectTitle").data("subno");
		
		$("[name=chapterContent]").val("");
		$("#regist-subject-no").val("");
		$("#regist-subject-no").val(subjectNo);
	});
	
	/* 입력된 내용을 바탕으로 해당 과목에 챕터를 등록하는 스크립트 */
	$("#chapter-regist").on("click", function() {
		var subjectNo = $("#regist-subject-no").val();
		var chapterContent = $("[name=chapterContent]").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/management/chapter/regist",
			type : "post",
			data : {subjectNo : subjectNo,
					chapterContent : chapterContent},
			dataType : "json",
			success : function(chapterVo) {
				chapterRender(chapterVo);
				$("#chapter-regist-modal").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});
	
	/* 챕터의 내용을 삭제하는 스크립트 */
	$("#chapter-del").on("click", function(){
		var delChapterNo = $("#edit-chapter-no").val();
		var chapterClass = ".chapter" + delChapterNo;
		
		console.log(delChapterNo);
		
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/management/chapter/delete",
			type : "post",
			data : {chapterNo : delChapterNo},
			dataType : "json",
			success : function(result) {
				console.log(result);
				if(result == 1){
					$(chapterClass).remove();
				};
				$("#chapter-edit-modal").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	function chapterEditRender(chapterVo, chapterClass){
		var str = "";
		
		str += "<td class='col-sm-9'><span>" + chapterVo.chapterContent  + "</span></td>";
		str += "<td class='col-sm-3'><a href='#' class='btn-link' data-target='#chapter-edit-modal' data-toggle='modal'> [편집]</a></td>";
		
		$(chapterClass).empty();
		$(chapterClass).append(str);
	};
	
	function chapterTableRender(map){
		var str = "";
		
		str += "<thead>";
		str += "	<tr class='text-2x row'>";
		str += "		<th class='col-sm-9'>";
		str += "			<span id='subjectTitle' data-subno='" + map.subjectVo.subjectNo + "'>" + map.subjectVo.subjectTitle  + " </span>";
		str += "			<i class='btn btn-circle pad-no pli-gear subjectEdit'";
		str += "				data-end='" + map.subjectVo.endDate + "' data-start='" + map.subjectVo.startDate + "' data-sno='" + map.subjectVo.scheduleNo + "' ";
		str += "				data-title='" + map.subjectVo.subjectTitle + "' data-no='" + map.subjectVo.subjectNo + "' data-memo='" + map.subjectVo.scheduleMemo + "' ";
		str += "				data-target='#subject-edit-modal' data-toggle='modal'>";
		str += "			</i>";
		str += "		</th>";
		str += "		<th class='col-sm-3'>관리</th>";
		str += "</thead>";
		str += "<tbody class='chapterBody'>";
		for(var i = 0; i < map.chapterList.length; i++){
			str += "<tr class='chapterManage chapter" + map.chapterList[i].chapterNo + " row' data-chapterno='" + map.chapterList[i].chapterNo + "' data-chaptercon='" + map.chapterList[i].chapterContent + "'>";
			str += "	<td class='col-sm-9'><span>" + map.chapterList[i].chapterContent  + "</span></td>";
			str += "	<td class='col-sm-3'><a href='#' class='btn-link' data-target='#chapter-edit-modal' data-toggle='modal'> [편집]</a></td>";
			str += "</tr>";
		};
		str += "</tbody>";
		
		$("#chapterTable").append(str);
		
	};
	
	function chapterRender(chapterVo){
		var str = "";
		
		str += "<tr class='chapterManage chapter" + chapterVo.chapterNo + " row' data-chapterno='" + chapterVo.chapterNo + "' data-chaptercon='" + chapterVo.chapterContent + "'>";
		str += "	<td class='col-sm-9'><span>" + chapterVo.chapterContent  + "</span></td>";
		str += "	<td class='col-sm-3'><a href='#' class='btn-link' data-target='#chapter-edit-modal' data-toggle='modal'> [편집]</a></td>";
		str += "</tr>";
		
		$(".chapterBody").append(str);
	}
</script>

</html>
