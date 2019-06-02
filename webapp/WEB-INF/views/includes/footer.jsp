<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

<!-- FOOTER -->
<!--===================================================-->
<footer id="footer">

	<!-- Visible when footer positions are fixed -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div class="show-fixed pad-rgt pull-right">
		You have <a href="#" class="text-main"><span class="badge badge-danger">3</span> pending action.</a>
	</div>



	<!-- Visible when footer positions are static -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div class="hide-fixed pull-right pad-rgt">
		14GB of <strong>512GB</strong> Free.
	</div>



	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<!-- Remove the class "show-fixed" and "hide-fixed" to make the content always appears. -->
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<p class="pad-lft">&#0169; 2018 Your Company</p>



</footer>
<!--===================================================-->
<!-- END FOOTER -->