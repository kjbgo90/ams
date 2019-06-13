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

<title>Manage Posts | Nifty - Admin Template</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--나눔 고딕 Font [ OPTIONAL ] -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">


<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/ionicons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css" rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css" rel="stylesheet">


<!--=================================================-->

<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>


<!--=================================================

    REQUIRED
    You must include this in your project.


    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.


    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.


    DEMONSTRATION
    This is to be removed, used forÂ demonstration purposes only.Â This category must not be included in your project.


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
						<h1 class="page-header text-overflow">공지사항</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">코스 </a></li>
						<li class="active">공지사항</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->


				</div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">


					<!-- Search -->
					<!--===================================================-->
					<div class="row pad-btm">

						<form action="#" method="post" class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor"></form>
					</div>

					<!-- Toolbar -->
					<!--===================================================-->
					<hr class="new-section-xs bord-no">

					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title" style="padding-left: 30px; padding-top: 10px;">공지사항</h3>
						</div>
						<hr>

						<div class="row pad-btm">
								<div class="input-group mar-btm col-xs-12 col-sm-10 col-sm-offset-1 pad-hor "   style="padding-left: 500px;">
									<input id="searchAnyThing" type="text" placeholder="Search posts..." class="form-control input-sm"> <span class="input-group-btn">
										<button id="searchPostTitle"  class="btn btn-primary btn-sm" type="button">검색</button>
									</span>
								</div>
						</div>
						<!--Posts Table-->
						<!--===================================================-->
						<div class="panel-body" style="padding-left: 79px; padding-right: 70px;">

							<div class="table-responsive">
								<table class="table table-striped table-vcenter">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>등록일</th>
											<th>글쓴이</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody id="postList">
									
									</tbody>
								</table>
							</div>
							<br> <br>
							<div class="row">
							
								<div class="col-sm-7 text-right">
								

								
									<ul id="pager" class="pagination">
										
									</ul>
								</div>
								<div class="col-sm-5 text-right">
									<%-- <div class="btn btn-primary btn-sm" style="margin-right: 50px;" onclick="location.href='${pageContext.request.contextPath }/${coursePath}/notice/writeform' ">글작성</div> --%>
									<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath }/${coursePath}/notice/writeform">글작성</a>
									
								</div>
							</div>
						</div>
						<!--===================================================-->
						<!--End Posts Table-->




					</div>
					<!--===================================================-->
					<!--End page content-->

				</div>
				<!--===================================================-->
				<!--End page content-->

			</div>
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
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>




	<!--=================================================-->

	<script type="text/javascript">
		$("document").ready(function(){
			pageNo = 1;
			pagingAjax(pageNo);
			console.log(pageNo);
			pageMove()
		});
		
		
		//검색기능 
		$("#searchPostTitle").on("click",function(){
			console.log("search anyOne");
			var postTitle = $("#searchAnyThing").val();
			console.log(postTitle);
			
			//ajax 처리해서 검색 
			$("#postList").empty("");
			$.ajax({
				url : "${pageContext.request.contextPath }/${coursePath}/notice/searchList",
				type : "post",
				data : {
					postTitle:postTitle
				},
				dataType : "json",	
				success : function(list) {
					if (list.length == 0) {
						$("#blogList").html("검색된 게시글이 없습니다.");
					} else {
						str = "";
						for (var i = 0; i < list.length; i++) {
							
						str+="<tr>"	
						str+="<td>"+list[i].postNo+"</td>"			
						str+="<td><a class='btn-link' href='${pageContext.request.contextPath }/${coursePath}/notice/read/'"+list[i].postNo+">["+list[i].category+"]"+list[i].postTitle+"</a></td>"
						str+="<td><span class='text-muted'>"+list[i].regDate+"</span></td>"				
						str+="<td><a href='${pageContext.request.contextPath }/${coursePath}/notice/read/"+list[i].postNo+" class='btn-link'>"+list[i].userName+"</a></td>"				
						str+="<td>"+list[i].hit+"</td>"				
						str+="</tr>"		
						
						}
						$("#postList").html(str);
						str = "";
					}
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		});
		
		//페이징 처리할 부분 첫번째 리스트를 뽑아오자~
		function pagingAjax(pageNo){
				console.log(pageNo);
				$.ajax({
					url : "${pageContext.request.contextPath }/${coursePath}/notice/selectPostPaging",
					type : "post",
					data : {
						pageNo:pageNo
					},
					dataType : "json",	
					success : function(map) {
						console.log(map);
						console.log(map.maxPage);
						console.log(map.list);
						console.log(pageNo);
						
						paging(pageNo,map.maxPage);
						
						if (map.list.length == 0) {
							$("#blogList").html(
									"등록된 게시글이 없습니다.");
						} else {
							str = "";
							for (var i = 0; i < map.list.length; i++) {
								
								
							str+="<tr>"	
							str+="<td>"+map.list[i].rnum+"</td>"			
							str+="<td><a class='btn-link' href='${pageContext.request.contextPath }/${coursePath}/notice/read/'"+map.list[i].postNo+">["+map.list[i].category+"]"+map.list[i].postTitle+"</a></td>"
							str+="<td><span class='text-muted'>"+map.list[i].regDate+"</span></td>"				
							str+="<td><a href='${pageContext.request.contextPath }/${coursePath}/notice/read/"+map.list[i].postNo+" class='btn-link'>"+map.list[i].userName+"</a></td>"				
							str+="<td>"+map.list[i].hit+"</td>"				
							str+="</tr>"		
							
							}
							$("#postList").html(str);
							str = "";
						}
						
						paging(pageNo, map.maxPage);
						
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
		}
		
		
		function paging(pageno,maxPage){
			pg = ""
				pg +="<ul class='pagination'>";
			if(pageno>1){
				pg +="<li data-pageno="+(pageno-1)+"><a class='demo-pli-arrow-left'>";
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}
			if(pageno>3)	
			{
				pg +="<li data-pageno="+(pageno-3)+" ><a>";
				pg +=	pageno-3  ;
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}
			if(pageno>2){
				pg +="<li data-pageno="+(pageno-2)+" ><a>";
				pg +=	pageno-2 ;
				pg +="</a></li>";	
			}else{
				pg +="<li>";
				pg +="</li>";
			}
			if(pageno>1){
				pg +="<li data-pageno="+(pageno-1)+"><a>";
				pg +=	pageno-1 ;
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}
		
			pg +="<li data-pageno="+pageno+" class='active'><a>"+pageno +" </li>";
			
			if(pageno+1<=maxPage){
				pg +="<li data-pageno="+(pageno+1)+"><a>";
				pg += 	pageno+1  ;
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}
			if(pageno+2<=maxPage){
				pg +="<li data-pageno="+(pageno+2)+"><a>";
				pg +=	 pageno+2  ;
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}
			if(pageno+3<=maxPage){
				pg +="<li data-pageno="+(pageno+3)+"><a>";
				pg +=	pageno+3 ;
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}
			if(pageno+1<=maxPage){
				pg +="<li data-pageno="+(pageno+1)+"><a  class='demo-pli-arrow-right'>";
				pg +="</a></li>";
			}else{
				pg +="<li>";
				pg +="</li>";
			}

			pg +="</ul>";

							
					
			$("#pager").html(pg);
			
		}
		

			function pageMove(){
				$("#pager").on("click","li",function(){
					$this = $(this);
					console.log($this);
					var pageNo = $this.data("pageno");
					console.log(pageNo);
					pagingAjax(pageNo);
				});
			}
			
			
	</script>

</body>
</html>
