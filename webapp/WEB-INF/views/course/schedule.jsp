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
					                        <input type="text" id="event_title" placeholder="새로운 이벤트" class="form-control" value="">
					                    </div>
					                    <button class="btn btn-block btn-purple btn-lg" id="event_register_btn">이벤트 등록</button>
					                    
					                    <hr>
					
					                    <!-- Draggable Events -->
					                    <!-- ============================================ -->
					                    <p class="text-muted text-sm text-uppercase">이벤트</p>
					                    <div id="demo-external-events">
					                        <div id="notice" class="fc-event fc-list" data-class="warning">공지사항</div>
					                        <div id="assign" class="fc-event fc-list" data-class="pink">과제</div>
					                        <div id="course" class="fc-event fc-list" data-class="dark">코스 일정</div>
					                        <div id="team" class="fc-event fc-list" data-class="purple">팀별 일정</div>
					                        <div id="person" class="fc-event fc-list" data-class="info">개인 일정</div>
					                    </div>
					                    <hr>
					                    <p class="text-muted text-sm text-uppercase">출석부</p>
					                    <div class="input-group pad-all bord-btm">
					                		<input type="text" placeholder="조회 일자" class="form-control">
					               			<span class="input-group-btn">
					                    		<button class="btn btn-primary add-tooltip" data-original-title="search" type="button"><i class="demo-pli-check icon-lg icon-fw"></i></button>
					                 		</span>
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
						<div id="panel-body">
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
							<div class="panel-heading">
								<h3 class="panel-title"><strong>일정 이름</strong></h3>
							</div>
							<div class="panel-body">
								<span id="schedule-info-title"></span>
							</div>
							<div class="panel-heading">
								<h3 class="panel-title"><strong>카테고리</strong></h3>
							</div>
							<div class="panel-body">
								<span id="schedule-info-category"></span>
							</div>
							<div class="function-per-category"></div>
							<div id="panel-body">
								<span><button class="btn btn-primary pull-right" id="schedule-modify">수정</button></span>
								<span><button class="btn btn-primary pull-right" id="schedule-delete">삭제 </button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->
	<!--End Large Bootstrap Modal-->
    
	

    
    
    
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


		$(document).on('nifty.ready', function() {
			
			// load schedule list
			var schedule;
			$.ajax({
				url : "/ams/${coursePath}/schedule/load",
				async: false, // ajax 결과 값을 반환시켜 변수에 담기 위해 작성한 코드ㄴ
				type: "post",
				contentType : "application/json",

				dataType : "json",	
				success : function(list) {
					schedule = list
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
	    	// Calendar

	   	 	// initialize the external events
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
	    
	    // CHOSEN
			$('#demo-chosen-select').chosen();
			$('#demo-cs-multiselect').chosen({width : '100%'});

	    // Initialize the calendar
		// add event into array
			var scheduleArray = [];
		    for(var i=0; i<schedule.length; i++){
		    	scheduleArray.push({
		    		no: schedule[i].scheduleNo,
		    		title: schedule[i].scheduleName,
		    		start: schedule[i].startDate,
		    		end: schedule[i].endDate,
		    		className: schedule[i].eventColor
		    	});
		    }
	    
	    	$('#demo-calendar').fullCalendar({
		        header: {
	   	         left: 'prev,next today',
	   	         center: 'title',
	   	         right: 'month,agendaWeek,agendaDay'
	    	    },
	       	 editable: true,
	       	 droppable: true, // this allows things to be dropped onto the calendar
	       	 drop: function() {
	       	     // is the "remove after drop" checkbox checked?
	       	     if ($('#drop-remove').is(':checked')) {
	       	         // if so, remove the element from the "Draggable Events" list
	       	         $(this).remove();
	       	     }
	       	 },
	       	 defaultDate: '2019-06-01',
	       	 eventLimit: true, // allow "more" link when too many events
	       	 events: scheduleArray
	        
	    	});
		});

		//////////////////////////////////////////////////////////////////////////////////////////////
		$("document").ready(function(){
			
			tagList2 = "";
			$.ajax({
				url : "${pageContext.request.contextPath }/${coursePath}/schedule/search",
				type : "post",
				dataType : "json",
				success : function(list) {
					var no = list[0].userNo;
					
					for (var i = 0; i < list.length; i++) {
						
						tagList2 += "<option value="+list[i].userNo+">"+list[i].userName+"</option>";
						
					}
					console.log(tagList2)
					$("#schedule-tag").html(tagList2);
					$("#schedule-tag").chosen({width : '100%'});
					
					
					tagList2 = "";
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		});
		
		/* $("page-content").on("click", ".fc-event-container", function(){
			console.log('hi');
		}); */
		
		$(".fc-event-container").on("click", ".fc-day-grid-event",function(){
			console.log("te");
		})
		
		$("#page-content").on("click", ".fc-day-grid-event", function(){
			
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
						$("#schedule-info-assign-techerName").text(result.teacherName);
					}else if(temp == "공지사항"){
						notice();
					}else if(temp == "코스 일정"){
						course();
						$("#schedule-info-course-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-course-content").text(result.content);
						$("#schedule-info-course-courseName").text(result.courseName);
						$("#schedule-info-course-roomNo").text(result.roomNo);
						$("#schedule-info-course-teacher").text(result.teacherName);
						$("#schedule-info-course-link").text(result.coursePath);
					}else if(temp =="팀별 일정"){
						team();
						$("#schedule-info-team-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-team-content").text(result.content);
						$("#schedule-info-team-courseName").text(result.courseName);
						$("#schedule-info-team-writer").text(result.writer);
						$("#schedule-info-course-link").text(result.coursePath);
					}else{
						personal();
						$("#schedule-info-personal-duration").text(result.startDate + " ~ " + result.endDate);
						$("#schedule-info-personal-content").text(result.content);
						$("#schedule-info-personal-courseName").text(result.courseName);
						$("#schedule-info-personal-writer").text(result.writer);
						$("#schedule-info-personal-link").text(result.coursePath);
					}
					
					$("#schedule-info-title").text(result.title);
					$("#schedule-info-category").text(result.category);
				},
				error : function(XHR, status, error) {		
					console.error(status + " : " + error);
				}
			})
		});
	
		$("#page-content").on("click", ".fc-day-number", function(){
			var date = $(this).data("date");
			console.log(date);
			$("#schedule-start").val(date);
			$("#schedule-end").val(date);
		});
		
		// add event category 
		$("#event_register_btn").on("click", function(){
			var new_event = $("#event_title").val();
			console.log(new_event);
			render_Event(new_event);
		});
		
		
		// event category html source
		function render_Event(eventName){
			var str = "";
			str += "<div id='user-define' class='fc-event fc-list' data-class='mint'>"+ eventName +"</div>"
			
			$("#demo-external-events").append(str);			
		}
		
		// add event - schedule calendar modal
		$('#dp-range .input-daterange').datepicker({
	        format: "yyyy-mm-dd",
	        todayBtn: "linked",
	        autoclose: true,
	        todayHighlight: true
	    });
		
		// register new schedule
		$("#schedule-register").on("click",function(){
			var tagList = [];
			tagList = $("#schedule-tag").val();
			var scheduledto = {
				scheduleName: $("#schedule-title").val(),
				startDate: $("#schedule-start").val(),
				endDate: $("#schedule-end").val(),
				scheduleMemo: $("#schedule-memo").val(),
				eventColor: $("input:radio[name=memberType]:checked").val(),
				scheduleTag: tagList
			};
			
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
						data : JSON.stringify(scheduledto),
	
						dataType : "json",
						success : function(scheduledto) {
	
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					})
				}
			}
		});
		
		$("#schedule-modify").on("click", function(){
			console.log("수정");
		})
		
		$("#schedule-delete").on("click", function(){
			console.log("삭제");
		})
	
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
		
		// rendering schedule per category 
		function notice(){
			$(".function-per-category").empty();
			
			str = '';
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>내용</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-notice-content"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>중요도</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-notice-category"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>조회수</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-notice-hit"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-notice-courseName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>작성자</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-notice-userName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>바로가기</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<a href id="schedule-info-assign-link">GO</a>'
			str += '</div>'
			
			$(".function-per-category").append(str);
		}
		
		function assignment(){
			$(".function-per-category").empty();
			
			str = '';
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>기간</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-assign-duration"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>내용</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-assign-content"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-assign-courseName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>과목명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-assign-subjectName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>챕터명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-assign-chapterName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>출제자</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-assign-techerName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>바로가기</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<a href id="schedule-info-assign-link">GO</a>'
			str += '</div>'
			
			$(".function-per-category").append(str);
		}
		
		function course(){
			$(".function-per-category").empty();
			
			str = '';
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>기간</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-course-duration"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>내용</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-course-content"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-course-courseName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스 강의실</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-course-roomNo"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>지도 교사</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-course-teacher"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스 바로가기</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<a href id="schedule-info-course-link"></a>'
			str += '</div>'
			
			$(".function-per-category").append(str);
		}
		
		function team(){
			$(".function-per-category").empty();
			
			str = '';
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>기간</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-team-duration"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>내용</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-team-content"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-team-courseName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>작성자</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-team-writer"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스 바로가기</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<a href id="schedule-info-team-link"></a>'
			str += '</div>'
			
			$(".function-per-category").append(str);
		}
		
		function personal(){
			$(".function-per-category").empty();
			
			str = '';
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>기간</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-personal-duration"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>내용</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-personal-content"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스명</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-personal-courseName"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>작성자</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<span id="schedule-info-personal-writer"></span>'
			str += '</div>'
			str += '<div class="panel-heading">';
			str += '	<h3 class="panel-title"><strong>코스 바로가기</strong></h3>'
			str += '</div>'
			str += '<div class="panel-body">'
			str += '	<a href id="schedule-info-personal-link"></a>'
			str += '</div>'
			
			$(".function-per-category").append(str);
		}
		
	</script> 
	
</body>
</html>
