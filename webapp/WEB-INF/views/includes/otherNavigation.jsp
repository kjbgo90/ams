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
							<a href="#" class="list-group-item"> <i
								class="demo-pli-male icon-lg icon-fw"></i> Profile
							</a> <a href="#" class="list-group-item"> <i
								class="demo-pli-gear icon-lg icon-fw"></i> MyPage
							</a> <a href="${pageContext.request.contextPath }/user/logout"
								class="list-group-item"> <i
								class="demo-pli-unlock icon-lg icon-fw"></i> Logout
							</a>
						</div>
					</div>
					<ul id="mainnav-menu" class="list-group">
						<!--Category name-->
						<li class="list-header"><a>MyPage</a></li>
						<li class="list-divider"></li>
						<!--Menu list item-->
						<li><a>Select Class</a></li>
						<li><a href="">과제 관리</a></li>
						<li><a href="">개인정보 수정</a></li>



						<!--Menu list item-->

						<li class="list-header">Community</li>
						<li class="list-divider"></li>
						<li><a href="">Fixed Navbar</a></li>
						<li><a href="">Fixed Footer</a></li>



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

<script
	src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

</html>
<!--===================================================-->
<!--END MAIN NAVIGATION-->