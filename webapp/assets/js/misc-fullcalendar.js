
// Misc-FullCalendar.js
// ====================================================================
// This file should not be included in your project.
// This is just a sample how to initialize plugins or components.
//
// - ThemeOn.net -



$(document).on('nifty.ready', function() {
	
	// load schedule list
	var schedule;
	$.ajax({
		url : "/ams/schedule/load",
		async: false, // ajax 결과 값을 반환시켜 변수에 담기 위해 작성한 코드ㄴ
		type: "post",
		contentType : "application/json",

		dataType : "json",
		success : function(list) {
			schedule = list
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
    // Calendar
    // =================================================================
    // Require Full Calendar
    // -----------------------------------------------------------------
    // http://fullcalendar.io/
    // =================================================================


    // initialize the external events
    // -----------------------------------------------------------------
    $('#demo-external-events .fc-event').each(function() {
        // store data so the calendar knows to render an event upon drop
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick: true, // maintain when user navigates (see docs on the renderEvent method)
            className : $(this).data('class')
        });


        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 99999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });
    });
    
    // CHOSEN
	// =================================================================
	// Require Chosen
	// http://harvesthq.github.io/chosen/
	// =================================================================
	$('#demo-chosen-select').chosen();
	$('#demo-cs-multiselect').chosen({width : '100%'});

    // Initialize the calendar
    // -----------------------------------------------------------------
	
    $('#demo-calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function() {
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        defaultDate: '2019-06-01',
        eventLimit: true, // allow "more" link when too many events
        events: [
        	// event name: purple, mint, warning, danger, success, dark, pink etc... 
        	{
                title: schedule[3].scheduleName,
                start: schedule[3].startDate,
                end: schedule[3].endDate,
                className: schedule[3].eventColor
            }
        ]
    });
    
    events.push({
        title: schedule[2].scheduleName,
        start: schedule[2].startDate,
        end: schedule[2].endDate,
        className: schedule[2].eventColor
    })

});
