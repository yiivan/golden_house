$(document).ready(function() {
  var counter = 0;
  for (var i=0; i < $(".books").length; i++) {
    setTimeout(function(){
      $("#book-" + counter).fadeIn().css("display", "inline-block");
      counter++;
    }, 180*i);
  }
});
