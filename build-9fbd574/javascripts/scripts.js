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
  });

  $("#wrapper2").click(function(event) {
      alert('clicked inside');
      event.stopPropagation();
  });

});
