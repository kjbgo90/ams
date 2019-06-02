<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

<!--MAIN NAVIGATION-->
<!--===================================================-->
<nav id="mainnav-container">
	<div id="mainnav">


		<!--OPTIONAL : ADD YOUR LOGO TO THE NAVIGATION-->
		<!--It will only appear on small screen devices.-->
		
                    <div class="mainnav-brand">
                        <a href="index.jsp" class="brand">
                            <img src="${pageContext.request.contextPath }/assets/img/logo.png" alt="Nifty Logo" class="brand-icon">
                            <span class="brand-text">Nifty</span>
                        </a>
                        <a href="#" class="mainnav-toggle"><i class="pci-cross pci-circle icon-lg"></i></a>
                    </div>
                  



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
								<img class="img-circle img-md" src="${pageContext.request.contextPath }/assets/img/profile-photos/1.png" alt="Profile Picture">
							</div>
							<a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false"> <span class="pull-right dropdown-toggle"> <i class="dropdown-caret"></i>
							</span>
								<p class="mnp-name">Aaron Chavez</p> <span class="mnp-desc">aaron.cha@themeon.net</span>
							</a>
						</div>
						<div id="profile-nav" class="collapse list-group bg-trans">
							<a href="#" class="list-group-item"> <i class="pli-male icon-lg icon-fw"></i> View Profile
							</a> <a href="#" class="list-group-item"> <i class="pli-gear icon-lg icon-fw"></i> Settings
							</a> <a href="#" class="list-group-item"> <i class="pli-information icon-lg icon-fw"></i> Help
							</a> <a href="#" class="list-group-item"> <i class="pli-unlock icon-lg icon-fw"></i> Logout
							</a>
						</div>
					</div>


					<!--Shortcut buttons-->
					<!--================================-->
					<div id="mainnav-shortcut">
						<ul class="list-unstyled shortcut-wrap">
							<li class="col-xs-3" data-content="My Profile"><a class="shortcut-grid" href="#">
									<div class="icon-wrap icon-wrap-sm icon-circle bg-mint">
										<i class="pli-male"></i>
									</div>
							</a></li>
							<li class="col-xs-3" data-content="Messages"><a class="shortcut-grid" href="#">
									<div class="icon-wrap icon-wrap-sm icon-circle bg-warning">
										<i class="pli-speech-bubble-3"></i>
									</div>
							</a></li>
							<li class="col-xs-3" data-content="Activity"><a class="shortcut-grid" href="#">
									<div class="icon-wrap icon-wrap-sm icon-circle bg-success">
										<i class="pli-computer-secure"></i>
									</div>
							</a></li>
							<li class="col-xs-3" data-content="Lock Screen"><a class="shortcut-grid" href="#">
									<div class="icon-wrap icon-wrap-sm icon-circle bg-purple">
										<i class="pli-lock-2"></i>
									</div>
							</a></li>
						</ul>
					</div>
					<!--================================-->
					<!--End shortcut buttons-->


					<ul id="mainnav-menu" class="list-group">

						<!--Category name-->
						<li class="list-header">Link List</li>

						<!--Menu list item-->
						<li class="active-link"><a href="#"> <i class="pli-quill-2"></i> <span class="menu-title">Active state</span>
						</a></li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-mail-love"></i> <span class="menu-title"> <strong>Bolder</strong>
							</span>
						</a></li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-gamepad-2"></i> <span class="menu-title"> With label <span class="label label-success pull-right">New</span>
							</span>
						</a></li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-usb"></i> <span class="menu-title"> With badge <span class="pull-right badge badge-purple">7</span>
							</span>
						</a></li>

						<li class="list-divider"></li>

						<!--Category name-->
						<li class="list-header">Submenus</li>

						<!--Menu list item-->
						<li class="active-sub"><a href="#"> <i class="pli-mouse-3"></i> <span class="menu-title">Active State</span> <i class="arrow"></i>
						</a> <!--Submenu-->
							<ul class="collapse in">
								<li><a href="#">Link</a></li>
								<li class="active-link"><a href="#">Active link</a></li>
								<li><a href="#">Another link</a></li>
								<li><a href="#">Some else here</a></li>
								<li class="list-divider"></li>
								<li><a href="#">Separate link</a></li>

							</ul></li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-hipster-headphones"></i> <span class="menu-title"> <strong>Bolder</strong>
							</span> <i class="arrow"></i>
						</a> <!--Submenu-->
							<ul class="collapse">
								<li><a href="#">Link</a></li>
								<li><a href="#">Another link</a></li>
								<li><a href="#">Some else here</a></li>
								<li class="list-divider"></li>
								<li><a href="#">Separate link</a></li>

							</ul></li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-fuel"></i> <span class="menu-title"> With label <span class="label label-danger pull-right">Hot</span>
							</span>
						</a> <!--Submenu-->
							<ul class="collapse">
								<li><a href="#">Link</a></li>
								<li><a href="#">Another link</a></li>
								<li><a href="#">Some else here</a></li>
								<li class="list-divider"></li>
								<li><a href="#">Separate link</a></li>

							</ul></li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-cursor-click"></i> <span class="menu-title"> With badge <span class="pull-right badge badge-success">3</span>
							</span>
						</a> <!--Submenu-->
							<ul class="collapse">
								<li><a href="#">Link</a></li>
								<li><a href="#">Another link</a></li>
								<li><a href="#">Some else here</a></li>
								<li class="list-divider"></li>
								<li><a href="#">Separate link</a></li>

							</ul></li>

						<li class="list-divider"></li>

						<!--Category name-->
						<li class="list-header">Multi level</li>

						<!--Menu list item-->
						<li><a href="#"> <i class="pli-geo-2-star"></i> <span class="menu-title">Menu Level</span> <i class="arrow"></i></a> 
							<!--Submenu-->
							<ul class="collapse">
								<li><a href="#">Second Level Item</a></li>
								<li><a href="#">Second Level Item</a></li>
								<li><a href="#">Second Level Item</a></li>
								<li class="list-divider"></li>
								<li><a href="#">Third Level<i class="arrow"></i></a> <!--Submenu-->
									<ul class="collapse">
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
									</ul></li>
								<li><a href="#">Third Level<i class="arrow"></i></a> <!--Submenu-->
									<ul class="collapse">
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
										<li class="list-divider"></li>
										<li><a href="#">Third Level Item</a></li>
										<li><a href="#">Third Level Item</a></li>
									</ul></li>
							</ul>
						</li>
						
					</ul>


					<!--Widget-->
					<!--================================-->
					<div class="mainnav-widget">

						<!-- Show the button on collapsed navigation -->
						<div class="show-small">
							<a href="#" data-toggle="menu-widget" data-target="#wg-server"> <i class="pli-monitor-2"></i>
							</a>
						</div>

						<!-- Hide the content on collapsed navigation -->
						<div id="wg-server" class="hide-small mainnav-widget-content">
							<ul class="list-group">
								<li class="list-header pad-no mar-ver">Server Status</li>
								<li class="mar-btm"><span class="label label-primary pull-right">15%</span>
									<p>CPU Usage</p>
									<div class="progress progress-sm">
										<div class="progress-bar progress-bar-primary" style="width: 15%;">
											<span class="sr-only">15%</span>
										</div>
									</div></li>
								<li class="mar-btm"><span class="label label-purple pull-right">75%</span>
									<p>Bandwidth</p>
									<div class="progress progress-sm">
										<div class="progress-bar progress-bar-purple" style="width: 75%;">
											<span class="sr-only">75%</span>
										</div>
									</div></li>
								<li class="pad-ver"><a href="#" class="btn btn-success btn-bock">View Details</a></li>
							</ul>
						</div>
					</div>
					<!--================================-->
					<!--End widget-->

				</div>
			</div>
		</div>
		<!--================================-->
		<!--End menu-->

	</div>
</nav>
<!--===================================================-->
<!--END MAIN NAVIGATION-->