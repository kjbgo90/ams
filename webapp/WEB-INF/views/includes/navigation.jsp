<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

<!DOCTYPE html>
<html>
<!--MAIN NAVIGATION-->
<!--===================================================-->
<nav id="mainnav-container">
	<div id="mainnav">


		<!--OPTIONAL : ADD YOUR LOGO TO THE NAVIGATION-->
		<!--It will only appear on small screen devices.-->
		<!--================================
                    <div class="mainnav-brand">
                        <a href="index.html" class="brand">
                            <img src="img/logo.png" alt="Nifty Logo" class="brand-icon">
                            <span class="brand-text">Nifty</span>
                        </a>
                        <a href="#" class="mainnav-toggle"><i class="pci-cross pci-circle icon-lg"></i></a>
                    </div>
                    -->



		<!--Menu-->
		<!--================================-->
		<div id="mainnav-menu-wrap">
			<div class="nano">
				<div class="nano-content">

					<!--Profile Widget-->
					<!--================================-->
					<div id="mainnav-profile" class="mainnav-profile">
						<div class="profile-wrap text-center">
							<div class="pad-btm">
								<img class="img-circle img-md" src="${pageContext.request.contextPath }${authUser.logoPath }" alt="Profile Picture">
							</div>
							<a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false"> <span class="pull-right dropdown-toggle"> <i class="dropdown-caret"></i>
							</span>
								<p class="mnp-name">${authUser.userName }</p> <span class="mnp-desc">${authUser.email }</span>
							</a>
						</div>
						<div id="profile-nav" class="collapse list-group bg-trans">
							<a href="#" class="list-group-item"> <i class="demo-pli-male icon-lg icon-fw"></i> Profile</a> 
							<a href="#" class="list-group-item"> <i class="demo-pli-gear icon-lg icon-fw"></i> MyPage</a> 
							<a href="${pageContext.request.contextPath }/user/logout" class="list-group-item"> <i class="demo-pli-unlock icon-lg icon-fw"></i> Logout</a>
						</div>
					</div>
					<ul id="mainnav-menu" class="list-group">
						<!--Category name-->
						<li class="list-header" id="courseNaviCourseName"></li>
						
						<!--Menu list-->
						<li><a href="${pageContext.request.contextPath }/${coursePath}/main"> <i class="pli-home"></i><span class="menu-title"> 강의실</span></a></li>
						<li><a href="${pageContext.request.contextPath }/${coursePath}/dataroom/form"> <i class="pli-folder-open"></i><span class="menu-title"> 자료실</span></a></li>
						<li><a href="${pageContext.request.contextPath }/${coursePath}/assignment/list"> <i class="pli-notepad"></i><span class="menu-title"> 과제</span></a></li>
						<li><a href="${pageContext.request.contextPath }/${coursePath}/schedule/form"> <i class="pli-calendar-4"></i><span class="menu-title"> 일정</span></a></li>
						<li><a href="${pageContext.request.contextPath }/${coursePath}/qna/list"> <i class="pli-question"></i><span class="menu-title"> 질의응답</span></a></li>
						<li><a href="${pageContext.request.contextPath }/${coursePath}/notice/list"> <i class="pli-speaker"></i><span class="menu-title"> 공지사항</span></a></li>
						<hr>
						<li><a href="${pageContext.request.contextPath }/community/mainform"> <i class="pli-hello"></i><span class="menu-title">커뮤니티</span></a></li>
						
						<c:if test="${authUser.userType eq 1 }">
							<!--Category name-->
							<li class="list-header">과정 관리</li>
							
							<!--Menu list-->
							<li><a href="${pageContext.request.contextPath }/${coursePath}/management"> <i class="pli-management"></i><span class="menu-title"> 과목관리</span></a></li>
							<li><a href="${pageContext.request.contextPath }/${coursePath}/assignment/enroll"> <i class="pli-speech-bubble-dialog"></i><span class="menu-title"> 과제출제</span></a></li>
							<li><a href="${pageContext.request.contextPath }/${coursePath}/statistic"> <i class="pli-statistic"></i><span class="menu-title"> 통계</span></a></li>
						</c:if>
					</ul>
					
				</div>
			</div>
		</div>
		<!--================================-->
		<!--End menu-->

	</div>
</nav>

<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$.ajax({
		url : "${pageContext.request.contextPath }/${coursePath}/main/loadnav",		
		type : "post",
		success : function(courseVo){
			$("#courseNaviCourseName").html(courseVo.courseName);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	}); 
});	

</script>

</html>
<!--===================================================-->
<!--END MAIN NAVIGATION-->