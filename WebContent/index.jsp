<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"/>


<body>

    <div class=container>
    <br>
    <br>
    <br>
    <div class="col-xs-12 text-center">
   <p>System is doing preparations</p> 
   <script type="text/javascript">
        setTimeout (function(){
        document.getElementById('submitButton').disabled = null;
        },10000);

        var countdownNum = 10;
        incTimer();

        function incTimer(){
        setTimeout (function(){
            if(countdownNum != 0){
            countdownNum--;
            document.getElementById('timeLeft').innerHTML = 'Time left: ' + countdownNum + ' seconds';
            incTimer();
            } else {
            document.getElementById('timeLeft').innerHTML = 'Ready!';
            }
        },1000);
        }
    </script>
   <a href="homeButton.jsp" class="btn btn-info" role="button"  id="submitButton">enter</a> 
    
        <p id="timeLeft">Time Left: 10 seconds</p>
        </div>
      </div>  
</body>
</html>