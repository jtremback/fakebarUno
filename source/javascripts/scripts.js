//SLIDING DOORS
$(document).ready(function() {
  var wrapperState;
  $(".hyp-summary").click(function(){
    $("#wrapper2").addClass("out");
    if (wrapperState === "out") {
      $("#wrapper1").click(function(){
        $("#wrapper2").removeClass("out");
      });
    }
    wrapperState = "out";
  });
});