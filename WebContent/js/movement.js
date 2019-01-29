/*
 * movemement.js
 * CSO
 * April 15th,2017
 * mouse detection
 * This Javascript detect(for now) mouse location inside the area where the video will be located
 * */

$( "#rectangle" ).mousemove(function( event ) {
	 var parentOffset = $(this).parent().offset();
  var locationx=(event.pageX-parentOffset.left);
  var locationy=(event.pageY - parentOffset.top);
  var prelocx;
  var prelocy;
 
  var pageCoords = "( " + locationx + ", " + locationy + " )";
  var clientCoords = "( " + event.clientX + ", " + event.clientY + " )";
 
 
  var locx = locationx/10;
  var locy =locationy/10;
  
  if(locx>prelocx)
  {
	  var returnServo ='U';
	  $.get('ServoController', {
		  updown : returnServo
	  }, function(responseText) {
          $('#ajaxGetUserServletResponse').text(responseText);
	  });
	  prelocx=locx;
	  $( "span:first" ).text( "( event.pageX, event.pageY ) : " + pageCoords );
  }
  else
	  {
	  var returnServo ='D';
		  $.get('ServoController', {
			  updown : returnServo
		  }, function(responseText) {
              $('#ajaxGetUserServletResponse').text(responseText);
		  });
		  prelocx=locx;
	  $( "span:first" ).text( "( event.pageX, event.pageY ) : " + pageCoords );
	  
	  }
  if(locy>prelocy)
	  {
	  var returnMotor ='L';
		  $.get('ServoController', {
			  leftright : returnServo
		  }, function(responseText) {
              $('#ajaxGetUserServletResponse').text(responseText);
		  });
		  prelocy=locy;
	  $( "span:last" ).text( "( event.clientX, event.clientY ) : " + clientCoords );
	  }
  else
	  {
	  var returnMotor ='R';
		  $.get('ServoController', {
			  leftright : returnServo
		  }, function(responseText) {
              $('#ajaxGetUserServletResponse').text(responseText);
		  });
		  prelocy=locy;
	  $( "span:last" ).text( "( event.clientX, event.clientY ) : " + clientCoords );
	  
	  }
}

); 








