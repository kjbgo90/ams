<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>

<head>

<style>
#map {
	height: 400px;
	width: 100%;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>community-write</title>


<!--STYLESHEET-->
<!--=================================================-->

<!--Open Sans Font [ OPTIONAL ]-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700'
	rel='stylesheet' type='text/css'>


<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css"
	rel="stylesheet">


<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="${pageContext.request.contextPath }/assets/css/nifty.css"
	rel="stylesheet">


<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link
	href="${pageContext.request.contextPath }/assets/css/demo/nifty-demo-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/assets/css/premium/icon-sets/icons/line-icons/premium-line-icons.min.css"
	rel="stylesheet">
<!--=================================================-->


<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="${pageContext.request.contextPath }/assets/css/pace.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/assets/js/pace.js"></script>


<!--Dropzone [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css"
	rel="stylesheet">

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
		<!--NAVBAR-->
		<!--===================================================-->
		<!-- header -->
		<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
		<!--===================================================-->
		<!--END NAVBAR-->
		<!--===================================================-->

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
				<div id="page-content">
					<div class="row">
						<div class="col-lg-8">

							<div class="fluid">

								<div id="pagelist" class="blog blog-list">

								</div>
							</div>
							<div class="col-sm-7 text-right">
									<ul id="pager" class="pagination">
									</ul>
								</div>
						</div>
						<div class="col-lg-4">

							<!--Page content-->
							<!--===================================================-->
							<div id="page-content">
								<!-- <div class="panel"> -->
									<!-- <div class="panel-heading"></div> -->
									<!-- <div class="panel-body"> -->
										<div class="fixed-fluid">
											<!-- map -->
											<!-- <div class="fixed-sm-350 pull-sm-right"> -->
											<div class="list-inline mar-hor">
												<div id="map"></div>
											</div>
										</div>
										<hr>
										<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase" id="cpostType" data-type="${cpostType }">
											HOT PLACE<i class="icon-lg icon-fw demo-pli-map-marker-2"></i>
										</p>

										<ul class="list-inline mar-hor" id="hotplaces">

										</ul>
										<hr>

										<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">BEST
											POST</p>
										<div class="list-group bg-trans pad-btm bord-btm" >
											 <c:forEach items="${getlikedList}" var="List">
												<div class="list-group-item list-item-sm">
													<a href="${pageContext.request.contextPath }/community/read/${List.cpostNo}" class="btn-link">${List.cpostTitle}</a>
													<small class="box-block">${List.regDate}</small>
												</div>
											</c:forEach> 
										</div>


										<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">MY POST</p>
										<a href="${pageContext.request.contextPath }/user/loginform" class="list-group-item">
										<c:choose>
											<c:when test="${not empty authUser}">
												<div class="media-left pos-rel">
													<img class="img-circle img-xs" src="${pageContext.request.contextPath }/assets/img/profile-photos/7.png" alt="Profile Picture">
												</div>
												<div class="media-body">
													<p class="mar-no text-main">${authUser.userName }</p>
												</div>
											</c:when>
											<%-- <c:otherwise>
											</c:otherwise> --%>
										</c:choose>
										</a>
										<div class='list-group bg-trans pad-btm bord-btm' id="myPost">
												
										</div>
										
										<!-- <hr>
										<br> &nbsp; -->
										<button class="btn btn-dark btn-circle"
											onclick="location.href='${pageContext.request.contextPath }/community/writeform' ">
											<i class="demo-psi-pen-5 icon-2x"></i>
										</button>
										<br>



									<!-- </div> -->
								<!-- </div> -->
							</div>
						</div>
					</div>

					<!--===================================================-->

				</div>

			</div>
			<!--===================================================-->
			<!--End page content-->

		</div>

		<!--ASIDE-->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>
		<!--===================================================-->
		<!--END ASIDE-->

		<!--MAIN NAVIGATION-->
		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/otherNavigation.jsp"></c:import>
		<!--===================================================-->
		<!--END MAIN NAVIGATION-->



		<!--===================================================-->
		<!--END CONTENT CONTAINER-->

		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

		<!-- SCROLL PAGE BUTTON -->
		<!--===================================================-->
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>
		<!--===================================================-->
	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->





	<!--JAVASCRIPT-->
	<!--=================================================-->


	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>

	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>



	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!-- GMaps -->
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4&libraries=places"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gmaps.js"></script>

	<!--=================================================-->

	<script type="text/javascript">
		Dropzone.autoDiscover = false;

		var fileList = [];

		// DROPZONE.JS
		// =================================================================
		// Require Dropzone
		// http://www.dropzonejs.com
		// =================================================================
		//파일 업로드 드래그 앤 드롭할때 
		$("#dropzone").dropzone({
			url : "${pageContext.request.contextPath }/community/upload",
			success : function(file, fileVo) {
				console.log(file);
				console.log(fileVo);
				fileList.push(fileVo);
				console.log(fileList);
				console.log(fileList.length);
			}
		});
		
		$("document").ready(function(){
			var pageNo = 1;
			console.log(pageNo);
			pagingAjax(pageNo);
			pageMove()
		})
	</script>


	<script type="text/javascript">
		
		//지도 출력, hotplaces 10곳, 내가 작성한 게시글 5개 로드
		$(document).ready(function() {
				
				var markerMap = new GMaps({
					el : '#map',
					lat : 37.4983761,
					lng : 127.0275566,

				});
				
				console.log("-------------------HOT PLCAE-------------------");
				var cpostType = $("#cpostType").data("type");
				$.ajax({
					url : "${pageContext.request.contextPath }/community/hotPlaces?cpostType="+cpostType,
					type : "post",

					dataType : "json",
					success : function(result) {
						renderHotPlaces(markerMap, result);
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
				
				console.log("-------------------My Post-------------------");
				$.ajax({
					url : "${pageContext.request.contextPath}/community/myPost?cpostType="+cpostType,
					type : "post",
					
					dataType : "json",
					success : function(list) {
						if(list != ""){
							for(var i=0; i<list.length; i++){
								renderMyPost(list[i]);
							}
						}
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				})
				
				$("#page-content").on("click", "#businessName", function(){
					var lat = $(this).data("lat");
					var lng = $(this).data("lng");
					console.log(lat);
					console.log(lng);
					markerMap.setCenter(lat, lng);
				});
		});
		
		// 지도에 핀을 찍어주는 function
		function addMarker(input_map, input_businessName, input_address, input_lat, input_lng){
			input_map.addMarker({
				lat : input_lat,
				lng : input_lng,
				title : 'Location',
				infoWindow : {
					content : '<div>'+ input_businessName +'</div><div>'+ input_address +'</div>'
				}
			});
		}
		
		function setCenter(input_map, input_lat, input_lng){
			input_map.setCenter(input_lat, input_lng);
		}
		
		// 가장 좋아요가 많은 장소 출력 폼 
		function renderHotPlaces(map, list) {
			$("#hotplaces").empty();
			for (var i = 0; i < list.length; i++) {
				str = '';
				str += '<li class="tag tag-sm" id="businessName" data-lat="'+ list[i].latitude +'" data-lng="'+ list[i].longitude +'" style=""><a href="#">'+ list[i].businessName + '</a></li>';
				str += '<span class="mar-rgt">&nbsp;&nbsp;&nbsp;<i class="demo-psi-heart-2 icon-fw"></i>'+ list[i].liked + '</span><br/>'
				addMarker(map, list[i].businessName, list[i].address, list[i].latitude, list[i].longitude);
				$("#hotplaces").append(str);
			}
		}
		
		// 내가 작성한 게시글 출력 폼
		function renderMyPost(CommunityVo){
			
			str='';
			str+="<div class='list-group-item list-item-sm'>";
			str+="	<a href='${pageContext.request.contextPath }/community/read/" + CommunityVo.cpostNo + "' class='btn-link'>"+ CommunityVo.cpostTitle +"</a>";
			str+="	<small class='box-block'><i class='demo-psi-heart-2 icon-fw'></i> "+ CommunityVo.liked +"</small>";
			str+="</div>";
			
			$("#myPost").append(str);
		}
		
		// 비동기 통신으로 리스트 출력 
		function pagingAjax(input_pageNo){
			console.log(input_pageNo);
			var cpostType = $("#cpostType").data("type");
			$.ajax({
				url : "${pageContext.request.contextPath }/community/selectPostPaging?cpostType="+cpostType,
				type : "post",
				data : {
					pageNo:input_pageNo
				},
				dataType : "json",	
				success : function(map) {
					console.log(map);
					console.log(map.maxPage);
					console.log(map.list);
					console.log(input_pageNo);
					astr = "";
					paging(input_pageNo,map.maxPage);
					
					// onclick=location.href='${pageContext.request.contextPath }/community/read/"+ map.list[i].cpostNo+"'
					if (map.list.length == 0) {
						//$("#blogList").html("등록된 게시글이 없습니다.");
					} else {
						for (var i = 0; i < map.list.length; i++) {
							astr+="<div class='panel sm' id='pagelist'>"
							astr+="<div class='blog-header' onclick=location.href='${pageContext.request.contextPath }/community/read/"+ map.list[i].cpostNo+"'>"
							if(map.list[i].fileList != ""){
								astr+="<img class='img-responsive' src="+map.list[i].fileList[0].filepath+" style='width: 350px; height: 250px;' alt='Image'>"
							}
							astr+="</div>"
							astr+="<div class='blog-content'>"
							astr+="<div class='blog-title media-block'>"
							astr+="<div class='media-body'>"
							astr+="<a href='${pageContext.request.contextPath }/community/read/" + map.list[i].cpostNo + "' class='btn-link'>"
							astr+="<h2>"+map.list[i].cpostTitle+"</h2>"
							astr+="</a>"
							astr+="</div>"
							astr+="</div>"
							astr+="<div class='blog-body'>"
							astr+="<p>"+map.list[i].cpostContent+"</p>"
							astr+="</div>"
							astr+="</div>"
							astr+="<div class='blog-footer'>"
							astr+="<div class='media-left'>"
							astr+="<span class='label label-success'>"+map.list[i].regDate+"</span>"
							astr+="</div>"
							astr+="<div class='media-body text-right'>"
							astr+="<span class='mar-rgt'>"
							astr+="<i class='demo-pli-heart-2 icon-fw'></i>"+map.list[i].liked
							astr+="</span> "
							astr+="<i class='demo-pli-speech-bubble-5 icon-fw'></i>"+map.list[i].replyCount
							astr+="</div>"
							astr+="</div>"
							astr+="</div>"

						}
						$("#pagelist").html(astr);
						astr = "";
					}
					
					paging(input_pageNo, map.maxPage);
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}	
		
		//페이지 분할
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
		
		// 페이지 이동 
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
