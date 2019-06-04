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

<title>File Manager | Nifty - Admin Template</title>


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


<!--Dropzone [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.css" rel="stylesheet">

<!--Chosen [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/css/chosen.css" rel="stylesheet">


<!--JSTree [ OPTIONAL ]-->
<link href="${pageContext.request.contextPath }/assets/plugins/jstree/themes/default/style.css" rel="stylesheet">


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
						<h1 class="page-header text-overflow">나의 자료실</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#"> 자료실 </a></li>
						<li class="active">나의 자료실</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>



				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">

					<div class="panel">
						<div class="pad-all file-manager">
							<div class="fixed-fluid">
								<div class="fixed-sm-200 pull-sm-left file-sidebar">
									<div class="bord-btm pad-btm">
										<button data-target="#demo-lg-modal" data-toggle="modal" class="btn btn-warning">UPLOAD</button>
									</div>

									<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Folders</p>
									<div class="list-group bg-trans pad-btm bord-btm">
										<div id="demo-jstree-1">
											<ul>
												<li class="jstree-open">사용자 폴더
													<ul>
														<li class="jstree-open">프로그램
															<ul>
																<li class="jstree-open">basic
																	<ul>
																		<li>index</li>
																	</ul>
																</li>
															</ul>
														</li>
														<li>강의자료
															<ul>
																<li class="jstree-open">java</li>
															</ul>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>


									<p class="pad-hor mar-top text-main text-bold text-sm text-uppercase">Tags</p>
									<ul class="list-inline mar-hor">
										<li class="tag tag-sm"><a href="#">Family</a></li>
										<li class="tag tag-sm"><a href="#">Home</a></li>
										<li class="tag tag-sm"><a href="#">Work</a></li>
										<li class="tag tag-sm"><a href="#">Film</a></li>
										<li class="tag tag-sm"><a href="#">Music</a></li>
										<li class="tag tag-sm"><a href="#">Videos</a></li>
									</ul>
								</div>
								<div class="fluid file-panel">
									<div class="bord-btm pad-ver">
										<ol class="breadcrumb">
											<li><a href="#">Home</a></li>
											<li><a href="#">App Views</a></li>
											<li class="active">File Manager</li>
										</ol>
									</div>
									<div class="file-toolbar bord-btm">
										<div class="btn-file-toolbar">
											<a class="btn btn-icon add-tooltip" href="#" data-original-title="Home" data-toggle="tooltip"> <i class="icon-2x demo-pli-home"></i>
											</a> <a class="btn btn-icon add-tooltip" href="#" data-original-title="Refresh" data-toggle="tooltip"> <i class="icon-2x demo-pli-reload-3"></i>
											</a>
										</div>
										<div class="btn-file-toolbar">
											<a class="btn btn-icon add-tooltip" href="#" data-original-title="New Folder" data-toggle="tooltip"> <i class="icon-2x demo-pli-folder"></i>
											</a> <a class="btn btn-icon add-tooltip" href="#" data-original-title="New File" data-toggle="tooltip"> <i class="icon-2x demo-pli-file-add"></i>
											</a> <a class="btn btn-icon add-tooltip" href="#" data-original-title="Edit File" data-toggle="tooltip"> <i class="icon-2x demo-pli-file-edit"></i>
											</a>
										</div>
										<div class="btn-file-toolbar pull-right">
											<a class="btn btn-icon add-tooltip" href="#" data-original-title="Delete" data-toggle="tooltip"> <i class="icon-2x demo-pli-recycling"></i>
											</a> <a class="btn btn-icon add-tooltip" href="#" data-original-title="Download" data-toggle="tooltip"> <i class="icon-2x demo-pli-download-from-cloud"></i>
											</a>
										</div>
									</div>
									<ul id="demo-mail-list" class="file-list">
										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-1" class="magic-checkbox" type="checkbox"> <label for="file-list-1"></label>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-psi-folder"></i>
													</div>
													<div class="media-body">
														<p class="file-name single-line">...</p>
													</div>
												</div>
										</a>
										</li>

										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-2" class="magic-checkbox" type="checkbox"> <label for="file-list-2"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-psi-folder"></i>
													</div>
													<div class="media-body">
														<p class="file-name">Photos</p>
														<small>Created Yesterday | 22 MB</small>
													</div>
												</div>
										</a>
										</li>


										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-3" class="magic-checkbox" type="checkbox"> <label for="file-list-3"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-psi-folder-zip text-success"></i>
													</div>
													<div class="media-body">
														<p class="file-name">Package.zip</p>
														<small>Created 3 weeks ago | 125 MB</small>
													</div>
												</div>
										</a>
										</li>


										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-4" class="magic-checkbox" type="checkbox"> <label for="file-list-4"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-psi-file-html text-info"></i>
													</div>
													<div class="media-body">
														<p class="file-name">index.html</p>
														<small>Created 3 weeks ago | 265 KB</small>
													</div>
												</div>
										</a>
										</li>

										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-5" class="magic-checkbox" type="checkbox"> <label for="file-list-5"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-pli-file-txt"></i>
													</div>
													<div class="media-body">
														<p class="file-name">robots.txt</p>
														<small>Created 3 weeks ago | 17 KB</small>
													</div>
												</div>
										</a>
										</li>


										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-6" class="magic-checkbox" type="checkbox"> <label for="file-list-6"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-pli-video"></i>
													</div>
													<div class="media-body">
														<p class="file-name">Highland.mp4</p>
														<small>Created 3 weeks ago | 540 MB</small>
													</div>
												</div>
										</a>
										</li>


										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-7" class="magic-checkbox" type="checkbox"> <label for="file-list-7"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-pli-file"></i>
													</div>
													<div class="media-body">
														<p class="file-name">License</p>
														<small>Created 3 weeks ago | 2 KB</small>
													</div>
												</div>
										</a>
										</li>


										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-8" class="magic-checkbox" type="checkbox"> <label for="file-list-8"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-pli-file-word"></i>
													</div>
													<div class="media-body">
														<p class="file-name">Company Overview.doc</p>
														<small>Created 3 weeks ago | 2 KB</small>
													</div>
												</div>
										</a>
										</li>


										<!--File list item-->
										<li>
											<div class="file-control">
												<input id="file-list-9" class="magic-checkbox" type="checkbox"> <label for="file-list-9"></label>
											</div>
											<div class="file-settings">
												<a href="#"> <i class="pci-ver-dots"></i>
												</a>
											</div>
											<div class="file-attach-icon"></div> <a href="#" class="file-details">
												<div class="media-block">
													<div class="media-left">
														<i class="demo-pli-file-jpg"></i>
													</div>
													<div class="media-body">
														<p class="file-name">Nature.jpg</p>
														<small>Created 3 weeks ago | 56 KB</small>
													</div>
												</div>
										</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!--===================================================-->
				<!--End page content-->

			</div>
			<!--===================================================-->
			<!--END CONTENT CONTAINER-->



			<!-- SCROLL PAGE BUTTON -->
			<!--===================================================-->
			<button class="scroll-top btn">
				<i class="pci-chevron chevron-up"></i>
			</button>
			<!--===================================================-->
		</div>


		<!--Large Bootstrap Modal-->
		<!--===================================================-->
		<div id="demo-lg-modal" class="modal fade" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<i class="pci-cross pci-circle"></i>
						</button>
						<h4 class="modal-title" id="myLargeModalLabel">Large modal</h4>
					</div>
					<div class="modal-body">


						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">DropzoneJs</h3>
							</div>
							<div class="panel-body">
								<p class="text-main text-bold mar-no">Drag’n’drop file uploads</p>
								<p>DropzoneJs provides drag’n’drop file uploads with image previews.</p>
								<!-- Multiple Select Choosen
							 		태크, 코스, 파일 개별적으로 저장 -->
								<!--===================================================-->
								<select id="demo-cs-multiselect" data-placeholder="Choose a Course..." multiple tabindex="4">
									<option value="United States">Java</option>
									<option value="United Kingdom">C++</option>
									<option value="Afghanistan">C</option>
									<option value="Aland Islands">Ajax</option>
									<option value="Albania">What</option>
								</select>
								<!--===================================================-->

								<br> <br> <br> <br>


								<!--Dropzonejs-->
								<!--===================================================-->
								<form id="demo-dropzone" action="#" class="dropzone">
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
									<div class="bord-btm pad-btm">
										<button data-target="#demo-lg-modal" data-toggle="modal" class="btn tbn-default">UPLOAD</button>
									</div>
								</form>
								<!--===================================================-->
								<!-- End Dropzonejs -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--===================================================-->
		<!--End Large Bootstrap Modal-->


		<!--===================================================-->
		<!-- END OF CONTAINER -->


		<!-- /content -->
		<!--===================================================-->

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


		<!--===================================================-->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->



	</div>





	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>




	<!--=================================================-->
	<!--Dropzone [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/dropzone/dropzone.js"></script>



	<!--Chosen [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/js/chosen.jquery.js"></script>



	<!--JSTree [ OPTIONAL ]-->
	<script src="${pageContext.request.contextPath }/assets/plugins/jstree/jstree.js"></script>


	<script type="text/javascript">
		$(document).on('nifty.ready',function() {

							// CHOSEN
							// =================================================================
							// Require Chosen
							// http://harvesthq.github.io/chosen/
							// =================================================================
							$('#demo-chosen-select').chosen();
							$('#demo-cs-multiselect').chosen({width : '100%'});

							// DROPZONE.JS
							// =================================================================
							// Require Dropzone
							// http://www.dropzonejs.com/
							// =================================================================
							Dropzone.options.demoDropzone = { // The camelized version of the ID of the form element
								// The configuration we've talked about above
								autoProcessQueue : false,
								//uploadMultiple: true,
								//parallelUploads: 25,
								//maxFiles: 25,

								// The setting up of the dropzone
								init : function() {
									var myDropzone = this;
									//  Here's the change from enyo's tutorial...
									//  $("#submit-all").click(function (e) {
									//  e.preventDefault();
									//  e.stopPropagation();
									//  myDropzone.processQueue();
									//
									//}
									//    );
								}

							}

							// DROPZONE.JS WITH BOOTSTRAP'S THEME
							// =================================================================
							// Require Dropzone
							// http://www.dropzonejs.com/
							// =================================================================
							// Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
							var previewNode = document.querySelector("#dz-template");
							previewNode.id = "";
							var previewTemplate = previewNode.parentNode.innerHTML;
							previewNode.parentNode.removeChild(previewNode);

							var uplodaBtn = $('#dz-upload-btn');
							var removeBtn = $('#dz-remove-btn');
							var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
								url : "/target-url", // Set the url
								thumbnailWidth : 50,
								thumbnailHeight : 50,
								parallelUploads : 20,
								previewTemplate : previewTemplate,
								autoQueue : false, // Make sure the files aren't queued until manually added
								previewsContainer : "#dz-previews", // Define the container to display the previews
								clickable : ".fileinput-button" // Define the element that should be used as click trigger to select files.
							});

							myDropzone.on("addedfile", function(file) {
								// Hookup the button
								uplodaBtn.prop('disabled', false);
								removeBtn.prop('disabled', false);
							});

							// Update the total progress bar
							myDropzone.on("totaluploadprogress", function(
									progress) {
								$("#dz-total-progress .progress-bar").css({
									'width' : progress + "%"
								});
							});

							myDropzone.on(
											"sending",
											function(file) {
												// Show the total progress bar when upload starts
												document.querySelector("#dz-total-progress").style.opacity = "1";
											});

							// Hide the total progress bar when nothing's uploading anymore
							myDropzone.on(
											"queuecomplete",
											function(progress) {
												document.querySelector("#dz-total-progress").style.opacity = "0";
											});

							// Setup the buttons for all transfers
							uplodaBtn.on('click', function() {
								//Upload all files
								//myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
							});

							removeBtn.on('click', function() {
								myDropzone.removeAllFiles(true);
								uplodaBtn.prop('disabled', true);
								removeBtn.prop('disabled', true);
							});
						});

		// Custom Icon - Premium Solid Icons
		// =================================================================
		// Require JSTree & Premium Icons
		// =================================================================
		$('#demo-jstree-1').jstree({
			'core' : {
				'check_callback' : true
			},
			'plugins' : [ 'types', 'dnd' ],
			'types' : {
				'default' : {
					'icon' : 'demo-pli-folder'
				},
				'html' : {
					'icon' : 'demo-pli-file-html'
				},
				'file' : {
					'icon' : 'demo-pli-file'
				},
				'jpg' : {
					'icon' : 'demo-pli-file-jpg'
				},
				'zip' : {
					'icon' : 'demo-pli-file-zip'
				}
			}
		});

		// Custom Icon - Premium Solid Icons
		// =================================================================
		// Require JSTree & Premium Icons
		// =================================================================
		$('#demo-jstree-2').jstree({
			'core' : {
				'check_callback' : true
			},
			'plugins' : [ 'types', 'dnd' ],
			'types' : {
				'default' : {
					'icon' : 'demo-psi-folder'
				},
				'html' : {
					'icon' : 'demo-psi-file-html'
				},
				'file' : {
					'icon' : 'demo-psi-file'
				},
				'jpg' : {
					'icon' : 'demo-psi-file-jpg'
				},
				'zip' : {
					'icon' : 'demo-psi-file-zip'
				}
			}
		});

		// Custom Icon - Font Awesome
		// =================================================================
		// Require JSTree & Font Awesome
		// =================================================================
		$('#demo-jstree-3').jstree({
			'core' : {
				'check_callback' : true
			},
			'plugins' : [ 'types', 'dnd' ],
			'types' : {
				'default' : {
					'icon' : 'fa fa-folder-o'
				},
				'html' : {
					'icon' : 'fa fa-file-text-o'
				},
				'file' : {
					'icon' : 'fa fa-file-text-o'
				},
				'jpg' : {
					'icon' : 'fa fa-file-image-o'
				},
				'zip' : {
					'icon' : 'fa fa-file-zip-o'
				}
			}
		});

		// JSON Example
		// =================================================================
		// Require JSTree
		// =================================================================
		$('#demo-jstree-json').jstree({
			'core' : {
				'data' : [ 'Empty Folder', {
					'text' : 'demo',
					'state' : {
						'opened' : true
					},
					'children' : [ {
						'text' : 'basic',
						'state' : {
							'opened' : true
						},
						'children' : [ {
							'text' : 'index.html',
							'icon' : 'jstree-file'
						}, {
							'text' : 'root.json',
							'icon' : 'jstree-file'
						} ]
					}, {
						'text' : 'Readme.md',
						'icon' : 'jstree-file'
					} ]
				}, {
					'text' : 'dist',
					'state' : {
						'opened' : true
					},
					'children' : [ {
						'text' : 'themes',
						'state' : {
							'opened' : true
						},
						'children' : [ {
							'text' : 'default',
							'state' : {
								'opened' : true
							},
							'children' : [ {
								'text' : '32px.png',
								'icon' : 'jstree-file'
							}, {
								'text' : '40px.png',
								'icon' : 'jstree-file'
							}, {
								'text' : 'style.css',
								'icon' : 'jstree-file'
							}, {
								'text' : 'style.min.css',
								'icon' : 'jstree-file'
							} ]
						}, {
							'text' : 'default-dark',
							'children' : [ {
								'text' : '32px.png',
								'icon' : 'jstree-file'
							}, {
								'text' : '40px.png',
								'icon' : 'jstree-file'
							}, {
								'text' : 'style.css',
								'icon' : 'jstree-file'
							}, {
								'text' : 'style.min.css',
								'icon' : 'jstree-file'
							} ]
						} ]
					}, {
						'text' : 'jstree.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.min.js',
						'icon' : 'jstree-file'
					}, ]
				}, {
					'text' : 'src',
					'state' : {
						'opened' : true
					},
					'children' : [ {
						'text' : 'intro.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.changed.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.checkbox.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.conditionalselect.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.contextmenu.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.dnd.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.massload.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.search.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.sort.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.state.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.types.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.unique.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'jstree.wholerow.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'misc.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'outro.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'sample.js',
						'icon' : 'jstree-file'
					}, {
						'text' : 'themes',
						'icon' : 'jstree-file'
					}, {
						'text' : 'vakata-jstree.js',
						'icon' : 'jstree-file'
					} ]
				}, 'unit', 'visual', {
					'text' : 'package.zip',
					'icon' : 'jstree-file'
				} ]
			}
		});
	</script>



</body>
</html>
