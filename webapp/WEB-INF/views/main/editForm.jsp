<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

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


<!--Bootstrap Validator [ OPTIONAL ]-->
<link
	href="${pageContext.request.contextPath }/assets/plugins/bootstrap-validator/bootstrapValidator.min.css"
	rel="stylesheet">


<!--=================================================
    REQUIRED
    You must include this in your project.
    RECOMMENDED
    This category must be included but you may modify which plugins or components which should be included in your project.
    OPTIONAL
    Optional plugins. You may choose whether to include it in your project or not.
    DEMONSTRATION
    This is to be removed, used for demonstration purposes only. This category must not be included in your project.
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

		<div class="box">
			<div id="container">
				<div id="content-container">
					<div id="page-head">

						<hr class="new-section-sm bord-no">
						<!-- Simple Toolbar -->
						<!---------------------------------->
						<div class="text-center pad-btm">
							<h3>My page</h3>
							<p>Where there is a will there is a way.</p>
						</div>
						<hr class="new-section-sm bord-no">
						<!---------------------------------->
					</div>

					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<!--Page content-->
							<!--===================================================-->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">개인정보 수정</h3>
								</div>

								<form id="demo-bvd-notempty"  action="${pageContext.request.contextPath }/myPage/updateUser" method="post" class="form-horizontal">
									<div class="panel-body">
										<p class="bord-btm pad-ver text-main text-bold">개인정보 변경</p>
										<input type="text" class="form-control" name="userno"  value="${authUser.userNo}">
										<!--NOT EMPTY VALIDATOR-->
										<!--===================================================-->
										<fieldset>
											<div class="form-group">
												<label class="col-lg-3 control-label">Username</label>
												<div class="col-lg-7">
													<input type="text" class="form-control" name="username"
														placeholder="username" value="${authUser.userName }">
												</div>
											</div>
											
										</fieldset>
										<!--===================================================-->

										<br>
										<!--IDENTICAL VALIDATOR-->
										<!--===================================================-->

										<!--===================================================-->
										<br> <br>
										<!--===================================================-->
										<fieldset>
											<div class="form-group">
												<label class="col-lg-3 control-label">Password</label>
												<div class="col-lg-7">
													<input type="password" class="form-control" name="password"
														placeholder="Password">
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">Retype
													password</label>
												<div class="col-lg-7">
													<input type="password" class="form-control"
														name="confirmPassword" placeholder="Retype password">
												</div>
											</div>
										</fieldset>
									</div>
									<div class="panel-footer">
										<div class="row">
											<div class="col-sm-7 col-sm-offset-3">
												<button class="btn btn-mint" type="submit">Submit</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>


				</div>
			</div>
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
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!--===================================================-->
		<!-- END FOOTER -->
	</div>





	<!--JAVASCRIPT-->
	<!--=================================================-->

	<!--jQuery [ REQUIRED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>


	<!--BootstrapJS [ RECOMMENDED ]-->
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="${pageContext.request.contextPath }/assets/js/nifty.js"></script>


	<!--Bootstrap Validator [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/bootstrap-validator/bootstrapValidator.min.js"></script>


	<!--Masked Input [ OPTIONAL ]-->
	<script
		src="${pageContext.request.contextPath }/assets/plugins/masked-input/jquery.maskedinput.min.js"></script>




	<script type="text/javascript">
		// Form-Validation.js
		// ====================================================================
		// This file should not be included in your project.
		// This is just a sample how to initialize plugins or components.
		//
		// - ThemeOn.net -

		$(document).on('nifty.ready',function() {
							var faIcon = {
								valid : 'fa fa-check-circle fa-lg text-success',
								invalid : 'fa fa-times-circle fa-lg',
								validating : 'fa fa-refresh'
							}

							// FORM VARIOUS VALIDATION
							// =================================================================
							$('#demo-bvd-notempty')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : faIcon,
												fields : {
													username : {
														message : 'The username is not valid',
														validators : {
															notEmpty : {
																message : 'The username is required.'
															}
														}
													},
													acceptTerms : {
														validators : {
															notEmpty : {
																message : 'You have to accept the terms and policies'
															}
														}
													},
													password : {
														validators : {
															notEmpty : {
																message : 'The password is required and can\'t be empty'
															},
															identical : {
																field : 'confirmPassword',
																message : 'The password and its confirm are not the same'
															}
														}
													},
													confirmPassword : {
														validators : {
															notEmpty : {
																message : 'The confirm password is required and can\'t be empty'
															},
															identical : {
																field : 'password',
																message : 'The password and its confirm are not the same'
															}
														}
													},
													member : {
														validators : {
															notEmpty : {
																message : 'The gender is required'
															}
														}
													},
													'programs[]' : {
														validators : {
															choice : {
																min : 2,
																max : 4,
																message : 'Please choose 2 - 4 programming languages you are good at'
															}
														}
													},
													integer : {
														validators : {
															notEmpty : {
																message : 'The number is required and can\'t be empty'
															},
															integer : {
																message : 'The value is not a number'
															}
														}
													},
													numeric : {
														validators : {
															notEmpty : {
																message : 'The number is required and can\'t be empty'
															},
															numeric : {
																message : 'The value is not a number'
															}
														}
													},
													greaterthan : {
														validators : {
															notEmpty : {
																message : 'The number is required and can\'t be empty'
															},
															greaterThan : {
																inclusive : false,
																//If true, the input value must be greater than or equal to the comparison one.
																//If false, the input value must be greater than the comparison one
																value : 50,
																message : 'Please enter a value greater than 50'
															}
														}
													},
													lessthan : {
														validators : {
															notEmpty : {
																message : 'The number is required and can\'t be empty'
															},
															lessThan : {
																inclusive : false,
																//If true, the input value must be less than or equal to the comparison one.
																//If false, the input value must be less than the comparison one
																value : 25,
																message : 'Please enter a value less than 25'
															}
														}
													},
													range : {
														validators : {
															inclusive : true,
															notEmpty : {
																message : 'The number is required and can\'t be empty'
															},
															between : {
																min : 1,
																max : 100,
																message : 'Please enter a number between 1 and 100'
															}
														}
													},
													uppercase : {
														validators : {
															notEmpty : {
																message : 'The card holder is required and can\'t be empty'
															},
															// Since case is a Javascript keyword,
															// you should place it between quotes (like 'case' or "case")
															// to make it work in all browsers
															stringCase : {
																message : 'The card holder must be in uppercase',
																'case' : 'upper'
															}
														}
													},
													email : {
														validators : {
															notEmpty : {
																message : 'The email address is required and can\'t be empty'
															},
															emailAddress : {
																message : 'The input is not a valid email address'
															}
														}
													},
													website : {
														validators : {
															notEmpty : {
																message : 'The website address is required and can\'t be empty'
															},
															uri : {
																allowLocal : false,
																message : 'The input is not a valid URL'
															}
														}
													},
													color : {
														validators : {
															notEmpty : {
																message : 'The hex color is required and can\'t be empty'
															},
															hexColor : {
																message : 'The input is not a valid hex color'
															}
														}
													}
												}
											})
									.on(
											'success.field.bv',
											function(e, data) {
												// $(e.target)  --> The field element
												// data.bv      --> The BootstrapValidator instance
												// data.field   --> The field name
												// data.element --> The field element
												var $parent = data.element
														.parents('.form-group');
												// Remove the has-success class
												$parent.removeClass('has-success');
											});

							// MASKED INPUT
							// =================================================================
							// Require Masked Input
							// http://digitalbush.com/projects/masked-input-plugin/
							// =================================================================
							// Initialize Masked Inputs
							// a - Represents an alpha character (A-Z,a-z)
							// 9 - Represents a numeric character (0-9)
							// * - Represents an alphanumeric character (A-Z,a-z,0-9)
							$('#demo-msk-date').mask('99/99/9999');
							$('#demo-msk-date2').mask('99-99-9999');
							$('#demo-msk-phone').mask('(999) 999-9999');
							$('#demo-msk-phone-ext').mask(
									'(999) 999-9999? x99999');
							$('#demo-msk-taxid').mask('99-9999999');
							$('#demo-msk-ssn').mask('999-99-9999');
							$('#demo-msk-pkey').mask('a*-999-a999');
						});
	</script>


	<!--=================================================-->
</body>

</html>