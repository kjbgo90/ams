<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Class-schedule</title>


   	<!--STYLESHEET-->
	<!--=================================================-->

	<!--나눔 고딕 Font [ OPTIONAL ] -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

	<!--  autocomplete -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

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
    	
<%-- 
    <!--Demo [ DEMONSTRATION ]-->
    <link href="${pageContext.request.contextPath }/demo/css/demo/nifty-demo.min.css" rel="stylesheet">

 --%>
        
    <!--Full Calendar [ OPTIONAL ]-->
    <link href="${pageContext.request.contextPath }/assets/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/assets/plugins/fullcalendar/nifty-skin/fullcalendar-nifty.min.css" rel="stylesheet">
        
	<!--Chosen [ OPTIONAL ]-->
	<link href="${pageContext.request.contextPath }/assets/css/chosen.css" rel="stylesheet">
  
	<!--Bootstrap Datepicker [ OPTIONAL ]-->
	<link href="${pageContext.request.contextPath }/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.css" rel="stylesheet">		
    
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg">
        <!--NAVBAR-->
        <!--===================================================-->
        <!-- header -->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>        
        <!--===================================================-->
        <!--END NAVBAR-->

        <div class="boxed">

            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                <div id="page-head">
                    
                    </div>

                
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    
					
					    <div class="panel">
					        <div class="panel-body">
					            <div class="fixed-fluid">
					                <div class="fixed-sm-200 pull-sm-left fixed-right-border">
					                	<div class="form-group">
					                        <input type="text" id="schedule_title" placeholder="일정 이름" class="form-control" value="">
					                    </div>
					                    <button class="btn btn-block btn-purple btn-lg" id="schedule_search_btn">일정 검색</button>
					                    
					                    <hr>
					                    <p class="text-muted text-sm text-uppercase"><strong>오늘의 일정</strong></p>
					                    <div class="input-group pad-all bord-btm">
					                 		<div id="today-schedule">
					                 		
					                 		</div>
					            		</div>
					
					                    <!-- Draggable Events -->
					                    <!-- ============================================ -->
					                    <p class="text-muted text-sm text-uppercase"></p>
					                    <div id="demo-external-events">
					                    	<!-- 
					                        <div id="notice" class="fc-event fc-list" data-class="warning">공지사항</div>
					                        <div id="assign" class="fc-event fc-list" data-class="pink">과제</div>
					                        <div id="course" class="fc-event fc-list" data-class="dark">코스 일정</div>
					                        <div id="team" class="fc-event fc-list" data-class="purple">팀별 일정</div>
					                        <div id="person" class="fc-event fc-list" data-class="info">개인 일정</div>
					                         -->
					                    </div>
					                    <!-- ============================================ -->
					                </div>
					                <div class="fluid">
					                    <!-- Calendar placeholder-->
					                    <!-- ============================================ -->
					                    <div id='demo-calendar'></div>
					                    <!-- ============================================ -->
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

      	<!-- footer -->
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
    
    <!--schedule-register-modal-->
	<!--===================================================-->
	<div id="schedule-modal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">일정 등록</h4>
				</div>
				<div class="modal-body">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">일정 이름</h3>
						</div>
						<div class="panel-body">
							<input id="schedule-title" type="text" class="form-control"
								placeholder="Title">
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">기간</h3>
						</div>
						<div class="panel-body">
							<div id="dp-range">
								<div class="input-daterange input-group" id="datepicker"
									style="width: 407px;">
									<input type="text" class="form-control" id="schedule-start"
										name="start" /> <span class="input-group-addon">to</span> <input
										type="text" class="form-control" id="schedule-end" name="end" />
								</div>
							</div>
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">메모</h3>
						</div>
						<div class="panel-body">
							<input id="schedule-memo" type="text" class="form-control"
								placeholder="memo">
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">카테고리</h3>
						</div>
						<div class="panel-body">
							<div class="radio" id="schedule-category">
								<input id="demo-radio-1" class="magic-radio" type="radio"
									name="memberType" value="notice"> <label
									for="demo-radio-1">공지사항</label> <input id="demo-radio-2"
									class="magic-radio" type="radio" name="memberType"
									value="assignment"> <label for="demo-radio-2">과제</label>
								<input id="demo-radio-3" class="magic-radio" type="radio"
									name="memberType" value="course"> <label
									for="demo-radio-3">코스일정</label> <input id="demo-radio-4"
									class="magic-radio" type="radio" name="memberType" value="team">
								<label for="demo-radio-4">팀별일정</label> <input id="demo-radio-5"
									class="magic-radio" type="radio" name="memberType"
									value="personal"> <label for="demo-radio-5">개인일정</label>
							</div>
							 <div id="check">
					                    
					         </div>
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">공유</h3>
						</div>
						<div class="panel-body">
							<!--===================================================-->
							<select id="schedule-tag" class="tag_muti" data-placeholder="Choose a User…" multiple tabindex="4">
									
							</select>
							<!--===================================================-->
						</div>
						<div class="panel-body">
							<button class="btn btn-primary pull-right" id="schedule-register">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--===================================================-->
	<!--End Large Bootstrap Modal-->
	
	<!--schedule-info-modal-->
	<!--===================================================-->
	<div id="schedule-info-modal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-info-title" id="myLargeModalLabel">일정 상세 정보</h4>
				</div>
				<div class="modal-body">
					<div class="panel">
						<!-- Striped Table -->
						<!--===================================================-->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>항목</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a class="btn-link">일정이름</a></td>
											<td><span id="schedule-info-title"></span></td>
										</tr>
										<tr>
											<td><a class="btn-link">카테고리</a></td>
											<td><span id="schedule-info-category"></span></td>
										</tr>
										<tr></tr>
										<tr class="function-per-category"></tr>
										<tr>
											<td><a class="btn-link">태그된 사람</a></td>
											<td>
												<ul class="list-inline mar-hor col-center"
													id="schedule-info-tag">
													<li class="tag tag-xs"><a href="#"><i class="demo-pli-tag" data-range="channel"></i>channel</a></li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- <div class="form-group" id="panel-body">
									<button class="btn btn-danger col-sm-2" id="schedule-delete">삭제</button>
									<button class="btn btn-primary col-sm-2" id="schedule-modify">수정</button>
								</div> -->
						<div class="form-group text-right" style="padding-left: 20px;" id="panel-body">
							<!--Save draft button-->
							<button id="schedule-delete" type="button" class="btn btn-default">
								<i class="-unread icon-lg icon-fw"></i> 삭제
							</button>

							<!--Discard button-->
							<button id="schedule-modify-form" type="submit" class="btn btn-primary"  data-target="#schedule-modify-modal" data-toggle="modal">
								<i class="icon-lg icon-fw"></i> 수정
							</button>
						</div>
						<!--===================================================-->
						<!-- End Striped Table -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--===================================================-->
	<!--End Large Bootstrap Modal-->
    
    
    <!--schedule-modify-modal-->
	<!--===================================================-->
	<div id="schedule-modify-modal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title" id="myLargeModalLabel">일정 수정</h4>
				</div>
				<div class="modal-body">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">일정 이름</h3>
						</div>
						<div class="panel-body">
							<input id="schedule-modify-title" type="text" class="form-control" placeholder="Title">
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">기간</h3>
						</div>
						<div class="panel-body">
							<div id="dp-range">
								<div class="input-daterange input-group" id="datepicker"
									style="width: 407px;">
									<input type="text" class="form-control" id="schedule-modify-start"
										name="start" /> <span class="input-group-addon">to</span> <input
										type="text" class="form-control" id="schedule-modify-end" name="end" />
								</div>
							</div>
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">메모</h3>
						</div>
						<div class="panel-body">
							<input id="schedule-modify-memo" type="text" class="form-control"
								placeholder="memo">
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">카테고리</h3>
						</div>
						<div class="panel-body">
							<div class="radio" id="schedule-modify-category">
								<input id="demo-radio-1" class="magic-radio" type="radio"
									name="memberType" value="notice"> <label
									for="demo-radio-1">공지사항</label> <input id="demo-radio-2"
									class="magic-radio" type="radio" name="memberType"
									value="assignment"> <label for="demo-radio-2">과제</label>
								<input id="demo-radio-3" class="magic-radio" type="radio"
									name="memberType" value="course"> <label
									for="demo-radio-3">코스일정</label> <input id="demo-radio-4"
									class="magic-radio" type="radio" name="memberType" value="team">
								<label for="demo-radio-4">팀별일정</label> <input id="demo-radio-5"
									class="magic-radio" type="radio" name="memberType"
									value="personal"> <label for="demo-radio-5">개인일정</label>
							</div>
							 <div id="check">
					                    
					         </div>
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">공유</h3>
						</div>
						<div class="panel-body">
							<!--===================================================-->
							<select id="schedule-modify-tag" class="tag_muti" data-placeholder="Choose a User…" multiple tabindex="4">
									
							</select>
							<!--===================================================-->
						</div>
						<div class="panel-body">
							<button class="btn btn-primary pull-right" id="schedule-modify">변경</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--===================================================-->
	

    
    
    
    <!--JAVASCRIPT-->
    <!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

	<!--jQuery-UI [ REQUIRED] -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery-ui/jquery-ui.css"></script> --%>
	 <script type="text/javascript" src="${pageContext.request.contextPath }/assets/jquery-ui/jquery-ui.js"></script>

	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>


    <!--=================================================-->
   <%--  
    <!--Demo script [ DEMONSTRATION ]-->
    <script src="${pageContext.request.contextPath }/assets/js/demo/nifty-demo.js"></script>
 
  --%>   
  	<!--Full Calendar [ OPTIONAL ]-->
    <script src="${pageContext.request.contextPath }/assets/plugins/fullcalendar/lib/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/plugins/fullcalendar/lib/jquery-ui.custom.min.js"></script>
	<%-- 
	<script src="${pageContext.request.contextPath }/demo/plugins/fullcalendar/fullcalendar.min.js"></script>
  	--%>
  	<script src="${pageContext.request.contextPath }/assets/plugins/fullcalendar/fullcalendar.js"></script>
	
	<!-- Chosen [ OPTIONAL ] -->
	<script src="${pageContext.request.contextPath }/assets/plugins/chosen/chosen.jquery.js"></script>
	
	<!--Bootstrap Datepicker [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
	
	<script type="text/javascript">

		/*=================================================== append schedule event =================================================== */
		
		//스케줄 데이타 배열
		var scheduleArray =[];
		
		$("document").ready(function(){
			console.log("ready()");
			loadSchedule();
		
			// CHOSEN
			$('#demo-chosen-select').chosen();
			$('#demo-cs-multiselect').chosen({width : '100%'});
			
			var	tagList2 = "";
			$.ajax({
				url : "${pageContext.request.contextPath }/${coursePath}/schedule/searchUser",
				type : "post",
				dataType : "json",
				success : function(list) {
					var no = list[0].userNo;
					
					for (var i = 0; i < list.length; i++) {
						
						tagList2 += "<option value="+list[i].userNo+">"+list[i].userName+"</option>";
						
					}
					//console.log(tagList2);
					$("#schedule-tag").html(tagList2);
					$("#schedule-tag").chosen({width : '100%'});
					
					
					tagList2 = "";
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		//load today schedule
		$("document").ready(function(){
			var today = $(".fc-today").data("date");
			console.log("today: " + today);
			
			$.ajax({
				url : "${pageContext.request.contextPath }/${coursePath}/schedule/today?today="+today,
				type : "post",
				dataType : "json",
				success : function(result) {
					$("#today-schedule").empty();
					for(var i=0; i<result.length; i++){
						console.log(result[i])
						render_scheudule(result[i], "today-schedule");
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		})
		
		$("#page-content").on("click", ".fc-day-grid-event", function(){
			console.log("-------------------------이벤트 상세 정보-------------------------");
			
			var scheduledto = { 
					scheduleNo: $(this).find($(".fc-title")).data("no") 
			};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/selected",
				type: "post",
				contentType : "application/json",
				data : JSON.stringify(scheduledto),

				dataType : "json",
				success : function(result) {
					var temp = $.trim(result.category);
					
					if(temp == "과제"){
						assignment();	
						$("#schedule-info-assign-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-assign-content").text(result.content);
						$("#schedule-info-assign-courseName").text(result.courseName);
						$("#schedule-info-assign-subjectName").text(result.subjectTitle);
						$("#schedule-info-assign-chapterName").text(result.chapterContent);
						$("#schedule-info-assign-teacherName").text(result.teacherName);
						$("#schedule-info-tag").empty();
						tag("channel");
					}else if(temp == "공지사항"){
						notice();
						$("#schedule-info-notice-content").html(result.content);
						if(result.typeCategory == "긴급"){
							$("#schedule-info-notice-category").text(result.typeCategory).css('background-color', '#FAA732');
						}else{
							$("#schedule-info-notice-category").text(result.typeCategory)
						}
						$("#schedule-info-notice-hit").text(result.hit);
						$("#schedule-info-notice-courseName").text(result.courseName);
						$("#schedule-info-notice-writer").text(result.writer);
						$("#schedule-info-notice-regDate").text(result.regDate);
						$("#schedule-info-tag").empty();
						tag("channel")
					}else if(temp == "코스 일정"){
						course();
						$("#schedule-info-course-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-course-content").text(result.content);
						$("#schedule-info-course-courseName").text(result.courseName);
						$("#schedule-info-course-roomNo").text(result.roomNo);
						$("#schedule-info-course-teacher").text(result.teacherName);
						$("#schedule-info-course-link").text(result.coursePath);
						$("#schedule-info-tag").empty();
						tag("channel")
					}else if(temp =="팀별 일정"){
						team();
						console.log(result.writerNo)
						$("#schedule-info-team-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-team-content").text(result.content);
						$("#schedule-info-team-courseName").text(result.courseName);
						$("#schedule-info-team-writer").text(result.writer);
						$("#schedule-info-team-writer").data("writerNo", result.writerNo);
						$("#schedule-info-title").data("scheduleNo", result.scheduleNo);
						$("#schedule-info-course-link").text(result.coursePath);
						$("#schedule-info-tag").empty();
					}else{
						personal();
						$("#schedule-info-personal-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-personal-content").text(result.content);
						$("#schedule-info-personal-courseName").text(result.courseName);
						$("#schedule-info-personal-writer").text(result.writer);
						$("#schedule-info-personal-writer").data("writerNo", result.writerNo);
						$("#schedule-info-title").data("scheduleNo", result.scheduleNo);
						$("#schedule-info-personal-link").text(result.coursePath);
						$("#schedule-info-tag").empty();
					}
					
					$("#schedule-info-title").text(result.title);
					$("#schedule-info-category").text(result.category);
					
					var tagList = load_tag(scheduledto.scheduleNo);
					//$("#schedule-info-tag").empty();
						
					for(var i=0; i<tagList.length; i++){
							tag(tagList[i])
					}
				},
				error : function(XHR, status, error) {		
					console.error(status + " : " + error);
				}
			})
		});
	
		// click date for registration(schedule)
		$("#page-content").on("click", ".fc-day-number", function(){
			var date = $(this).data("date");
			console.log(date);
			$(".modal-title").text("일정 등록");
			$("#schedule-start").val(date);
			$("#schedule-end").val(date);
		});
		
		// search schedule
		$("#schedule_search_btn").on("click", function(){
			var scheduleName = $("#schedule_title").val();
			console.log(scheduleName);
			
			var scheduledto = {
					scheduleName: scheduleName
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/searchSchedule",
				type: "post",
				contentType : "application/json",
				data : JSON.stringify(scheduledto),

				dataType : "json",
				success : function(result) {
					$("#demo-external-events").empty();
					for(var i=0; i<result.length; i++){
						console.log(result[i])
						render_scheudule(result[i],"demo-external-events");
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			})
		});
		
		// date picker - schedule register modal
		$('#dp-range .input-daterange').datepicker({
	        format: "yyyy-mm-dd",
	        todayBtn: "linked",
	        autoclose: true,
	        todayHighlight: true
	    });
		
		
		// register new schedule
		$("#schedule-register").on("click",function(){
			console.log("-------------------------등록-------------------------");
			
			var multiParam = Array();
			
			var tagList = [];
			tagList = $("#schedule-tag").val();
			if($.inArray("${authUser.userNo}",tagList) == -1 ){
				tagList.push(${authUser.userNo});
			}
			
			var scheduledto = {
				scheduleName: $("#schedule-title").val(),
				startDate: $("#schedule-start").val(),
				endDate: $("#schedule-end").val(),
				scheduleMemo: $("#schedule-memo").val(),
				eventColor: $("input:radio[name=memberType]:checked").val(),
			};	
			
			multiParam.push(tagList);
			multiParam.push(scheduledto);
			console.log(multiParam)

			if(scheduledto.scheduleName != "" && scheduledto.startDate != "" && scheduledto.endDate != "" && scheduledto.eventColor){
				var temp = $.trim(scheduledto.eventColor);
				if(temp == "course" || temp == "assignment" || temp == "notice"){
	    			$("#check").text("해당 카테고리는 여기서 등록할 수 없습니다.");
					$("#check").css("color", "red");
				}else{
					$.ajax({
						url : "${pageContext.request.contextPath}/${coursePath}/schedule/register",
						type: "post",
						contentType : "application/json",
						data : JSON.stringify(multiParam),
	
						dataType : "json",
						success : function(scheduledto) {
							console.log('등록');
							reflashSchedule();
							$("#schedule-modal").modal("hide");
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					})
				}
			}
			
			if(tagList == null){
				console.log("태그 없음");
			}else{
				console.log("태그 있음");
				send_mail();
			}
		});
		
		
		// rendering-modify-scheduleForm
		$("#schedule-modify-form").on("click", function(){
			console.log("-------------------------수정 폼 로드-------------------------");
			
			var category = $.trim($("#schedule-info-category").text());
			var authUserNo = ${authUser.userNo};
			
			if(category == "팀별 일정"){
				var writerNo = $("#schedule-info-team-writer").data("writerNo");
				if(authUserNo == writerNo){
					console.log("팀별 일정, 수정 권한 있음");
					//hide modify-modal
					$("#schedule-info-modal").modal("hide");
					//show schedule-modal and set value with selected schedule
					render_modify(team);
					
					$("#schedule-modal").modal("show");
				}else{
					callNoty('warning', 'pli-exclamation', 'center-center', 0, '알림', '해당 글 작성자만 게시글을 수정할 수 있습니다..', 'zoomIn', 'fadeOut', 'btnx');
				}
			}else{
				var writerNo = $("#schedule-info-personal-writer").data("writerNo");
				if(authUserNo == writerNo){
					console.log("개인 일정, 수정 권한 있음")
					
					$("#schedule-info-modal").modal("hide");
					render_modify(personal);
					
					$("#schedule-modal").modal("show");
				}else{
					callNoty('warning', 'pli-exclamation', 'center-center', 0, '알림', '해당 글 작성자만 게시글을 수정할 수 있습니다..', 'zoomIn', 'fadeOut', 'btnx');
				}
			}
			
		});
		
		// modify schedule
		$("#schedule-modify").on("click", function(){
			console.log("-------------------------수정-------------------------");
			
			var multiParam = Array();
			
			var tagList = [];
			tagList = $("#schedule-tag").val();
			if($.inArray("${authUser.userNo}",tagList) == -1 ){
				tagList.push(${authUser.userNo});
			}
			
			var scheduledto = {
				scheduleNo: $("#schedule-modify-title").data("scheduleNo"),
				scheduleName: $("#schedule-modify-title").val(),
				startDate: $("#schedule-modify-start").val(),
				endDate: $("#schedule-modify-end").val(),
				scheduleMemo: $("#schedule-modify-memo").val(),
				eventColor: $("input:radio[name=memberType]:checked").val(),
			};	
			
			multiParam.push(tagList);
			multiParam.push(scheduledto);
			console.log(multiParam);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/modify",
				type: "post",
				contentType : "application/json",
				data : JSON.stringify(multiParam),

				dataType : "json",
				success : function(scheduledto) {
					console.log('변경 완료');
					reflashSchedule();
					$("#schedule-modal").modal("hide");
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		// delete schedule
		$("#schedule-delete").on("click", function(){
			console.log("-------------------------삭제-------------------------");
			
			var category = $.trim($("#schedule-info-category").text());
			var authUserNo = ${authUser.userNo};
			
			if(category == "팀별 일정"){
				var writerNo = $("#schedule-info-team-writer").data("writerNo");
				if(authUserNo == writerNo){
					console.log("팀별 일정, 삭제 권한 있음");
					var scheduleNo = $("#schedule-info-title").data("scheduleNo");
					
					ajax_delete(scheduleNo);
				}else{
					callNoty('warning', 'pli-exclamation', 'center-center', 0, '알림', '해당 글 작성자만 게시글을 삭제할 수 있습니다..', 'zoomIn', 'fadeOut', 'btnx');
				}
			}else{
				var writerNo = $("#schedule-info-personal-writer").data("writerNo");
				if(authUserNo == writerNo){
					console.log("개인 일정, 삭제 권한 있음")
					var scheduleNo = $("#schedule-info-title").data("scheduleNo");
					
					ajax_delete(scheduleNo);
					$("#schedule-info-modal").modal("hide");
				}else{
					callNoty('warning', 'pli-exclamation', 'center-center', 0, '알림', '해당 글 작성자만 게시글을 삭제할 수 있습니다..', 'zoomIn', 'fadeOut', 'btnx');
				}
			}
		});
		
		
		// inform-console-modal
		$("#container").on("click", "#btnx", function(){
			console.log("-------------------------리다이렉션 버튼-------------------------");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/load",
				type: "post",
				contentType : "application/json",

				dataType : "json",
				success : function(result) {
					console.log("로딩 완료...")
					var scheduleArray = [];
			    	scheduleArray = load_scheduleList();
			    	console.log(scheduleArray);
					external_event();
					append_schedule(scheduleArray);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			})
		});
	
		
		
		/*============================================================ ajax function ============================================================ */
		
		//load schedule
		function loadSchedule() {
			console.log("load_scheduleList");
			
			$.ajax({
				url : "/ams/${coursePath}/schedule/load",
				async: false, // ajax 결과 값을 반환시켜 변수에 담기 위해 작성한 코드
				type: "post",
				contentType : "application/json",

				dataType : "json",	
				success : function(schedule) {
					for(var i=0; i<schedule.length; i++){
				    	scheduleArray.push({
				    		no: schedule[i].scheduleNo,
				    		title: schedule[i].scheduleName,
				    		start: schedule[i].startDate,
				    		end: schedule[i].endDate,
				    		className: schedule[i].eventColor
				    	});
				    }
					
					console.log(scheduleArray);
					external_event()
					$('#demo-calendar').fullCalendar({
						header: {
				   	    	left: 'prev,next today',
				   	        center: 'title',
				   	        right: 'month,agendaWeek,agendaDay'
				    	},
				       	editable: false,
				       	droppable: false, // this allows things to be dropped onto the calendar
				       	defaultDate: '2019-06-01',
				       	eventLimit: true, // allow "more" link when too many events
				       	events: scheduleArray 
				    });
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		   
		}
		
		//Reflash Schedule
		function reflashSchedule() {
			scheduleArray =[];
			loadSchedule();
			$("#demo-calendar").fullCalendar('removeEvents'); 
		    $("#demo-calendar").fullCalendar('addEventSource', scheduleArray);
		}
		
		function external_event(){
			 $('#demo-external-events .fc-event').each(function() {
			        // store data so the calendar knows to render an event upon drop
		      	  $(this).data('event', {
		       	     title: $.trim($(this).text()), // use the element's text as the event title
		       	     stick: true, // maintain when user navigates (see docs on the renderEvent method)
		       	     className : $(this).data('class')
			        });
		
			        // make the event draggable using jQuery UI
		   	      $(this).draggable({
		   	          zIndex: 99999,
		   	          revert: true,      // will cause the event to go back to its
		   	          revertDuration: 0  //  original position after the drag
		   	        });
		   	   });
		}
		
		//load scheduleTag
		function load_tag(scheduleNo){
			var resultList;
			
			var scheduledto = {
					scheduleNo : scheduleNo
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/loadTag",
				async: false,
				type: "post",
				contentType : "application/json",
				data : JSON.stringify(scheduledto),

				dataType : "json",
				success : function(result) {
					resultList = result;
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			})
			
			return resultList;
		}
		
		//ajax 삭제
		function ajax_delete(scheduleNo){ 
			var scheduledto = {
					scheduleNo : scheduleNo
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/delete",
				type: "post",
				contentType : "application/json",
				data : JSON.stringify(scheduledto),

				dataType : "json",
				success : function(result) {
					reflashSchedule();
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			})
		}
		
		//send mail
		function send_mail(){
			$.ajax({
				url : "${pageContext.request.contextPath}/${coursePath}/schedule/alarm",
				type: "post",
				contentType : "application/json",

				dataType : "json",
				success : function(result) {
					if(result == 1)
						console.log("메일 전송 완료");
					else 
						console.log("메일 전송 실패");
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			})
		}
	
		
		/*=================================================== rendering html form =================================================== */
		
		
		function parsing_duration(duration){
			var result = duration.split(' ~ ');
			
			return result;
		};
		
		function render_modify(category){
			//show schedule-modal and set value with selected schedule
			$("#schedule-modify-title").val($("#schedule-info-title").text());
			$("#schedule-modify-title").data("scheduleNo", $("#schedule-info-title").data("scheduleNo"));
			
			if(category == team){
				var duration = ($("#schedule-info-team-duration").text()).split(' ~ ');
				$("#schedule-modify-start").val(duration[0]);
				$("#schedule-modify-end").val(duration[1]);
				$("#schedule-modify-memo").val($("#schedule-info-team-content").text());
				$("input:radio[name='memberType']:radio[value='team']").attr("checked",true);
			}else{
				var duration = ($("#schedule-info-personal-duration").text()).split(' ~ ');
				$("#schedule-modify-start").val(duration[0]);
				$("#schedule-modify-end").val(duration[1]);
				$("#schedule-modify-memo").val($("#schedule-info-personal-content").text());
				$("input:radio[name='memberType']:radio[value='personal']").attr("checked",true);
			}
			
		}
		
		// searchedScheudle rendering
		function render_scheudule(scheduledto, id){
			var str = "";
			str += "<div id='user-define' class='fc-event fc-list' data-class='"+scheduledto.eventColor+"'>"+ scheduledto.scheduleName +"</div>"
			
			$("#" + id).append(str);			
		}
		
		function tag(userName){
			
			str = '';
			str += '<li class="tag tag-xs">'
			str += '	<a href="#"><i class="demo-pli-tag" id="tagUser">'+ userName +'</i></a>'
			str += '</li>'
			
			$("#schedule-info-tag").append(str);	
		}
		
		function notice(){
			$(".column-target").remove();
			
			str = '';
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">내용</a></td>'
			str += '	<td><span id="schedule-info-notice-content"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">중요도</a></td>'
			str += '	<td><span id="schedule-info-notice-category"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">조회수</a></td>'
			str += '	<td><span id="schedule-info-notice-hit"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스명</a></td>'
			str += '	<td><span id="schedule-info-notice-courseName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">작성자</a></td>'
			str += '	<td><span id="schedule-info-notice-writer"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">작성 일자</a></td>'
			str += '	<td><span id="schedule-info-notice-regDate"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">바로가기</a></td>'
			str += '	<td><span id="schedule-info-notice-link"></span></td>'
			str += '</tr>'
		
			$(".function-per-category").after(str);
		};
		
		function assignment(){
			$(".column-target").remove();
			
			str = '';
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">기간</a></td>'
			str += '	<td><span id="schedule-info-assign-duration"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">내용</a></td>'
			str += '	<td><span id="schedule-info-assign-content"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스명</a></td>'
			str += '	<td><span id="schedule-info-assign-courseName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">과목명</a></td>'
			str += '	<td><span id="schedule-info-assign-subjectName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">챕터명</a></td>'
			str += '	<td><span id="schedule-info-assign-chapterName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">출제자</a></td>'
			str += '	<td><span id="schedule-info-assign-teacherName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스 바로가기</a></td>'
			str += '	<td><span id="schedule-info-assign-link">link</span></td>'
			str += '</tr>'
			
			$(".function-per-category").after(str);
		
		};
		
		function course(){
			$(".column-target").remove();
			
			str = '';
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">기간</a></td>'
			str += '	<td><span id="schedule-info-course-duration"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">내용</a></td>'
			str += '	<td><span id="schedule-info-course-content"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스명</a></td>'
			str += '	<td><span id="schedule-info-course-courseName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스 강의실</a></td>'
			str += '	<td><span id="schedule-info-course-roomNo"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">지도 교사</a></td>'
			str += '	<td><span id="schedule-info-course-teacher"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스 바로가기</a></td>'
			str += '	<td><span id="schedule-info-course-link">link</span></td>'
			str += '</tr>'
			
			$(".function-per-category").after(str);
		};
		
		function team(){
			$(".column-target").remove();
			
			str = '';
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">기간</a></td>'
			str += '	<td><span id="schedule-info-team-duration"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">내용</a></td>'
			str += '	<td><span id="schedule-info-team-content"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스명</a></td>'
			str += '	<td><span id="schedule-info-team-courseName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">작성자</a></td>'
			str += '	<td><span id="schedule-info-team-writer"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스 바로가기</a></td>'
			str += '	<td><span id="schedule-info-team-link">link</span></td>'
			str += '</tr>'
			
			$(".function-per-category").after(str);
			
		};
		
		function personal(){
			$(".column-target").remove();
			
			str = '';
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">기간</a></td>'
			str += '	<td><span id="schedule-info-personal-duration"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">내용</a></td>'
			str += '	<td><span id="schedule-info-personal-content"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스명</a></td>'
			str += '	<td><span id="schedule-info-personal-courseName"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">작성자</a></td>'
			str += '	<td><span id="schedule-info-personal-writer"></span></td>'
			str += '</tr>'
			str += '<tr class="column-target">';
			str += '	<td><a class="btn-link">코스 바로가기</a></td>'
			str += '	<td><span id="schedule-info-personal-link">link</span></td>'
			str += '</tr>'
			
			$(".function-per-category").after(str);
		};
		
		function callNoty(color, icon, position, time, title, message, animationIn, animationOut, btnId){
			var notyContent = "";
			
			notyContent += "<button class='close' type='button' id='" + btnId + "'><i class='pci-cross pci-circle'></i></button>";
			notyContent += "<div class='media-left'>";
			notyContent += "	<span class='icon-wrap icon-wrap-xs icon-circle alert-icon'>";
			notyContent += "		<i class='" + icon + " icon-2x'></i>";
			notyContent += "	</span>";
			notyContent += "</div>";
			notyContent += "<div class='media-body'>";
			notyContent += "	<h4 class='alert-title'>" + title + "</h4>";
			notyContent += "	<p class='alert-message'>" + message + "</p>";
			notyContent += "</div>";
			
			$.niftyNoty({
				type : color,
				container : 'floating',
				floating    : {
	                position    : position,
	                animationIn : animationIn,
	                animationOut: animationOut
	            },
	            html : notyContent,
				timer : time
			});
		};
		
	</script> 
	
	<script type="text/javascript">
		/* @tag autocomplete
		$("document").ready(function(){
			$("#temp").chosen({width : '100%'});
			$("#temp").autocomplete({
			//autocomplete: 자동완성 기능 
			//source: 타이핑 시 보여질 내용 
			//select:fuction(event, ui){}: 아이템 선택 싯 실행, ui.item이 선택된 항목을 나타내는 객체
			//focus: function(event, ui){ return false;} : jQuery UI autocomplete를 한글과 사용할때 커서를 사용해서 아이템을 선택하면 나머지가 사라져 버리는 버그가 있다. 
			//												이 코드를 추가하면 해결된다. return false; 또는 event.preventDefault(); 를 사용해서 이벤트를 무시하게 하는 것이다.
			source : function(request, response){
				var text = {value: request.term};
			 	var param = parsing(text);
				console.log("parameter: " + param); 
			    if(param != null){
					$.ajax({
						url : "${pageContext.request.contextPath}/schedule/search",
						type : "post",
						data : {value: param}, 
						//contentType : "application/json",
						//data : JSON.stringify(param),
						
						// 값을 돌려받을 때
						dataType: "json",
						success: function(data){
							response(
								$.map(data, function(item){
									var info = item.userName + "(" + item.email +")";
									return {
										label: info,
										value: info										}
								})
							); 
						}
					});
				}else{
					console.log("no tag");
				}
			},
			minLength: 1,
			select: function(event,ui){},
			focus: function(event,ui){
				event.preventDefault();
			}
		});
	});
	
	$("#schedule-modal").on("shown.bs.modal", function() {
		$("#schedule-tag").autocomplete("option", "appendTo", "#schedule-modal")
	}); 
	
	
	function parsing(text){
		var content = text.value;
		var tag = "@"
		var result;
		if(content.indexOf(tag) != -1){
			result = content.substring(content.indexOf(tag)+1);
			return result;
		}
		else{ 
			return null;
		}
	}
	
	*/
	</script>
</body>
</html>



