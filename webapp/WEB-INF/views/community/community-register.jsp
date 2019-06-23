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
				<div id="page-head"></div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="fixed-fluid">
						<!-- map -->
						<div class="fixed-sm-350 pull-sm-right">
							<div id="map"></div>
							<div class="input-group pad-all bord-btm">
								<input type="text" id="place" placeholder="장소 검색"
									class="form-control" val=""> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-primary add-tooltip"
										id="place-search" data-original-title="Send">검색</button>
								</span>
							</div>
							<div class="panel">
								<div class="panel-body">

									<p class="text-main text-bold text-uppercase">위치 선택</p>
									<hr>
									<div id="select-place">
										<div style="opacity: 0.5">위치를 선택해주세요.</div>
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
													<a href="#" class="box-inline"><img
														alt="Profile Picture" class="img-md img-circle"
														src="${pageContext.request.contextPath }/${authUser.logoPath }"></a>
												</div>
												<div class="media-body pad-top">
													<a href="#" class="box-inline"> <span
														class="text-lg text-semibold text-main">${authUser.userName }</span>
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
													<li data-cposttype="1" id="restaurant"><a href="#">맛집</a></li>
													<li data-cposttype="2" id="cafe"><a href="#">카페</a></li>
												</ul>

											</div>
											<input type="text" placeholder="제목" class="form-control " id="post-title">
										</div>
										<div id="post-address">
											
										</div>
										<div>
											<input type="text" placeholder="내용" class="form-control" id="post-content" style="width: 100%; height: 300px; vertical-align: top;">
										</div>
										<div class="bord-top pad-ver">
											<!--Dropzonejs-->
											<!--===================================================-->

											<div id="dropzone" class="dropzone ">
												<div class="dz-default dz-message">
													<div class="dz-icon">
														<i class="demo-pli-upload-to-cloud icon-5x"></i>
													</div>
													<div>
														<span class="dz-text">Drop files to upload</span>
														<p class="text-sm text-muted">or click to pick manually</p>
													</div>
												</div>
												<div class="fallback">
													<input name="file" type="file" multiple>
												</div>
											</div>
											<!--===================================================-->
											<!-- End Dropzonejs -->

										</div>
										<button type="submit" class="btn btn-primary btn-block btn-lg" id="register-post">Submit</button>
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
				<div class="panel"></div>
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
		<c:import url="/WEB-INF/views/includes/otherNavigation.jsp"></c:import>
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


	<!--jQuery [ REQUIRED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--Dropzone [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>





	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>

	<!-- GMaps -->
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyBSFRN6WWGYwmFi498qXXsD2UwkbmD74v4&libraries=places"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/gmaps.js"></script>

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
	</script>


	<script type="text/javascript">
			
					$(document).on('nifty.ready', function() {
							var bit_lat = 37.4946083;
							var bit_lng = 127.0254167;

							var searched_address;
							var searched_lat;
							var searched_lng;

							// GMAPS
							// =================================================================
							// Require gmaps
							// -----------------------------------------------------------------
							// http://hpneo.github.io/gmaps/
							// =================================================================

							// Marker
							// =================================================================

							var geocoder = new google.maps.Geocoder;

							var markerMap = new GMaps({
									el : '#map',
									lat : 37.4946083,
									lng : 127.0254167,

									click : function(e) {
										//alert('clicked');
										var clicked_lat = e.latLng.lat();
										var clicked_lng = e.latLng.lng();
			
										markerMap.addMarker({
											lat : clicked_lat,
											lng : clicked_lng,
											title : 'Location',
											click : function(e) {
												$.niftyNoty({
													type : "info",
													icon : "fa fa-info",
													message : "You clicked in the marker",
													container : 'floating',
													timer : 3500
												});
											geocodeLatLng(geocoder, clicked_lat, clicked_lng, markerMap);
											},
											infoWindow : {
														content : '<div>비트교육센터</div><div>lat: '+ clicked_lat+ '</div><div>lng: '+ clicked_lng+ '</div>'
													}
										});
									}
							});
							
							var service = new google.maps.places.PlacesService(
									markerMap);

							markerMap.addMarker({
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
									content : '<div>비트교육센터</div><div>lat: '
											+ bit_lat + '</div><div>lng: '
											+ bit_lng + '</div>'
								}
							});

							// 핀 찍기
							markerMap.setContextMenu({
								control : 'map',
								options : [
										{
											title : 'Add marker',
											name : 'add_marker',
											action : function(e) {
												this.addMarker({
													lat : e.latLng.lat(),
													lng : e.latLng.lng(),
													title : 'New marker'
												});
											}
										},
										{
											title : 'Center here',
											name : 'center_here',
											action : function(e) {
												this.setCenter(e.latLng.lat(),
														e.latLng.lng());
											}
										} ]
							});

							markerMap.addControl({
								position : 'top_right',
								content : 'Geolocate',
								style : {
									margin : '5px',
									padding : '1px 6px',
									border : 'solid 1px #717B87',
									background : '#fff'
								},
								events : {
									click : function() {
										console.log(this);
									}
								}
							});

							/*
							$("#map").on("click",function(){
								GMaps.geolocate({
									  success: function(position) {
									    map.setCenter(position.coords.latitude, position.coords.longitude);
									  },
									  error: function(error) {
									    alert('Geolocation failed: '+error.message);
									  },
									  not_supported: function() {
									    alert("Your browser does not support geolocation");
									  },
									  always: function() {
									    alert("Done!");
									  }
									});
							})
							 */

							// 장소로 좌표 검색 
							$("#place-search").on("click", function(e) {
									e.preventDefault();
									searchPlace('Museum of Contemporary Art Australia', markerMap, service);
									GMaps.geocode({
										address : $('#place').val().trim(),
										callback : function(results, status) {
											if (status == 'OK') {
												var latlng = results[0].geometry.location;
												markerMap.setCenter(latlng.lat(), latlng.lng());
												markerMap.addMarker({
													lat : latlng.lat(),
													lng : latlng.lng(),
													click : function(e) {
														renderingAddress($('#place').val().trim(), results[0].formatted_address, latlng.lat(), latlng.lng());
													},
													infoWindow : {
														content : '<div>'+ results[0].formatted_address + '</div><div>lat: ' 
																	+ latlng.lat() + '</div><div>lng: ' + latlng.lng() + '</div>'
													}
												})
												searched_address = results[0].formatted_address;
												searched_lat = latlng.lat();
												searched_lng = latlng.lng();
												console.log(searched_address);
																	// findBusinessName('Museum of Contemporary Art Australia', service);

																	/*
																	//var xhr = $.getJSON('https://coffeemaker.herokuapp.com/facebook.json?q[near]=seoul,%20PE&q[query]=food');
																	var xhr = $.getJSON('https://www.mangoplate.com/search.jsonp?input="강남역"');
																	
																	
																	
																	console.log(xhr);
																	//console.log(xhr.responseJSON.responseText);
																	console.log("=============================");
																	xhr.done(printResults);
																	console.log("=============================");
																	
																	console.log(typeof(xhr));
																	console.log(xhr.responseText);
																	//console.log(xhr.responseJSON.responseText);
																	console.log(xhr.getAllResponseHeaders());
																	console.log(xhr.getResponseHeader());
																	console.log(xhr.venues);
																	 */

											}
										}
									})
							});

					});
		
		
		$("document").ready(function(){
			console.log("-------------------load community category-------------------");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/community/loadCategory",
				type: "post",
				contentType : "application/json",

				dataType : "json",
				success : function(communityvo) {
					for(var i=0; i<communityvo.length; i++)
						console.log(communityvo[i].categoryName);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		})
		
		$(".category .dropdown-menu li a").click(function() {
			console.log("-------------------select category-----------------");
			$(".category .btn:first-child").text($(this).text());
			$(".category .btn:first-child").val($(this).text());

		});
		
		$("#page-content").on("click", "#select-address-btn", function(){
			console.log("-------------------select address-------------------")
			
			var address = $("#address").text();
			var businessName = $("#businessName").text();
			var latitude = $("#latitude").data("lat");
			var longitude = $("#longitude").data("lng");

			$("#post-address").empty();
			
			str = '';
			str += '<input type="hidden" class="form-control" name="latitude" value="'+latitude+'">';
			str += '<input type="hidden" class="form-control" name="longitude" value="'+longitude+'">';
			str += '<input type="hidden" class="form-control" name="businessName" value="'+businessName+'">';
			str += '<input type="text" class="form-control" name="address" value="'+address+'" placeholder="'+address+'"><br/>';
			
			$("#post-address").append(str);
		
		});
		
		$("#register-post").on("click", function(){
			console.log("-------------------register post-------------------");
			
			var category = $(".category .btn:first-child").val();
			var postType;
			
			if(category == 1) 
				postType = 1;
			else 
				postType = 2;
			
			var communityvo = {
					cpostTitle: $("#post-title").val(),
					cpostContent: $("#post-content").val(),
					cpostType: postType,
					address: $("#post-address").children("[name=address]").val(),
					businessName: $("#post-address").children("[name=businessName]").val(),
					latitude: $("#post-address").children("[name=latitude]").val(),
					longitude: $("#post-address").children("[name=longitude]").val(),
					fileList: fileList
			}

			console.log(communityvo);
			
			if(communityvo.cpostTitle == "" || communityvo.address == null){
				alert("제목과 주소 선택은 필수 요소입니다!");
			}else{
				$.ajax({
					url : "${pageContext.request.contextPath}/community/register",
					type: "post",
					contentType : "application/json",
					data: JSON.stringify(communityvo),
				
					dataType : "json",
					success : function(result) {
						if(result == 1){
							$(location).attr("href", "${pageContext.request.contextPath}/community/mainform");
						}else{
							alert("게시글을 등록하지 못하였습니다.");
							$(location).attr("href", "${pageContext.request.contextPath}/community/regform");
						}
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				})
			}
			
		})
		
		function searchPlace(input_query, input_map, input_service){
			var request = {
					query: input_query,
					fields: ['name', 'geometry']
			};
			
			service = input_service;
			
			service.findPlaceFromQuery(request, function(results, status){
				  if(status === google.maps.places.PlacesServiceStatus.OK) {
		            for (var i = 0; i < results.length; i++) {
		              console.log(results[i]);
		            }

		            input_map.setCenter(results[0].geometry.location);
		          }
			})
		}
		
		function printResults(data) {
			console.log("=============================");
			console.log("printResults()");
			console.log(data.venues.length);
			console.log(data.venues[1].name);
			console.log("=============================");
		}

		google.maps.event.addListener(map, 'click', codeCoordinate);

		function codeCoordinate(event) {
			//Setmarker(event.latLng);
			//이벤트 발생 시 그 좌표에 마커를 생성합니다.
			// 좌표를 받아 reverse geocoding(좌표를 주소로 바꾸기)를 실행합니다.
			GMaps.geocode({
				'latLng' : event.latLng
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[1]) {
						infowindow.setContent(results[1].formatted_address);
						infowindow.open(map, marker[0]); //infowindow로 주소를 표시합니다.
					}
				}
			});
		}

		function loadResults(data) {
			var items, markers_data = [];
			if (data.venues.length > 0) {
				items = data.venues;

				for (var i = 0; i < items.length; i++) {
					var item = items[i];

					if (item.location.lat != undefined
							&& item.location.lng != undefined) {
						var icon = 'https://foursquare.com/img/categories/food/default.png';

						markers_data.push({
							lat : item.location.lat,
							lng : item.location.lng,
							title : item.name,
							icon : {
								size : new google.maps.Size(32, 32),
								url : icon
							}
						});
					}
				}
			}

			map.addMarkers(markers_data);
		}

		function geocodeLatLng(geocoder, input_lat, input_lng, map) {
			var latlng = {
				lat : input_lat,
				lng : input_lng
			};
			geocoder.geocode({
				'location' : latlng
			}, function(results, status) {
				if (status === 'OK') {
					if (results[0]) {
						//map.setZoom(6);
						var marker = new google.maps.Marker({
							position : latlng,
							map : map
						});
						console.log("place id: " + results[0].place_id);
						console.log("new address: " + results[0].formatted_address);
						//infowindow.setContent(results[0].formatted_address);
						//infowindow.open(map, marker);
					} else {
						window.alert('No results found');
					}
				} else {
					window.alert('Geocoder failed due to: ' + status);
				}
			});
		}

		function findBusinessName(input_query, service) {
			var request = {
				query : input_query,
				fields : [ 'name', 'geometry' ],
			};

			service.findPlaceFromQuery(request, function(results, status) {
				if (status === google.maps.places.PlacesServiceStatus.OK) {
					for (var i = 0; i < results.length; i++) {
						//createMarker(results[i]);
						console.log("제발: " + results[i]);
					}

					// map.setCenter(results[0].geometry.location);
				}
			});
		}

		function renderingAddress(businessName, address, lat, lng) {
			$("#select-place").empty();

			str = '';
			str += '<div class="form-horizontal">';
			str += '	<div class="form-group">';
			str += '		<div class="mar-all">';
			str += '			<div class="media">';
			str += '				<div class="media-left"><i class="icon-lg icon-fw demo-pli-map-marker-2"></i></div>';
			str += '				<div class="media-body">'
			str += '					<address id="select-place">';
			str += '						<strong class="text-main" id="businessName" > ' + businessName + ' </strong><br>';
			str += '						<div id="address">' + address + '</div>'
			str += '						<div id="latlng">'
			str += '							<span id="latitude" data-lat="'+lat+'">(위도: '+lat+'</span>'
			str += '							<span id="longitude" data-lng="'+lng+'">, 경도:'+lng+')</span>'
			str += '						</div>'
			str += '					</address>';
			str += '				</div>'
			str += '			</div>'
			str += '		</div>'
			str += '	</div><br/>'
			str += '	<div class="form-group text-right" style="padding-left: 20px;">';
			str += '		<button id="select-address-btn" type="submit" class="btn btn-primary"><i class="icon-lg icon-fw"></i> 선택';
			str += '		</button>';
			str += '	</div>'
			str += '</div>'

			$("#select-place").append(str);

		}
	</script>


</body>
</html>
