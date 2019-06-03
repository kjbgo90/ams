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
<title>Blog | Nifty - Admin Template</title>
<!--STYLESHEET-->
<!--=================================================-->

<!--나눔 고딕 Font [ OPTIONAL ] -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

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

<!--FooTable [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/fooTable/css/footable.core.css" rel="stylesheet">

<!--Dropzone [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css" rel="stylesheet">
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
		<!--===================================================-->
		<!-- content -->
		<div class="boxed">
			<!--CONTENT CONTAINER-->
			<!--===================================================-->
			<div id="content-container">
				<div id="page-head">
					<!--Page Title-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<div id="page-title">
						<h1 class="page-header text-overflow">과제 게시판</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->
					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">App</a></li>
						<li class="active">과제 게시판</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->
				</div>
				<div id="page-content">
					<div class="fixed-fluid">
						<div class="fluid col-xs-7">
							<!--과제 Accordion-->
							<!--===================================================-->
							<div class="panel-group accordion" id="accordion">
								<div class="panel">
									<!--Accordion title-->
									<div class="panel-heading" style="padding-left: 15px;">
										<h4 class="panel-title text-main text-bold text-lg text-uppercase">
											<a data-parent="#accordion" data-toggle="collapse" href="#collapseOne">JAVA</a>
										</h4>
									</div>
									<!--Accordion content-->
									<div class="panel-collapse collapse in" id="collapseOne">
										<div class="panel-body">
											<div class="panel-group accordion" id="accordionInside">
												<div class="panel panel-bordered-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInside" data-toggle="collapse" href="#collapseOneInside3">JAVA_3번 숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse in" id="collapseOneInside3">
														<div class="panel-body">
															<div class="row">
																<div class="col-sm-7 toolbar-left">
																	<!--Sender Information-->
																	<div class="media">
																		<span class="media-left"> <img src="${pageContext.request.contextPath }/assets/img/profile-photos/8.png" class="img-circle img-sm" alt="Profile Picture">
																		</span>
																		<div class="media-body text-left">
																			<div class="text-bold">Lisa D. Smith</div>
																			<small class="text-muted">lisa.aqua@themeon.net</small>
																		</div>
																	</div>
																</div>
																<div class="col-sm-5 toolbar-right">
																	<!--Details Information-->
																	<p class="mar-no">
																		<small class="text-muted">Monday 12, May 2016</small>
																	</p>
																</div>
															</div>
															<p>3번숙제의 내용입니다 이 문제를 풀어보세요!</p>
														</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-primary">과제제출</button></li>
														</ul>
													</div>
												</div>
												<div class="panel panel-bordered-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInside" data-toggle="collapse" href="#collapseOneInside2">JAVA_2번 숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse" id="collapseOneInside2">
														<div class="panel-body">
															<div class="row">
																<div class="col-sm-7 toolbar-left">
																	<!--Sender Information-->
																	<div class="media">
																		<span class="media-left"> <img src="${pageContext.request.contextPath }/assets/img/profile-photos/8.png" class="img-circle img-sm" alt="Profile Picture">
																		</span>
																		<div class="media-body text-left">
																			<div class="text-bold">Lisa D. Smith</div>
																			<small class="text-muted">lisa.aqua@themeon.net</small>
																		</div>
																	</div>
																</div>
																<div class="col-sm-5 toolbar-right">
																	<!--Details Information-->
																	<p class="mar-no">
																		<small class="text-muted">Monday 12, May 2016</small>
																	</p>
																</div>
															</div>
															<p>2번숙제의 내용입니다 이 문제를 풀어보세요!</p>
														</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-primary">과제제출</button></li>
														</ul>
													</div>
												</div>
												<div class="panel panel-bordered-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInside" data-toggle="collapse" href="#collapseOneInside1">JAVA_1번 숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse" id="collapseOneInside1">
														<div class="panel-body">
															<div class="row">
																<div class="col-sm-7 toolbar-left">
																	<!--Sender Information-->
																	<div class="media">
																		<span class="media-left"> <img src="${pageContext.request.contextPath }/assets/img/profile-photos/8.png" class="img-circle img-sm" alt="Profile Picture">
																		</span>
																		<div class="media-body text-left">
																			<div class="text-bold">Lisa D. Smith</div>
																			<small class="text-muted">lisa.aqua@themeon.net</small>
																		</div>
																	</div>
																</div>
																<div class="col-sm-5 toolbar-right">
																	<!--Details Information-->
																	<p class="mar-no">
																		<small class="text-muted">Monday 12, May 2016</small>
																	</p>
																</div>
															</div>
															<p>1번숙제의 내용입니다 이 문제를 풀어보세요!</p>
														</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-primary">과제제출</button></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel">
									<!--Accordion title-->
									<div class="panel-heading" style="padding-left: 15px;">
										<h4 class="panel-title text-main text-bold text-lg text-uppercase">
											<a data-parent="#accordion" data-toggle="collapse" href="#collapseTwo">Oracle</a>
										</h4>
									</div>
									<!--Accordion content-->
									<div class="panel-collapse collapse" id="collapseTwo">
										<div class="panel-body">
											<div class="panel-group accordion" id="accordionInsideTwo">
												<div class="panel panel-bordered panel-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInsideTwo" data-toggle="collapse" href="#collapseTwoInside3">JAVA_3번숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse in" id="collapseTwoInside3">
														<div class="panel-body">3번숙제의 내용입니다 이 문제를 풀어보세요!</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-pink">상세보기</button></li>
														</ul>
													</div>
												</div>
												<div class="panel panel-bordered panel-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInsideTwo" data-toggle="collapse" href="#collapseTwoInside2">JAVA_2번숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse" id="collapseTwoInside2">
														<div class="panel-body">2번숙제의 내용입니다 이 문제를 풀어보세요!</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-pink">상세보기</button></li>
														</ul>
													</div>
												</div>
												<div class="panel panel-bordered panel-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInsideTwo" data-toggle="collapse" href="#collapseTwoInside1">JAVA_1번숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse" id="collapseTwoInside1">
														<div class="panel-body">3번숙제의 내용입니다 이 문제를 풀어보세요!</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-pink">상세보기</button></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel">
									<!--Accordion title-->
									<div class="panel-heading" style="padding-left: 15px;">
										<h4 class="panel-title text-main text-bold text-lg text-uppercase">
											<a data-parent="#accordion" data-toggle="collapse" href="#collapseThree">HTML/CSS</a>
										</h4>
									</div>
									<!--Accordion content-->
									<div class="panel-collapse collapse" id="collapseThree">
										<div class="panel-body">
											<div class="panel-group accordion" id="accordionInsideThree">
												<div class="panel panel-bordered panel-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInsideThree" data-toggle="collapse" href="#collapseThreeInside3">JAVA_3번숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse in" id="collapseThreeInside3">
														<div class="panel-body">3번숙제의 내용입니다 이 문제를 풀어보세요!</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-pink">상세보기</button></li>
														</ul>
													</div>
												</div>
												<div class="panel panel-bordered panel-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInsideThree" data-toggle="collapse" href="#collapseThreeInside2">JAVA_2번숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse" id="collapseThreeInside2">
														<div class="panel-body">2번숙제의 내용입니다 이 문제를 풀어보세요!</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-pink">상세보기</button></li>
														</ul>
													</div>
												</div>
												<div class="panel panel-bordered panel-primary">
													<div class="panel-heading">
														<h4 class="panel-title">
															<a data-parent="#accordionInsideThree" data-toggle="collapse" href="#collapseThreeInside1">JAVA_1번숙제</a>
														</h4>
													</div>
													<div class="panel-collapse collapse" id="collapseThreeInside1">
														<div class="panel-body">3번숙제의 내용입니다 이 문제를 풀어보세요!</div>
														<!--List group-->
														<ul class="list-group">
															<li class="list-group-item">Chapter : 상속과 다형성</li>
															<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
															<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
															</a></li>
															<li class="list-group-item"><button class="btn btn-block btn-pink">상세보기</button></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--===================================================-->
							<!--End 과제 Accordion-->
							<div class="panel">
								<!--Panel heading-->
								<div class="panel-heading btn btn-block" data-panel="minmax" aria-expanded="true">
									<div class="panel-control">
										<i class="demo-psi-chevron-up"></i>
									</div>
									<h3 class="panel-title text-left">JAVA</h3>
								</div>
								<!--Panel body-->
								<div class="collapse in" aria-expanded="true">
									<div class="panel-body">
										<!--Inner Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">JAVA 과제 #3</h3>
											</div>
											<!--Default panel contents-->
											<div class="panel-body">
												<p>상속과 다형성을 사용하여 코드를 작성하시오.</p>
											</div>
											<!--List group-->
											<ul class="list-group">
												<li class="list-group-item">Chapter : 상속과 다형성</li>
												<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
												<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
												</a></li>
												<li class="list-group-item"><button class="btn btn-block btn-primary">상세보기</button></li>
											</ul>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">JAVA 과제 #2</h3>
											</div>
											<div class="panel-body">
												<p>상속과 다형성을 사용하여 코드를 작성하시오.</p>
											</div>
											<!--List group-->
											<ul class="list-group">
												<li class="list-group-item">Chapter : 상속과 다형성</li>
												<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
												<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
												</a></li>
												<li class="list-group-item"><button class="btn btn-block btn-primary">상세보기</button></li>
											</ul>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">JAVA 과제 #1</h3>
											</div>
											<div class="panel-body">
												<p>상속과 다형성을 사용하여 코드를 작성하시오.</p>
											</div>
											<!--List group-->
											<ul class="list-group">
												<li class="list-group-item">Chapter : 상속과 다형성</li>
												<li class="list-group-item">제출기한 : 2019년 6월 12일</li>
												<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
												</a></li>
												<li class="list-group-item"><button class="btn btn-block btn-primary">상세보기</button></li>
											</ul>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--End Inner Panel-->
									</div>
								</div>
							</div>
							<div class="panel">
								<!--Panel heading-->
								<div class="panel-heading btn btn-block" data-panel="minmax">
									<div class="panel-control">
										<i class="demo-psi-chevron-up"></i>
									</div>
									<h3 class="panel-title text-left">Oracle</h3>
								</div>
								<!--Panel body-->
								<div class="collapse">
									<div class="panel-body">
										<!--Inner Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">Oracle 과제 #3</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">Oracle 과제 #2</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">Oracle 과제 #1</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--End Inner Panel-->
									</div>
								</div>
							</div>
							<div class="panel">
								<!--Panel heading-->
								<div class="panel-heading btn btn-block" data-panel="minmax">
									<div class="panel-control">
										<i class="demo-psi-chevron-up"></i>
									</div>
									<h3 class="panel-title text-left">AWS</h3>
								</div>
								<!--Panel body-->
								<div class="collapse">
									<div class="panel-body">
										<!--Inner Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">AWS 과제 #3</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">AWS 과제 #2</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">AWS 과제 #1</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--End Inner Panel-->
									</div>
								</div>
							</div>
							<div class="panel">
								<!--Panel heading-->
								<div class="panel-heading btn btn-block" data-panel="minmax">
									<div class="panel-control">
										<i class="demo-psi-chevron-up"></i>
									</div>
									<h3 class="panel-title text-left">HTML/CSS</h3>
								</div>
								<!--Panel body-->
								<div class="collapse">
									<div class="panel-body">
										<!--Inner Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">HTML/CSS 과제 #3</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">HTML/CSS 과제 #2</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--Dark Panel-->
										<!--===================================================-->
										<div class="panel panel-bordered-dark">
											<div class="panel-heading">
												<h3 class="panel-title">HTML/CSS 과제 #1</h3>
											</div>
											<div class="panel-body">
												<p>Lorem ipsum dolor sit amet.</p>
											</div>
										</div>
										<!--===================================================-->
										<!--End Dark Panel-->
										<!--End Inner Panel-->
									</div>
								</div>
							</div>
						</div>
						<div class="panel col-xs-5">
							<p class="pad-hor mar-top text-main text-bold text-lg text-uppercase" style="padding-left: 3px;">JAVA_3번 숙제</p>
							<div class="panel panel-bordered-primary">
								<div class="panel-body">
									<form action="">
										<div class="row">
											<div class="col-sm-7 toolbar-left">
												<!--Sender Information-->
												<div class="media">
													<span class="media-left"> <img src="${pageContext.request.contextPath }/assets/img/profile-photos/1.png" class="img-circle img-sm" alt="Profile Picture">
													</span>
													<div class="media-body text-left">
														<div class="text-bold">이종현</div>
														<small class="text-muted">jh_93@naver.com</small>
													</div>
												</div>
											</div>
											<div class="col-sm-5 toolbar-right"></div>
										</div>
										<div>
											<p>comment</p>
											<textarea style="width: 100%; height: 80px;"></textarea>
										</div>
										<div>
											<div class="bord-top pad-ver">
												<!-- The fileinput-button span is used to style the file input field as button -->
												<span class="btn btn-primary fileinput-button dz-clickable"> <i class="fa fa-plus"></i> <span>파일 첨부</span>
												</span>
												<div id="dz-previews">
													<div id="dz-template" class="pad-top bord-top">
														<div class="media">
															<div class="media-body">
																<!--This is used as the file preview template-->
																<div class="media-block">
																	<div class="media-left">
																		<img class="dz-img" data-dz-thumbnail>
																	</div>
																	<div class="media-body">
																		<p class="text-main text-bold mar-no text-overflow" data-dz-name></p>
																		<span class="dz-error text-danger text-sm" data-dz-errormessage></span>
																		<p class="text-sm" data-dz-size></p>
																		<div id="dz-total-progress" style="opacity: 0">
																			<div class="progress progress-xs active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
																				<div class="progress-bar progress-bar-success" style="width: 0%;" data-dz-uploadprogress></div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="media-right">
																<button data-dz-remove class="btn btn-xs btn-danger dz-cancel">
																	<i class="demo-psi-trash"></i>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div>
												<button class="btn btn-lg btn-danger pull-right">제출하기</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="panel panel-bordered-primary">
								<div class="panel-heading">
									<h3 class="panel-title text-bold">제출자 명단</h3>
								</div>
								<!--Table-->
								<table class="table">
									<thead>
										<tr>
											<th class="text-center">#</th>
											<th>Name</th>
											<th>File</th>
											<th>Comment</th>
											<th>Date</th>
											<th>Detail</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center">1</td>
											<td>김재봉</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>여기</td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td class="text-center">2</td>
											<td>이종현</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>너무</td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td class="text-center">3</td>
											<td>강보은</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>좁은거</td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td class="text-center">3</td>
											<td>구민수</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>아닌가</td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
										<tr>
											<td class="text-center">3</td>
											<td>이건창</td>
											<td><a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
											</a></td>
											<td>모르겠네</td>
											<td>2019-06-02</td>
											<td><button class="btn btn-sm btn-primary" data-target="#demo-default-modal" data-toggle="modal">click</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Default Bootstrap Modal-->
		<!--===================================================-->
		<div class="modal fade" id="demo-default-modal" role="dialog" tabindex="-1" aria-labelledby="demo-default-modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!--Modal header-->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<i class="pci-cross pci-circle"></i>
						</button>
						<h4 class="modal-title">과제 상세보기</h4>
					</div>
					<!--Modal body-->
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-7 toolbar-left">
								<!--Sender Information-->
								<div class="media">
									<span class="media-left"> <img src="${pageContext.request.contextPath }/assets/img/profile-photos/1.png" class="img-circle img-sm" alt="Profile Picture">
									</span>
									<div class="media-body text-left">
										<div class="text-bold">이종현</div>
										<small class="text-muted">jh_93@naver.com</small>
									</div>
								</div>
							</div>
							<div class="col-sm-5 toolbar-right">
								<!--Details Information-->
								<p class="mar-no">
									<small class="text-muted">Sunday 02, June 2019</small>
								</p>
							</div>
						</div>
						<div>과제 제출했습니다. 이렇게 저렇게 실행하세요.</div>
						</div>
						<ul class="list-group">
							<li class="list-group-item">첨부파일 : <a href="#"> <strong>Holiday.zip</strong> <i class="demo-psi-paperclip icon-lg icon-fw"></i>
							</a></li>
						</ul>
					<!--Modal footer-->
					<div class="modal-footer">
						<button class="btn btn-danger">Delete</button>
						<button data-dismiss="modal" class="btn btn-primary" type="button">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->
		<!--End Default Bootstrap Modal-->
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
		<!-- FOOTER -->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->
	</div>
	<!-- SCROLL PAGE BUTTON -->
	<!--===================================================-->
	<button class="scroll-top btn">
		<i class="pci-chevron chevron-up"></i>
	</button>
	<!--===================================================-->
	<!--===================================================-->
	<!-- END OF CONTAINER -->
	<!--JAVASCRIPT-->
	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>
	
	
	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>
	
	<!--Form File Upload [ SAMPLE ]-->
	<script src="${pageContext.request.contextPath }/assets/js/form-file-upload.js"></script>
	
	<script type="text/javascript">
		// Tables-FooTable.js
		// ====================================================================
		// This file should not be included in your project.
		// This is just a sample how to initialize plugins or components.
		//
		// - ThemeOn.net -

		$(document)
				.on(
						'nifty.ready',
						function() {

							// FOO TABLES
							// =================================================================
							// Require FooTable
							// -----------------------------------------------------------------
							// http://fooplugins.com/footable-demos/
							// =================================================================

							// Row Toggler
							// -----------------------------------------------------------------
							$('#demo-foo-row-toggler').footable();

							// Expand / Collapse All Rows
							// -----------------------------------------------------------------
							var fooColExp = $('#demo-foo-col-exp');
							fooColExp.footable().trigger(
									'footable_expand_first_row');

							$('#demo-foo-collapse').on('click', function() {
								fooColExp.trigger('footable_collapse_all');
							});
							$('#demo-foo-expand').on('click', function() {
								fooColExp.trigger('footable_expand_all');
							})

							// Accordion
							// -----------------------------------------------------------------
							$('#demo-foo-accordion')
									.footable()
									.on(
											'footable_row_expanded',
											function(e) {
												$(
														'#demo-foo-accordion tbody tr.footable-detail-show')
														.not(e.row)
														.each(
																function() {
																	$(
																			'#demo-foo-accordion')
																			.data(
																					'footable')
																			.toggleDetail(
																					this);
																});
											});

							// Pagination
							// -----------------------------------------------------------------
							$('#demo-foo-pagination').footable();
							$('#demo-show-entries').change(
									function(e) {
										e.preventDefault();
										var pageSize = $(this).val();
										$('#demo-foo-pagination').data(
												'page-size', pageSize);
										$('#demo-foo-pagination').trigger(
												'footable_initialized');
									});

							// Filtering
							// -----------------------------------------------------------------
							var filtering = $('#demo-foo-filtering');
							filtering
									.footable()
									.on(
											'footable_filtering',
											function(e) {
												var selected = $(
														'#demo-foo-filter-status')
														.find(':selected')
														.val();
												e.filter += (e.filter && e.filter.length > 0) ? ' '
														+ selected
														: selected;
												e.clear = !e.filter;
											});

							// Filter status
							$('#demo-foo-filter-status').change(function(e) {
								e.preventDefault();
								filtering.trigger('footable_filter', {
									filter : $(this).val()
								});
							});

							// Search input
							$('#demo-foo-search').on('input', function(e) {
								e.preventDefault();
								filtering.trigger('footable_filter', {
									filter : $(this).val()
								});
							});

							// Add & Remove Row
							// -----------------------------------------------------------------
							var addrow = $('#demo-foo-addrow');
							addrow.footable().on('click', '.demo-delete-row',
									function() {

										//get the footable object
										var footable = addrow.data('footable');

										//get the row we are wanting to delete
										var row = $(this).parents('tr:first');

										//delete the row
										footable.removeRow(row);
									});

							// Search input
							$('#demo-input-search2').on('input', function(e) {
								e.preventDefault();
								addrow.trigger('footable_filter', {
									filter : $(this).val()
								});
							});

							// Add Row Button
							$('#demo-btn-addrow')
									.click(
											function() {

												//get the footable object
												var footable = addrow
														.data('footable');

												//build up the row we are wanting to add
												var newRow = '<tr><td><button class="demo-delete-row btn btn-danger btn-xs"><i class="demo-pli-cross"></i></button></td><td>Adam</td><td>Doe</td><td>Traffic Court Referee</td><td>22 Jun 1972</td><td><span class="label label-table label-success">Active</span></td></tr>';

												//add it
												footable.appendRow(newRow);
											});

							// PANEL WITH BUTTONS - LOADING OVERLAY
							// =================================================================
							// Require Nifty Admin Javascript
							// http://www.themeon.net/
							// =================================================================
							$('.demo-panel-ref-btn')
									.niftyOverlay(
											{
												iconClass : 'demo-psi-repeat-2 spin-anim icon-2x'
											}).on('click', function() {
										var $el = $(this), relTime;
										$el.niftyOverlay('show');

										// Do something...

										relTime = setInterval(function() {
											// Hide the screen overlay
											$el.niftyOverlay('hide');

											clearInterval(relTime);
										}, 2000);
									});
						});
	</script>
</body>
</html>
    