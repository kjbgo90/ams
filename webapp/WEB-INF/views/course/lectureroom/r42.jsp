<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>

<div class="container-fluid bord-all bg-gray-dark mar-all panel" id="room42">
	<div class="row">
		<div class="col-lg-2 col-lg-offset-8 text-center bord-all bg-light icon-wrap-xs btn btn-default">출입구</div>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-2 col-lg-offset-5 text-center bord-all bg-light icon-wrap-xs" id="seatTeacher"><img class="img-circle img-sm btn btn-circle pad-no seatSel"></div>
	</div>
	<br><br><br>
	<div class="row">
		<div class="col-lg-1 col-lg-offset-2 text-center bord-all bg-light icon-wrap-xs" id="seat1" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="1" ></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat2" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="2" ></div>
		<div class="col-lg-1 col-lg-offset-3 text-center bord-all bg-light icon-wrap-xs" id="seat3" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="3" ></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat4" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="4" ></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat5" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="5" ></div>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-1 col-lg-offset-2 text-center bord-all bg-light icon-wrap-xs" id="seat6" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="6" ></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat7" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="7" ></div>
		<div class="col-lg-1 col-lg-offset-3 text-center bord-all bg-light icon-wrap-xs" id="seat8" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="8" ></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat9" ><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="9" ></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat10"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="10"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-1 col-lg-offset-2 text-center bord-all bg-light icon-wrap-xs" id="seat11"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="11"></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat12"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="12"></div>
		<div class="col-lg-1 col-lg-offset-3 text-center bord-all bg-light icon-wrap-xs" id="seat13"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="13"></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat14"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="14"></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat15"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="15"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-lg-1 col-lg-offset-2 text-center bord-all bg-light icon-wrap-xs" id="seat16"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="16"></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat17"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="17"></div>
		<div class="col-lg-1 col-lg-offset-3 text-center bord-all bg-light icon-wrap-xs" id="seat18"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="18"></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat19"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="19"></div>
		<div class="col-lg-1 col-lg-offset-0 text-center bord-all bg-light icon-wrap-xs" id="seat20"><img class="img-circle img-sm btn btn-circle pad-no seatSel" data-target='#seat-decide-modal' data-toggle='modal' data-seatno="20"></div>
	</div>
	<br>
	<br>
</div>