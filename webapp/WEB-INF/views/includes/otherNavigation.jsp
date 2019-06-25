<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                    </div>-->
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
								<img class="img-circle img-md"
									src="${pageContext.request.contextPath }${authUser.logoPath }"
									alt="Profile Picture">
							</div>
							<a href="#profile-nav" class="box-block" data-toggle="collapse"
								aria-expanded="false"> <span
								class="pull-right dropdown-toggle"> <i
									class="dropdown-caret"></i>
							</span>
								<p class="mnp-name">${authUser.userName }</p> <span
								class="mnp-desc">${authUser.email }</span>
							</a>
						</div>
						<div id="profile-nav" class="collapse list-group bg-trans">
							<a href="${pageContext.request.contextPath }/myPage/mainform" class="list-group-item"> <i class="demo-pli-gear icon-lg icon-fw"></i> MyPage
							</a> <a href="${pageContext.request.contextPath }/user/logout" class="list-group-item"> <i class="demo-pli-unlock icon-lg icon-fw"></i> Logout
							</a>
						</div>
					</div>
					
					
					
					
					<ul id="mainnav-menu" class="list-group">
					
									<!--Category name-->
						<li class="list-header"><a href="${pageContext.request.contextPath }/myPage/mainform"><i class="pli-home"></i><span class="menu-title">MyPage</span></a></li>
						<!--Menu list item-->
						<li>
								<a>
										<i class="pli-management"></i>
										<span class="menu-title">Select Class</span>
										<i class="arrow"></i>
								</a>
								<ul id="courseListInNav" class="collapse">
						            <li>강좌가 없습니다.</li>
						        </ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/myPage/mainassignment">
								<i class="pli-notepad"></i>
								<span class="menu-title">
									 과제 관리
								</span>
							</a>
						</li>
						<li><a href="${pageContext.request.contextPath }/myPage/mytimeline"><i class="pli-calendar-4"></i><span class="menu-title"> Timeline</span></a></li>
						<li><a href="${pageContext.request.contextPath }/myPage/editForm"><i class="pli-question"></i><span class="menu-title">개인정보수정</span></a></li>
					
					
					
		

						<!--Menu list item-->

						<li class="list-header"><i class="pli-hello"></i><a href="${pageContext.request.contextPath }/community/mainform"></a>Community</li>
						<li><a href="${pageContext.request.contextPath }/community/selectform?cpostType=1"><i class="pli-soup"></i><span class="menu-title"> 맛집</span></a></li>
						<li><a href="${pageContext.request.contextPath }/community/selectform?cpostType=2"><i class="pli-juice"></i><span class="menu-title"> 카페</span></a></li>
						<li><a href="${pageContext.request.contextPath }/community/selectform?cpostType=3"><i class="pli-pen"></i><span class="menu-title"> 자유게시판</span></a></li>
				



						<!--Menu list-->
						<!--  -->
						<!--  -->
						<!--  -->

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


		var userNo = '${authUser.userNo}'
		console.log(userNo);
		var userType ="${authUser.userType}";

		$.ajax({
			url : "${pageContext.request.contextPath }/index/courselist",
			type : "post",
			data : {
				userNo : userNo,
				userType : userType
			},
			dataType : "json",
			success : function(map) {
				console.log(map.courseList);
				console.log(map.courseList.length);
				
				if(map.courseList.length > 0) {
					var courseListInNavStr = "";
					$("#courseListInNavStr").empty();
					
					for (var i = 0; i < map.courseList.length; i++) {
						courseListInNavStr += "<li><a href='${pageContext.request.contextPath }/" + map.courseList[i].coursePath + "/main'>" + map.courseList[i].courseName + "</a></li>";
					}
						$("#courseListInNav").html(courseListInNavStr);
						courseListInNavStr = "";
				}
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