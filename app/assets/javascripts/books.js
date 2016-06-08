$(document).ready(function() {
  var counter = 0;
  for (var i=0; i < $(".book").length; i++) {
    setTimeout(function(){
      $("#book-" + counter).fadeIn().css("display", "inline-block");
      counter++;
    }, 180*i);
  }

  $(function() {
    $('.datepicker').datepicker({
      changeMonth: true,
      changeYear: true,
      minDate: "-2000Y",
      maxDate: "+1Y"
    });
  });
});
