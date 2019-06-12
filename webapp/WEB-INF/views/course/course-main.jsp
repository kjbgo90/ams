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
								
								<input type="hidden" id="authUserSeatNo" value="">
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
									<button class="btn btn-pink btn-labeled btn-rounded icon-lg ion-locked" id="btnPink">나만질문</button>
									<br> <br>
									<button class="btn btn-dark btn-labeled btn-rounded icon-lg fa fa-quora" id="btnDark">공개질문</button>
									<br> <br>
									<button class="btn btn-danger btn-labeled btn-rounded icon-lg fa fa-venus-mars" id="btnDanger">화장실좀</button>
									<br> <br>
									<button class="btn btn-mint btn-labeled btn-rounded icon-lg ion-ios-color-wand" id="btnMint">와주세요</button>
									<br> <br>
									<button class="btn btn-purple btn-labeled btn-rounded icon-lg ion-ios-timer-outline" id="btnPurple">휴식시간</button>
									<br> <br>
									<button class="btn btn-primary btn-labeled btn-rounded icon-lg ion-no-smoking" id="btnPrimary">담배타임</button>
									<br> <br>
									<button class="btn btn-info btn-labeled btn-rounded icon-lg ion-coffee" id="btnInfo">커피사옴</button>
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
							<img alt="Profile Picture" class="img-md img-circle mar-btm" id="profileImg" src="${pageContext.request.contextPath }/assets/img/profile-photos/1.png">
							<p class="text-lg text-semibold mar-no text-main" id="profileName">김선생</p>
							<p class="text-muted" id="profileUserType">강사</p>
							<p class="text-sm text-left">
								<i class="pli-email icon-fw"></i>
								<span id="profileEmail">aabbcc123@gmail.com</span>
							</p>
							<p class="text-sm text-left">
								<i class="pli-phone icon-fw"></i>
								<span id="profilePhone">010-1234-5678</span>
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
								<li class="col-xs-4"><span class="text-lg text-semibold text-main" id="profilePostCnt">278</span>
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
		let sock = new SockJS("${pageContext.request.contextPath }/echo/");
		var authUserNo = '${authUser.userNo}';
		
		webSock = sock;

		webSock.onmessage = onMessage;
		webSock.onclose = onClose;
		
		/* 코스패스로 코스 정보를 가져와서 해당 코스의 배치도를 그리는 ajax */
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/main/loadpage",		
			type : "post",
			success : function(map){
				console.log(map.teacherUserVo);
				userRender(map.teacherUserVo, 'Teacher', authUserNo);
				
				for(var i = 0; i < map.userList.length; i++){
					if(map.userList[i].seatNo != 0){
						userRender(map.userList[i], map.userList[i].seatNo, authUserNo);
					}
				}				
				
				for(var i = 0; i < map.userList.length; i++){
					if(map.userList[i].userNo == authUserNo){
						$("#authUserSeatNo").val(map.userList[i].seatNo);
						
						if(map.userList[i].seatNo == 0){
							console.log(map.userList[i]);
							callNoty('warning', 'pli-exclamation', 'center-center', 2000, '좌석을 선택해주세요', '빈 좌석 중에서 앉을 좌석을 골라주세요.', 'zoomIn', 'fadeOut', 0);
						}
					}
					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); 
		
	});	

	$("#container").on("click", ".btnx", function() {
		var $this = $(this);
		var seatNo = $this.data("seatno");
		var seatTarget = "#seat" + seatNo;
		
		console.log(seatNo);
		
		msg = {};
		msg.target = "xbtn";
		msg.seatTarget = seatTarget;
		
		webSock.send(JSON.stringify(msg));
	});
	
	/* 빈좌석을 클릭한 경우 처리하는 스크립트 */
	$(lecroom).on("click", ".seatSel", function() {
		var $this = $(this);
		var seatNo = $this.data("seatno");
		
		$("#modal-show-seat-no").empty();
		$("#modal-show-seat-no").html(seatNo + "번 ");
		
		$("#seatNo-decide-select").val("");
		$("#seatNo-decide-select").val(seatNo);
	});
	
	/* 사람이 있는 좌석을 클릭한 경우 해당 user의 정보를 보여주는 스크립트 */
	$(lecroom).on("click", ".seatImg", function() {
		var $this = $(this);
		var userNo = $this.data("userno");
		console.log(userNo);
		
		$.ajax({
			url : "${pageContext.request.contextPath }/${coursePath}/main/userinfo",
			type : "post",
			data : {userNo : userNo},
			dataType : "json",
			success : function(userVo) {
				console.log(userVo);
				var userType;
				
				if(userVo.userType == 1){
					userType = '강사';
				}
				else if(userVo.userType == 2){
					userType = '학생';
				}
				
				$("#profileImg").attr('src', "${pageContext.request.contextPath }" + userVo.logoPath);
				$("#profileName").empty();
				$("#profileName").html(userVo.userName);
				$("#profileUserType").empty();
				$("#profileUserType").html(userType);
				$("#profileEmail").empty();
				$("#profileEmail").html(userVo.email);
				$("#profilePhone").empty();
				$("#profilePhone").html(userVo.phoneNumber);
				$("#profilePostCnt").empty();
				$("#profilePostCnt").html(userVo.postCnt);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	
	$("#btnPink").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "private";
		msg.notyColor = "pink";
		msg.notyIcon = "ion-locked";
		msg.notyTitle = "개인적인 질문";
		msg.notyContent = "${authUser.userName}" + " 학생이 개인적인 질문을 하였습니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	
	$("#btnDark").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "public";
		msg.notyColor = "dark";
		msg.notyIcon = "fa fa-quora";
		msg.notyTitle = "공개적인 질문";
		msg.notyContent = "${authUser.userName}" + " 학생이 공개적인 질문을 하였습니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	
	$("#btnDanger").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "private";
		msg.notyColor = "danger";
		msg.notyIcon = "fa fa-venus-mars";
		msg.notyTitle = "화장실";
		msg.notyContent = "${authUser.userName}" + " 학생이 화장실에 다녀온다고 합니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	
	$("#btnMint").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "public";
		msg.notyColor = "mint";
		msg.notyIcon = "ion-ios-color-wand";
		msg.notyTitle = "와주세요";
		msg.notyContent = "${authUser.userName}" + " 학생이 와서 봐주기를 원합니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	
	$("#btnPurple").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "public";
		msg.notyColor = "purple";
		msg.notyIcon = "ion-ios-timer-outline";
		msg.notyTitle = "휴식시간";
		msg.notyContent = "${authUser.userName}" + " 학생이 휴식시간을 갖기를 원합니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	
	$("#btnPrimary").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "public";
		msg.notyColor = "primary";
		msg.notyIcon = "ion-no-smoking";
		msg.notyTitle = "담배타임";
		msg.notyContent = "${authUser.userName}" + " 학생은 니코틴 충전이 필요합니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	
	$("#btnInfo").on("click", function(){
		msg = {};
		msg.target = "feedbackButton";
		msg.sendUserNo = "${authUser.userNo}";
		msg.sendUserSeatNo = $("#authUserSeatNo").val();
		msg.sendCourse = "${coursePath}";
		msg.msgType = "public";
		msg.notyColor = "info";
		msg.notyIcon = "ion-coffee";
		msg.notyTitle = "커피 사올게요";
		msg.notyContent = "${authUser.userName}" + " 학생은 카페인 충전이 필요합니다.";
		
		webSock.send(JSON.stringify(msg));
	});
	

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var obj = JSON.parse(msg.data);
		console.log(obj);
		var target = obj.target;
		
		/* feedback Button을 눌렀을 경우 일어나는 이벤트 */
		if(target == "feedbackButton"){
			var seatTarget = "#seat" + obj.sendUserSeatNo;
			var bgColor = "bg-" + obj.notyColor;
			
			/* 코스패스가 같은 경우에만 반응이 일어난다 */
			if(obj.sendCourse == "${coursePath}"){
				
				/* 강사계정에만 알람창이 간다 */
				if("${courseVo.teacherNo}" == "${authUser.userNo}"){
					callNoty(obj.notyColor, obj.notyIcon, 'top-right', 0, obj.notyTitle, obj.notyContent, 'zoomIn', 'fadeOut', obj.sendUserSeatNo);
				}
				
				/* msgType이 private인 경우 강사와 보낸사람만 해당 좌석 백그라운드를 바꾼다. */
				if(obj.msgType == "private"){
					if("${courseVo.teacherNo}" == "${authUser.userNo}" || obj.sendUserNo == "${authUser.userNo}"){
						
						$(seatTarget).removeClass("bg-light bg-pink bg-dark bg-danger bg-mint bg-purple bg-primary bg-info");
						$(seatTarget).addClass(bgColor);
					}
				}
				
				/* msgType이 public인 경우 모든 사람들 화면에서 해당 좌석 백그라운드를 바꾼다. */
				else {
					$(seatTarget).removeClass("bg-light bg-pink bg-dark bg-danger bg-mint bg-purple bg-primary bg-info");
					$(seatTarget).addClass(bgColor);
				}
			}
		}
		
		if(target == "xbtn"){
			var seatTarget = obj.seatTarget;
			
			$(seatTarget).removeClass("bg-light bg-pink bg-dark bg-danger bg-mint bg-purple bg-primary bg-info");
			$(seatTarget).addClass("bg-light");
		}
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
	
	
	/* 설정된 값을 이용해서 Nifty 스타일의 alert창을 불러오는 함수 */
	function callNoty(color, icon, position, time, title, message, animationIn, animationOut, seatNo){
		var notyContent = "";
		
		notyContent += "<button class='close btnx' type='button' data-seatno='" + seatNo + "'><i class='pci-cross pci-circle'></i></button>";
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
	
	/* 유저 정보를 이용해서 유저를 강의실 jsp에 그려주는 함수 */
	function userRender(userVo, seat, authUserNo){
		var seatTarget = "#seat" + seat;
		
		$(seatTarget).empty();
		$(seatTarget).attr('data-original-title', userVo.userName);
		if(seat == 'Teacher'){
			$(seatTarget).attr('data-original-title', userVo.userName + " 강사님");
		}
		if(userVo.userNo == authUserNo){
			$(seatTarget).attr('data-original-title', "나");
		}
		
		var str = "<img class='img-circle img-sm btn btn-circle pad-no seatImg' data-target='#profile-modal' data-toggle='modal' data-userno='" + userVo.userNo + "' src='${pageContext.request.contextPath }" + userVo.logoPath + "'>";
		
		$(seatTarget).append(str);
	}
</script>

</html>
