$ ->
	$( "#datepicker" ).datepicker();
	$('#datepicker').datepicker('option', {dateFormat: 'yy-mm-dd'});
	$('#datepicker').datepicker("setDate", new Date() );
	
