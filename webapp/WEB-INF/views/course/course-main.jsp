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

<title>Form Validation | Nifty - Admin Template</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--나눔 고딕 Font [ OPTIONAL ] -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/ionicons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/font-awesome.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">

<!--Animate.css [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/animate.css" rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">

<!--=================================================-->


<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>


<!--Bootstrap Validator [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrapValidator.css" rel="stylesheet">


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
						<h1 class="page-header text-overflow">강 의 실</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="pli-home"></i></a></li>
						<li><a href="#">Course</a></li>
						<li class="active">Class</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="row">
						<div class="col-lg-10">
							<div class="panel">
								<div class="panel-heading">
									<br>
									<h3 class="panel-title text-2x">${courseVo.courseName }</h3>
								</div>
								<hr>
								<h3 class="panel-title text-right">R${courseVo.lecRoomNo } 강의실</h3>
								<c:import url="/WEB-INF/views/course/lectureroom/r${courseVo.lecRoomNo }.jsp"></c:import>
								<br> 
								<input type="text" id="message" /> 
								<input type="button" id="sendBtn" value="전송" />

								<div id="data">
								</div>
							</div>
						</div>

						<div class="col-lg-2">
							<div class="panel">
								<div class="panel-heading text-center">
									<h3 class="panel-title">FeedbackButton</h3>
								</div>
								<div class="panel-body text-center">
									<button class="btn btn-pink btn-labeled btn-rounded icon-lg ion-locked">나만질문</button>
									<br> <br>
									<button class="btn btn-dark btn-labeled btn-rounded icon-lg fa fa-users">공개질문</button>
									<br> <br>
									<button class="btn btn-danger btn-labeled btn-rounded icon-lg fa fa-times">화장실좀</button>
									<br> <br>
									<button class="btn btn-mint btn-labeled btn-rounded icon-lg ion-ios-color-wand">와주세요</button>
									<br> <br>
									<button class="btn btn-purple btn-labeled btn-rounded icon-lg ion-ios-timer-outline">휴식시간</button>
									<br> <br>
									<button class="btn btn-primary btn-labeled btn-rounded icon-lg ion-no-smoking">담배타임</button>
									<br> <br>
									<button class="btn btn-info btn-labeled btn-rounded icon-lg ion-leaf">커피사옴</button>
									<br> <br>
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


	<!--Default Bootstrap Modal-->
	<!--===================================================-->
	<div class="modal fade" id="profile-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">개인 프로필</h4>
				</div>
				<!--Modal body-->
				<div class="modal-body container-fluid ">
					<div class="panel">
						<div class="panel-body text-center">
							<img alt="Profile Picture" class="img-md img-circle mar-btm" src="${pageContext.request.contextPath }/assets/img/profile-photos/1.png">
							<p class="text-lg text-semibold mar-no text-main">김선생</p>
							<p class="text-muted">강사</p>
							<p class="text-sm text-left">
								<i class="pli-email icon-fw"></i>aabbcc123@gmail.com
							</p>
							<p class="text-sm text-left">
								<i class="pli-phone icon-fw"></i>010-1234-5678
							</p>
							<button class="btn btn-danger mar-ver">
								<i class="pli-male icon-fw"></i>unFollow
							</button>
							<button class="btn btn-mint">Message</button>
							<ul class="list-unstyled text-center bord-top pad-top mar-no row">
								<li class="col-xs-4"><span class="text-lg text-semibold text-main">1,345</span>
									<p class="text-muted mar-no">Following</p></li>
								<li class="col-xs-4"><span class="text-lg text-semibold text-main">23K</span>
									<p class="text-muted mar-no">Followers</p></li>
								<li class="col-xs-4"><span class="text-lg text-semibold text-main">278</span>
									<p class="text-muted mar-no">Post</p></li>
							</ul>
							<div class="btn-group btn-group-justified pad-top">
								<a href="https://github.com/kjbgo90" target="_blank" class="btn btn-icon bord-no ion-social-github icon-lg add-tooltip" data-original-title="Github" data-container="body"></a> <a href="#"
									class="btn btn-icon bord-no ion-social-facebook icon-lg add-tooltip" data-original-title="Facebook" data-container="body"></a> <a href="#"
									class="btn btn-icon bord-no ion-social-instagram icon-lg add-tooltip" data-original-title="Instagram" data-container="body"></a> <a href="#"
									class="btn btn-icon bord-no ion-social-android icon-lg add-tooltip" data-original-title="Phone-Brand" data-container="body"></a>
							</div>
						</div>
					</div>
				</div>

				<!--Modal footer-->
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="seat-decide-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<form method="post" action="${pageContext.request.contextPath }/${coursePath }/main/seatdecide">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<i class="pci-cross pci-circle"></i>
						</button>
						<h4 class="modal-title">자리 정하기</h4>
					</div>
		
					<div class="modal-body text-center">
						<div class="form-group">
							<label class="control-labe"><span id="modal-show-seat-no"></span>자리에 앉으시겠습니까?</label>
						</div>
						<input type="hidden" name="seatNo" id="seatNo-decide-select">
					</div>
		
					<div class="modal-footer">
						<div class="row">
							<button class="btn btn-default" type="submit">확인</button>
							<button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--===================================================-->
	<!--End Default Bootstrap Modal-->


	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>


	<!--=================================================-->

	<!--Bootstrap Validator [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrapValidator.js"></script>


	<!--Masked Input [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.maskedinput.js"></script>


	<!--Form validation [ SAMPLE ]-->
	<script src="${pageContext.request.contextPath }/assets/js/form-validation.js"></script>

	<!--Bootbox Modals [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootbox.js"></script>

	<!-- sockjs -->
	<script src="${pageContext.request.contextPath }/assets/plugins/sockjs/dist/sockjs.js"></script>

</body>

<script type="text/javascript">
	let webSock;
	var lecroom = "#room" + "${courseVo.lecRoomNo}";

	$(document).ready(function() {
		// 웹소켓을 지정한 url로 연결한다.
		let sock = new SockJS("<c:url value="/echo"/>");
		var authUserNo = '${authUser.userNo}';
		webSock = sock;

		webSock.onmessage = onMessage;
		webSock.onclose = onClose;
		
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/main/loadpage",		
			type : "post",
			success : function(map){
				console.log(map.teacherUserVo);
				userRender(map.teacherUserVo, 'Teacher');
				
				for(var i = 0; i < map.userList.length; i++){
					if(map.userList[i].seatNo != 0){
						userRender(map.userList[i], map.userList[i].seatNo);
					}
				}				
				
				for(var i = 0; i < map.userList.length; i++){
					if(map.userList[i].userNo == authUserNo && map.userList[i].seatNo == 0){
						console.log(map.userList[i]);
						callNoty('warning', 'pli-exclamation', 'center-center', 2000, '좌석을 선택해주세요', '빈 좌석 중에서 앉을 좌석을 골라주세요.', 'zoomIn', 'fadeOut', 'btnx');
					}
					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); 
		
	});	

	$("#container").on("click", "#btnx", function() {
		console.log("x버튼 누름");
	});
	
	$(lecroom).on("click", ".seatSel", function() {
		var $this = $(this);
		var seatNo = $this.data("seatno");
		console.log(seatNo);
		
		$("#modal-show-seat-no").empty();
		$("#modal-show-seat-no").html(seatNo + "번 ");
		
		$("#seatNo-decide-select").val("");
		$("#seatNo-decide-select").val(seatNo);
	});
	
	$("#sendBtn").on("click", function() {
		sendMessage();
		$('#message').val('');
	});

	$("#message").on("keydown", function(key) {
		if (key.keyCode == 13) {
			sendMessage();
			$('#message').val('');
		}
	});

	// 메시지 전송
	function sendMessage() {
		webSock.send($("#message").val());
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#data").append(data + "<br/>");
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
	
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
	}
	
	function userRender(userVo, seat){
		var seatTarget = "#seat" + seat;
		
		$(seatTarget).empty();
		
		var str = "<img class='img-circle img-sm btn btn-circle pad-no seatImg' data-target='#profile-modal' data-toggle='modal' data-userno='" + userVo.userNo + "' src='${pageContext.request.contextPath }" + userVo.logoPath + "'>";
		
		$(seatTarget).append(str);
	}
</script>

</html>
