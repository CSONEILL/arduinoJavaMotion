<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<style>
div {
	min-width: 800px;
	min-height: 750px;
	max-height: 99%;
	max-width: 99%;
	background: yellow;
}

.box {
	box-sizing: box;
	height: 99%;
	height: 99%;
}

.border-box {
	box-sizing: border-box;
}
</style>
</head>
<body>

	<div class="box" id="box1">
		<h4>Move your finger for testing on/2</h4>
		<h3 id="statusdiv">Status</h3>
	</div>



	<script>
	/*
	* Main function for basic PAN and TILT 
	* touchscreen detection code is based on work made by www.javascriptkit.com
	*/
	
	
	
	
		launchIntoFullscreen(document.documentElement);
		window
				.addEventListener(
						'load',
						function() {
							launchIntoFullscreen(document.documentElement);

							var box1 = document.getElementById('box1')
							var statusdiv = document
									.getElementById('statusdiv')
							var startx = 0
							var starty = 0
							var dist = 0
							var disty = 0
/*create a event listener that detects finger  location before displacement on touchscreen*/
/*This listener is working all the time*/
							box1
							
									.addEventListener(
											'touchstart',
											function(e) {
												var touchobj = e.changedTouches[0] // reference first touch point (ie: first finger)
												startx = parseInt(touchobj.clientX) // get x position of touch point relative to left edge of browser
												starty = parseInt(touchobj.clientY) // get y position of touch point relative to down edge of browser
												statusdiv.innerHTML = 'Status: touchstart<br> ClientX and Y: '
														+ startx
														+ ' '
														+ starty
														+ ' px'
												e.preventDefault()
											}, false)
/*create a event listener that detects finger  location after displacement on touchscreen*/											

							box1
									.addEventListener(
											'touchmove',
											function(e) {
												var touchobj = e.changedTouches[0] // reference first touch point for this event
												var dist = parseInt(touchobj.clientX)
														- startx // return distance travelled by finger on x coordinate
												var disty = parseInt(touchobj.clientY)
														- starty // return distance travelled by finger on y coordinate
												statusdiv.innerHTML = 'Status: touchmove<br> Horizontal distance traveled: '
														+ dist
														+ 'px Vertical: '
														+ disty + 'px'
		/* The numbers 16 and 9 are used based on the idea the screen has a 16x9 proportion */
		/* Because the mayority of windows tablet / devices have a 1920 x1080 resolution    */
		
		/* Note : left and right are the movements made by the stepper motor and up and down are the movements made by the servo */
        /* depending on the travelling direction the result could be either a negative or a positive number  */
        /* if the value on dist is positive returns a remament of zero after being divided by 16 then it will send a left signal   */
												if (dist < 0) {
													if (parseInt(touchobj.clientX) % 16 == 0) {
														moveleft();
														 
													}
												}
											     /* if the value on dist is negative returns a remament of zero after being divided by 16 then it will send a right signal   */										
												
												if (dist > 0) {
													if (parseInt(touchobj.clientX) % 16 == 0) {
														moveright();
														
													}
												}
											     /* if the value on dist is positive and returns a remament of zero after being divided by 9 then it will send a up signal   */
												if (disty > 0) {
													if (parseInt(touchobj.clientY) % 9 == 0) {
														moveup();
														
													}
												}
												/* if the value on dist is positive and returns a remament of zero after being divided by 9 then it will send a down signal   */
												if (disty < 0) {
													if (parseInt(touchobj.clientY) % 9 == 0) {
														movedown();
														
													}
												} else {
													
												}

												e.preventDefault()
											}, false)

							box1
									.addEventListener(
											'touchend',
											function(e) {
												var touchobj = e.changedTouches[0] // reference first touch point for this event
												statusdiv.innerHTML = 'Status: touchend<br> Resting x coordinate: '
														+ touchobj.clientX
														+ 'px and x coordinate '
														+ touchobj.clientY
												e.preventDefault()
											}, false)

						}, false)
/**
 * Sends to server a Right movement signal
 * CSO
 */
		function moveright() {
			var returnMotor = 'R';
			$.get('MotorController', {
				leftright : returnMotor
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});
		

		}
		/**
		 * Sends to server a Left movement signal
		 * CSO
		 */
		function moveleft() {
			var returnMotor = 'L';
			$.get('MotorController', {
				leftright : returnMotor
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});
			
		}
		/**
		 * Sends to server an Up movement signal
		 * CSO
		 */
		function moveup() {
			var returnServo = 'U';
			$.get('ServoController', {
				updown : returnServo
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});

			
		}
		/**
		 * Sends to server a Down movement signal
		 * CSO
		 */
		function movedown() {
			var returnServo = 'D';
			$.get('ServoController', {
				updown : returnServo
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});

			
		}
/**
 * calls web to be fullscreen
 */
		function launchIntoFullscreen(element) {
			if (element.requestFullscreen) {
				element.requestFullscreen();
			} else if (element.mozRequestFullScreen) {
				element.mozRequestFullScreen();
			} else if (element.webkitRequestFullscreen) {
				element.webkitRequestFullscreen();
			} else if (element.msRequestFullscreen) {
				element.msRequestFullscreen();
			}
		}
	</script>


</body>
</html>