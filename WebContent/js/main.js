
						(function() {
							launchIntoFullscreen(document.documentElement);

							var box1 = document.getElementById('box1')
							var statusdiv = document
									.getElementById('statusdiv')
							var startx = 0
							var starty = 0
							var dist = 0
							var disty = 0

							box1
									.addEventListener(
											'touchstart',
											function(e) {
												var touchobj = e.changedTouches[0] // reference first touch point (ie: first finger)
												startx = parseInt(touchobj.clientX) // get x position of touch point relative to left edge of browser
												starty = parseInt(touchobj.clientY)
												statusdiv.innerHTML = 'Status: touchstart<br> ClientX and Y: '
														+ startx
														+ ' '
														+ starty
														+ ' px'
												e.preventDefault()
											}, false)

							box1
									.addEventListener(
											'touchmove',
											function(e) {
												var touchobj = e.changedTouches[0] // reference first touch point for this event
												var dist = parseInt(touchobj.clientX)
														- startx
												var disty = parseInt(touchobj.clientY)
														- starty
												statusdiv.innerHTML = 'Status: touchmove<br> Horizontal distance traveled: '
														+ dist
														+ 'px Vertical: '
														+ disty + 'px'
														 
												if (dist < 0) {
													if (parseInt(touchobj.clientX) % 16 == 0) {
														moveleft();
														 
													}
												}
												if (dist > 0) {
													if (parseInt(touchobj.clientX) % 16 == 0) {
														moveright();
														
													}
												}
												if (disty > 0) {
													if (parseInt(touchobj.clientY) % 9 == 0) {
														moveup();
														
													}
												}
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
						}
						)

		function moveright() {
			var returnMotor = 'R';
			$.get('MotorController', {
				leftright : returnMotor
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});
			prelocy = locy;
			$("#oldy").text(locationy);
			$("span:last").text(
					"( event.clientX, event.clientY ) : " + clientCoords);

		}

		function moveleft() {
			var returnMotor = 'L';
			$.get('MotorController', {
				leftright : returnMotor
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});
			prelocy = locy;
			$("#oldy").text(locationy);
			$("span:last").text(
					"( event.clientX, event.clientY ) : " + clientCoords);
		}

		function moveup() {
			var returnServo = 'U';
			$.get('ServoController', {
				updown : returnServo
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});

			$("#oldx").text(locationx);
			$("span:first")
					.text("( event.pageX, event.pageY ) : " + pageCoords);
		}
		function movedown() {
			var returnServo = 'D';
			$.get('ServoController', {
				updown : returnServo
			}, function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			});

			$("#oldx").text(locationx);
			$("span:first")
					.text("( event.pageX, event.pageY ) : " + pageCoords);
		}

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