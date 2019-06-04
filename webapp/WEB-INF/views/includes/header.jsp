<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

<header id="navbar">
	<div id="navbar-container" class="boxed">

		<!--Brand logo & name-->
		<!--================================-->
		<div class="navbar-header">
			<a href="${pageContext.request.contextPath }/course/main" class="navbar-brand text-center"> <img src="${pageContext.request.contextPath }/assets/img/logo.png" alt="Nifty Logo" class="brand-icon"></a>
		</div>
		<!--================================-->
		<!--End brand logo & name-->


		<!--Navbar Dropdown-->
		<!--================================-->
		<div class="navbar-content clearfix">
			<ul class="nav navbar-top-links">

				<!--Navigation toogle button-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<li class="tgl-menu-btn"><a class="mainnav-toggle" href="#"> <i class="pli-list-view icon-lg"></i>
				</a></li>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End Navigation toogle button-->


			</ul>
			<ul class="nav navbar-top-links">


				<!--Mega dropdown-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<li class="mega-dropdown"><a href="#" class="mega-dropdown-toggle"> <i class="pli-layout-grid"></i>
				</a>
					<div class="dropdown-menu mega-dropdown-menu">
						<div class="row">
							<div class="col-sm-4 col-md-3">

								<!--Mega menu list-->
								<ul class="list-unstyled">
									<li class="dropdown-header"><i class="pli-file icon-lg icon-fw"></i> Pages</li>
									<li><a href="#">Profile</a></li>
									<li><a href="#">Search Result</a></li>
									<li><a href="#">FAQ</a></li>
									<li><a href="#">Sreen Lock</a></li>
									<li><a href="#">Maintenance</a></li>
									<li><a href="#">Invoice</a></li>
									<li><a href="#" class="disabled">Disabled</a></li>
								</ul>

							</div>
							<div class="col-sm-4 col-md-3">

								<!--Mega menu list-->
								<ul class="list-unstyled">
									<li class="dropdown-header"><i class="pli-mail icon-lg icon-fw"></i> Mailbox</li>
									<li><a href="#"><span class="pull-right label label-danger">Hot</span>Indox</a></li>
									<li><a href="#">Read Message</a></li>
									<li><a href="#">Compose</a></li>
									<li><a href="#">Template</a></li>
								</ul>
								<p class="pad-top text-main text-sm text-uppercase text-bold">
									<i class="icon-lg pli-calendar-4 icon-fw"></i>News
								</p>
								<p class="pad-top mar-top bord-top text-sm">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis
									dis parturient montes.</p>
							</div>
							<div class="col-sm-4 col-md-3">
								<!--Mega menu list-->
								<ul class="list-unstyled">
									<li><a href="#" class="media mar-btm"> <span class="badge badge-success pull-right">90%</span>
											<div class="media-left">
												<i class="pli-data-settings icon-2x"></i>
											</div>
											<div class="media-body">
												<p class="text-semibold text-main mar-no">Data Backup</p>
												<small class="text-muted">This is the item description</small>
											</div>
									</a></li>
									<li><a href="#" class="media mar-btm">
											<div class="media-left">
												<i class="pli-support icon-2x"></i>
											</div>
											<div class="media-body">
												<p class="text-semibold text-main mar-no">Support</p>
												<small class="text-muted">This is the item description</small>
											</div>
									</a></li>
									<li><a href="#" class="media mar-btm">
											<div class="media-left">
												<i class="pli-computer-secure icon-2x"></i>
											</div>
											<div class="media-body">
												<p class="text-semibold text-main mar-no">Security</p>
												<small class="text-muted">This is the item description</small>
											</div>
									</a></li>
									<li><a href="#" class="media mar-btm">
											<div class="media-left">
												<i class="pli-map-2 icon-2x"></i>
											</div>
											<div class="media-body">
												<p class="text-semibold text-main mar-no">Location</p>
												<small class="text-muted">This is the item description</small>
											</div>
									</a></li>
								</ul>
							</div>
							<div class="col-sm-12 col-md-3">
								<p class="dropdown-header">
									<i class="pli-file-jpg icon-lg icon-fw"></i> Gallery
								</p>
								<div class="row img-gallery">
									<div class="col-xs-4">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/thumbs/img-1.jpg" alt="thumbs">
									</div>
									<div class="col-xs-4">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/thumbs/img-3.jpg" alt="thumbs">
									</div>
									<div class="col-xs-4">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/thumbs/img-2.jpg" alt="thumbs">
									</div>
									<div class="col-xs-4">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/thumbs/img-4.jpg" alt="thumbs">
									</div>
									<div class="col-xs-4">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/thumbs/img-6.jpg" alt="thumbs">
									</div>
									<div class="col-xs-4">
										<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/thumbs/img-5.jpg" alt="thumbs">
									</div>
								</div>
								<a href="#" class="btn btn-block btn-primary">Browse Gallery</a>
							</div>
						</div>
					</div></li>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End mega dropdown-->



				<!--Notification dropdown-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle"> <i class="pli-bell icon-lg"></i> <span class="badge badge-header badge-danger"></span>
				</a> <!--Notification dropdown menu-->
					<div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
						<div class="nano scrollable">
							<div class="nano-content">
								<ul class="head-list">

									<!-- Dropdown list-->
									<li><a href="#">
											<div class="clearfix">
												<p class="pull-left">Progressbar</p>
												<p class="pull-right">70%</p>
											</div>
											<div class="progress progress-sm">
												<div style="width: 70%;" class="progress-bar">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
									</a></li>

									<!-- Dropdown list-->
									<li><a href="#" class="media">
											<div class="media-left">
												<i class="pli-hd icon-2x icon-lg"></i>
											</div>
											<div class="media-body">
												<div class="text-nowrap">With Icon</div>
												<small class="text-muted">15 minutes ago</small>
											</div>
									</a></li>

									<!-- Dropdown list-->
									<li><a href="#" class="media">
											<div class="media-left">
												<i class="pli-power-cable icon-2x icon-lg"></i>
											</div>
											<div class="media-body">
												<div class="text-nowrap">With Icon</div>
												<small class="text-muted">15 minutes ago</small>
											</div>
									</a></li>

									<!-- Dropdown list-->
									<li><a href="#" class="media">
											<div class="media-left">

												<span class="icon-wrap icon-circle bg-primary"> <i class="pli-disk icon-lg icon-lg"></i>
												</span>
											</div>
											<div class="media-body">
												<div class="text-nowrap">Circle Icon</div>
												<small class="text-muted">15 minutes ago</small>
											</div>
									</a></li>

									<!-- Dropdown list-->
									<li><a href="#" class="media"> <span class="badge badge-success pull-right">90%</span>
											<div class="media-left">

												<span class="icon-wrap icon-circle bg-danger"> <i class="pli-mail-open icon-lg icon-lg"></i>
												</span>
											</div>
											<div class="media-body">
												<div class="text-nowrap">Circle icon with badge</div>
												<small class="text-muted">50 minutes ago</small>
											</div>
									</a></li>

									<!-- Dropdown list-->
									<li><a href="#" class="media">
											<div class="media-left">

												<span class="icon-wrap bg-info"> <i class="pli-monitor-3 icon-lg icon-lg"></i>
												</span>
											</div>
											<div class="media-body">
												<div class="text-nowrap">Square icon</div>
												<small class="text-muted">Last Update 8 hours ago</small>
											</div>
									</a></li>

									<!-- Dropdown list-->
									<li><a href="#" class="media"> <span class="label label-danger pull-right">New</span>
											<div class="media-left">

												<span class="icon-wrap bg-purple"> <i class="pli-paintbrush icon-lg icon-lg"></i>
												</span>
											</div>
											<div class="media-body">
												<div class="text-nowrap">Square icon with label</div>
												<small class="text-muted">Last Update 8 hours ago</small>
											</div>
									</a></li>
								</ul>
							</div>
						</div>

						<!--Dropdown footer-->
						<div class="pad-all bord-top">
							<a href="#" class="btn-link text-main box-block"> <i class="pci-chevron chevron-right pull-right"></i>Show All Notifications
							</a>
						</div>
					</div></li>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End notifications dropdown-->



				<!--User dropdown-->
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<li id="dropdown-user" class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle text-right"> <span class="ic-user pull-right"> <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
							<!--You can use an image instead of an icon.--> <!--<img class="img-circle img-user media-object" src="img/profile-photos/1.png" alt="Profile Picture">--> <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
							<i class="pli-male"></i>
					</span> <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--> <!--You can also display a user name in the navbar.--> <!--<div class="username hidden-xs">Aaron Chavez</div>--> <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				</a>


					<div class="dropdown-menu dropdown-menu-sm dropdown-menu-right panel-default">
						<ul class="head-list">
							<li><a href="#"><i class="pli-male icon-lg icon-fw"></i> Profile</a></li>
							<li><a href="#"><span class="badge badge-danger pull-right">9</span><i class="pli-mail icon-lg icon-fw"></i> Messages</a></li>
							<li><a href="#"><span class="label label-success pull-right">New</span><i class="pli-gear icon-lg icon-fw"></i> Settings</a></li>
							<li><a href="#"><i class="pli-computer-secure icon-lg icon-fw"></i> Lock screen</a></li>
							<li><a href="${pageContext.request.contextPath }/user/logout?coursePath=${coursePath}"><i class="pli-unlock icon-lg icon-fw"></i> Logout</a></li>
						</ul>
					</div></li>
				<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
				<!--End user dropdown-->

				<li><a href="#" class="aside-toggle"> <i class="pli-dot-vertical"></i>
				</a></li>
			</ul>
		</div>
		<!--================================-->
		<!--End Navbar Dropdown-->

	</div>
</header>
