<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

    <title>Contact Us | Nifty - Admin Template</title>


    <!--STYLESHEET-->
    <!--=================================================-->
    
	<!--Open Sans Font [ OPTIONAL ]-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
 	

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
        
        <!--NAVBAR--> <!--NAVBAR-->
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
                    
                </div>

                
                <!--Page content-->
                <!--===================================================-->
				<div id="page-content">

					<div class="fixed-fluid">
						<!-- map -->
						<div class="fixed-sm-350 pull-sm-right">
							<div id="map"></div>
							<div class="input-group pad-all bord-btm">
								<input type="text" id="place" placeholder="장소 검색" class="form-control" val=""> 
								<span class="input-group-btn">
									<button type="submit" class="btn btn-primary add-tooltip" id="place-search" data-original-title="Send">검색</button>
								</span>
							</div>
							<div class="panel">
									<div class="panel-body">

										<p class="text-main text-bold text-uppercase">위치 선택</p>
										

										<hr>

										<div class="form-horizontal">
											<div class="form-group">
												<div class="mar-all">
													<div class="media">
														<div class="media-left">
															<i class="icon-lg icon-fw demo-pli-map-marker-2"></i>
														</div>
														<div class="media-body">
															<address>
																<strong class="text-main"> 비트교육센터 </strong><br> 795
																Folsom Ave, Suite 600<br> San Francisco, CA 94107<br>
															</address>
														</div>
													</div>
												</div>
											</div>
											<br>

											<div class="form-group text-right" style="padding-left: 20px;">
												<!--Discard button-->
												<button id="discard-btn" type="submit" class="btn btn-primary">
													<i class="icon-lg icon-fw"></i> 선택
												</button>
											</div>
										</div>



									</div>
								</div>
						</div>
						
						<div class="fluid">
							<!-- Panel  Blog -->
							<!--===================================================-->
							<div class="panel">
								<div class="panel-body">
										<div class="row">
											<div class="col-sm-4">
												<div class="media pad-ver">
													<div class="media-left">
														<a href="#" class="box-inline"><img alt="Profile Picture" class="img-md img-circle" src="${pageContext.request.contextPath }/${authUser.logoPath }"></a>
													</div>
													<div class="media-body pad-top">
														<a href="#" class="box-inline"> <span class="text-lg text-semibold text-main">${authUser.userName }</span>
															<p class="text-sm">${authUser.email }</p>
														</a>
													</div>
												</div>
											</div>
										</div>


										<br>
										<!--Dropdowns Addons-->
										<!--===================================================-->
										<form class="form-horizontal">
											<div class="input-group mar-btm">
												<div class="input-group-btn dropdown"></div>
												<div class="input-group-btn dropdown"></div>

												<!-- <input type="text" placeholder="이름" class="form-control"> -->
											</div>
										</form>
										<!--===================================================-->
										<!--End Dropdowns Addons-->
										<input type="hidden" name="userNo" value="${authUser.userNo }">

										<!-- Bootstrap Select : primary -->
										<!--===================================================-->
										<div class="form-horizontal">
											<div class="input-group mar-btm">
												<!--  <div class="col-sm-6"> -->
												<div class="input-group-btn dropdown category">

													<!-- <select class="selectpicker " id="cate">
														<option>공지</option>
														<option>긴급</option>
													</select> -->
													<button data-toggle="dropdown" class="btn btn-primary dropdown-toggle category" type="button">
														커뮤니티 선택 <i class="dropdown-caret"></i>
													</button>

													<ul class="dropdown-menu" id="subjectList">
														<c:forEach items="${subjectList}" var="subjectList">
															<li data-value="${subjectList.subjectNo}"><a href="#">${subjectList.subjectTitle}</a></li>
														</c:forEach>
													</ul>

												</div>
												<input type="text" placeholder="제목" class="form-control " id="post-title">
											</div>
											<div>
												<input type="text" placeholder="내용" class="form-control" id="post-content" style="width: 100%; height: 300px; vertical-align: top;"> 
											</div>	
											<div class="bord-top pad-ver">
														<!--Dropzonejs-->
														<!--===================================================-->
														<div class="dropzone-container">
															<div id="dropzone">
																<div class="dz-default dz-message">
																	<div class="dz-icon">
																		<i class="demo-pli-upload-to-cloud icon-5x"></i>
																	</div>
																	<div>
																		<span class="dz-text">Drop files to upload</span>
																		<p class="text-sm text-muted">or click to pick
																			manually</p>
																	</div>
																</div>
																<!--
															<div class="fallback">
																<form action="#" method="post" enctype="multipart/form-data">
																	<input name="file" type="file" multiple>
																</form>
															</div>
															-->
															</div>
														</div>
														<!--===================================================-->
														<!-- End Dropzonejs -->

													</div>
													<button type="submit" class="btn btn-primary btn-block btn-lg">Submit</button>
											</div>
									</div>
								<!--===================================================-->
								</div>
						</div>
					</div>

				</div>
				<!--===================================================-->
                <!--End page content-->
                    	
                    	<!-- /////////////////////////////////////////////////////// -->
					    <!-- Contact Panel -->
					    <!---------------------------------->
					    <div class="panel">
					   
					    </div>
					    <!---------------------------------->
					
					
					    
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
	
	
	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>
	
	
   	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


   <!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!-- GMaps -->
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/gmaps.js"></script>
  
    <!--=================================================-->
    
    <script type="text/javascript">
    	var fileList = [];
    	
    	// DROPZONE.JS
		// =================================================================
		// Require Dropzone
		// http://www.dropzonejs.com/
		// =================================================================
		//파일 업로드 드래그 앤 드롭할때 
		$("#dropzone").dropzone({
			url: "${pageContext.request.contextPath }/${coursePath}/assignment/upload" , 
			success : function(file, fileVo){
						console.log(file);
						console.log(fileVo);
						fileList.push(fileVo);
						console.log(fileList);
						console.log(fileList.length);
				    }
		});
    </script>
 	
 	
 	<script type="text/javascript">
		$(document).on('nifty.ready', function() {
			
			var searched_address;
			var searched_lat;
			var searched_lng;
			
			var bit_lat = 37.4946083;
			var bit_lng = 127.0254167;
			
			var underground_lat = 37.4939368;
			var underground_lng = 127.0257359;
			// GMAPS
			// =================================================================
			// Require gmaps
			// -----------------------------------------------------------------
			// http://hpneo.github.io/gmaps/
			// =================================================================

			// Marker
			// =================================================================
			var markerMap = new GMaps({
				el : '#map',
				lat : 37.4946083,
				lng : 127.0254167,
				
				/*
				click: function(e) {
					alert('clicked');
				},
				dragend: function(e) {
					alert('dragend');
				}
				*/
			});
			
			//원하는 위치에 핀 추가 
			markerMap.addMarker({
				/* lat : 37.4946083,
				lng : 127.0254167, */
				lat : bit_lat,
				lng : bit_lng,
				title : 'Location',
				click : function(e) {
					$.niftyNoty({
						type : "info",
						icon : "fa fa-info",
						message : "You clicked in the marker",
						container : 'floating',
						timer : 3500
					});
				},
				infoWindow : {
					content : '<div>비트교육센터</div><div>lat: '+bit_lat+'</div><div>lng: '+bit_lng+'</div>'
				}
			});
			
			
			// 핀 찍기
			markerMap.setContextMenu({
				 control: 'map',
				 options: [{
				    title: 'Add marker',
				    name: 'add_marker',
				    action: function(e) {
				      this.addMarker({
				        lat: e.latLng.lat(),
				        lng: e.latLng.lng(),
				        title: 'New marker'
				      });
				    }
				  }, {
				    title: 'Center here',
				    name: 'center_here',
				    action: function(e) {
				      this.setCenter(e.latLng.lat(), e.latLng.lng());
				    }
				 }]
			});
		
			markerMap.addControl({
				position: 'top_right',
			    content: 'Geolocate',
			    style: {
				    margin: '5px',
				    padding: '1px 6px',
				    border: 'solid 1px #717B87',
				    background: '#fff'
				},
				events: {
				   click: function(){
			       console.log(this);
			    	}
				}
			});
			
			// 장소로 좌표 검색 
			$("#place-search").on("click",function(e){
		        e.preventDefault();
		        GMaps.geocode({
		            address: $('#place').val().trim(),
		            callback: function(results, status){
		                if(status=='OK'){
		                	console.log(results[0].formatted_address);
		                	console.log(results[1].formatted_address);
		                	console.log(results[2].formatted_address);
		                    var latlng = results[0].geometry.location;
		                    markerMap.setCenter(latlng.lat(), latlng.lng());
		                    markerMap.addMarker({
		                        lat: latlng.lat(),
		                        lng: latlng.lng()
		                    })
		                    searched_address = results[0].formatted_address;
		                    searched_lat = latlng.lat();
		                    searched_lng = latlng.lng();
		                }
		            }
		        })
		    })
		});
		
	</script>
	
	
</body>
</html>
