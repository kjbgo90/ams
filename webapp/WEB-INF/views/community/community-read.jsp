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
<link href="${pageContext.request.contextPath }/assets/css/ionicons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/font-awesome.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">


<!--=================================================-->

<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>

<!--Demo [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty-demo.css" rel="stylesheet">
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
						<h1 class="page-header text-overflow">커뮤니티</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">전체 </a></li>
						<li class="active">커뮤니티</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>



				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="panel blog blog-details">
						<div class="panel-body">
							<div class="blog-title media-block">
							<input id="cpostNo" type="hidden" name="cpostNo" value="${CommunityVo.cpostNo}">
								<div class="media-body">
									<h1 class="page-header" style="font-size: 25px;">
										<span>${CommunityVo.cpostTitle}</span>
									</h1>

									<hr>
									<div class="media-right">
										<span class="label label-success">5 Days ago</span>
									</div>
									<div class="media-left">
										<a href="#" class="box-inline"><img alt="Profile Picture" class="img-md img-circle" src="${pageContext.request.contextPath }/${WriterVo.logoPath }"></a>
									</div>
									<div class="media-body pad-top">
										<a href="#" class="box-inline"> <span class="text-lg text-semibold text-main">${WriterVo.userName}</span>
											<p class="text-sm">${WriterVo.email}</p>
										</a>
									</div>

								</div>
							</div>
							<br>
							<div class="blog-header">
								<img class="img-responsive" src="${pageContext.request.contextPath }/assets/img/shared-img-5.jpg" alt="Image">
							</div>
							<div class="blog-content">

								<div class="blog-body">
									<p>${CommunityVo.cpostContent}</p>
								</div>
							</div>
							<div>
								<iframe src="https://www.google.com/maps/embed/v1/place?q=New+York+University&amp;key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" style="width: 100%; height: 200px;"></iframe>
							</div>
							<div class="blog-footer">

								<div class="media-body text-right">
									<span class="mar-rgt"><i class="demo-pli-heart-2 icon-fw"></i>${CommunityVo.liked}</span> <i class="demo-pli-speech-bubble-5 icon-fw"></i>23
								</div>
							</div>
							<div class="row">
								<div class="pad-ver text-reft class col-sm-4">

									<!--Send button-->
									<button id="mail-send-btn" type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/community/selectform' ">
										<i class=" icon-xs icon-fw"></i>목록
									</button>


								</div>
								<div class="pad-ver text-right col-sm-8">

									<!--Save draft button-->
									<button id="mail-send-btn" type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath }/community/modifyform?cpostNo=${CommunityVo.cpostNo}' ">
										<i class=" icon-xs icon-fw"></i>수정
									</button>

									<!--Discard button-->
									<button id="mail-send-btn" type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/community/delete?cpostNo=${CommunityVo.cpostNo}' ">
										<i class=" icon-xs icon-fw"></i>삭제
									</button>
								</div>
							</div>
							<br> <br>


							<!-- Comment form -->
							<!--===================================================-->
							<hr class="new-section-sm bord-no">
							<p class="text-lg text-main text-bold text-uppercase">Leave a comment</p>
							<form role="form">
								<div class="row">

									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" rows="9" placeholder="Your comment" id="commentContent"></textarea>
										</div>
									</div>
								</div>
							</form>
							<button id="btn-comment-regist" type="button" class="btn btn-primary pull-right">
								<i class=" icon-xs icon-fw "></i>댓글등록
							</button>
							<!--===================================================-->
							<!-- End Comment form -->
							<br> <br>
							<hr class="new-section-sm">
							<p class="text-lg text-main text-bold text-uppercase pad-btm">Comments</p>



							<!-- Comments -->
							<!--===================================================-->
							<div class="comments media-block" id="commentDiv">
								<c:forEach items="${replylist}" var="replylist">
									<div class="commentContent">
										<c:if test="${replylist.userNo eq authUser.userNo}">
											<i class="btn btn-danger fa fa-trash pull-right btnCommentDel" data-reply="${replylist.reply}"></i>
										</c:if>
										<a class="media-left" href="#"><img class="img-circle img-sm" alt="Profile Picture" src="${pageContext.request.contextPath }/${replylist.logoPath}"></a>
										<div class="media-body">
											<div class="comment-header">
												<a href="#" class="media-heading box-inline text-main text-bold">${replylist.userName}</a>
												<p class="text-muted text-sm">${replylist.regDate}</p>
											</div>
											<p>${replylist.creplyContent}</p>
										</div>
									</div>
								</c:forEach>
							</div>
							<!--===================================================-->
							<!-- End Comments -->
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




	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>


	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>
	<!--=================================================-->
	<script type="text/javascript">
		/* comment 등록하는 스크립트 */
		$("#btn-comment-regist").on("click", function() {
							var creplyContent = $("#commentContent").val();
							var cpostNo = '${CommunityVo.cpostNo}';
							console.log("게시글 no: " + cpostNo + ", 댓글 내용: " + creplyContent);

						$.ajax({
							url : "${pageContext.request.contextPath}/community/comment/regist",
							type : "post",
							data : {
								cpostNo : cpostNo,
								creplyContent : creplyContent
							},
							dataType : "json",
							success : function(replyVo) {
								$("#commentContent").val("");
								replyRender(replyVo);
							},
							error : function(XHR, status, error) {
								console.error(status + " : "
										+ error);
							}
						});
			});

		/* comment 삭제하는 스크립트 */
		$("#commentDiv").on("click",".btnCommentDel",function() {
							var $this = $(this);
							var reply = $this.data("reply");

							console.log(reply);
							$.ajax({
										url : "${pageContext.request.contextPath }/community/comment/delete",
										type : "post",
										data : {
											reply : reply
										},
										dataType : "json",
										success : function(result) {
											console.log(result);
											$this.parent(".commentContent")
													.remove();
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}
									});

						});

		function replyRender(replyVo) {
			var str = "";

			str += "<div class='commentContent'>";
			str += "	<i class='btn btn-danger fa fa-trash pull-right btnCommentDel' data-reply='" + replyVo.reply + "'></i>";
			str += "	<a class='media-left' href='#''><img class='img-circle img-sm' alt='Profile Picture' src='${pageContext.request.contextPath }/" + replyVo.logoPath + "'></a>";
			str += "	<div class='media-body'>";
			str += "		<div class='comment-header'>";
			str += "			<a href='#' class='media-heading box-inline text-main text-bold'>"
					+ replyVo.userName + "</a>";
			str += "			<p class='text-muted text-sm'>" + replyVo.regDate
					+ "</p>";
			str += "		</div>";
			str += "		<p>" + replyVo.creplyContent + "</p>";
			str += "	</div>";
			str += "</div>"

			$("#commentDiv").append(str);
		}
	</script>



</body>