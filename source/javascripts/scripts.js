//SLIDING DOORS
$(document).ready(function(){

  $(".hyp-summary").click(function(event){
    $("#wrapper2").addClass("out");
    $("#wrapper1").addClass("compressed");
    $("#wrapper3").addClass("compressed");
    event.stopPropagation();    
  });

  $(".history").click(function(event){
    $("#wrapper3").addClass("shown");
    event.stopPropagation();    
  });

  $(".thispage").click(function(event){
    $("#wrapper3").removeClass("shown");
    event.stopPropagation();    
  });

  $(document).click(function(event) {
    $("#wrapper2").removeClass("out");
    $("#wrapper1").removeClass("compressed");
    $("#wrapper3").removeClass("compressed");
    $(".hyp-heatmap-tab").removeClass("flip");
  });

  $("#wrapper2").click(function(event) {
    alert('clicked inside');
    event.stopPropagation();
  });
//FLIPPER
  $(".hyp-heatmap-tab.side").click(function(event){
    event.stopPropagation();
    $(this).addClass("flip");
  });

});



