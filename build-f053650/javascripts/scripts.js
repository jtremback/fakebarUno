//SLIDING DOORS
$(document).ready(function(){

  $(".hyp-summary").click(function(){
    $("#wrapper2").addClass("out");
    $("#wrapper1").addClass("compressed");
    event.stopPropagation();    
  });

  $(document).click(function() {
    $("#wrapper2").removeClass("out");
    $("#wrapper1").removeClass("compressed");
    $(".hyp-heatmap-tab").removeClass("flip");
  });

  $("#wrapper2").click(function(event) {
      alert('clicked inside');
      event.stopPropagation();
  });
//FLIPPER
  $(".hyp-heatmap-tab.side").click(function(){
    event.stopPropagation();
    $(this).addClass("flip");
  });

});



