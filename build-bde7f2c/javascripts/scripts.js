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


//THREAD COLLAPSER


  // $("#photos img:in-viewport").each(function() {
  //   message = message + $(this).attr("src") + "<br />";
  // });

  // $("#wrapper2").bind("scroll", function(event){
  //   var sc = $(this).scrollTop();
  //   $(".holder").append(sc);
  // });

  $(window).bind("scroll", function(event){
    $("#special .hyp-threadexp").each(function(){
      var greatGranPar = $(this).parent().parent().parent()
      if ($(window).scrollTop() >= $(this).offset().top) {
        greatGranPar.css("padding-left", "0");
      }
      else {
        greatGranPar.css("padding-left", "");
      }
      $(this).parent().css("width", "100%");
    });
  });

});



