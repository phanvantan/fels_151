function startTimer(duration, display){
  var timer = duration, minutes, seconds;
  setInterval(function(){
    minutes = parseInt(timer / 60, 10)
    seconds = parseInt(timer % 60, 10);
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;
    if (--timer < -1){
      $("#submit-test-lesson").click();
    }
    else {
      $("#time").html(minutes + ":" + seconds);
    }
  }, 1000);
}
$(document).ready(function() {
  if ($("#time")){
    var fiveMinutes = 60 * 20,
    display = $("#time");
    startTimer(fiveMinutes, display);
  }
});
