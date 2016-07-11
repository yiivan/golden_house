$(document).ready(function() {
  var counter = 0;
  for (var i=0; i < $(".book").length; i++) {
    setTimeout(function(){
      $("#book-" + counter).css("visibility", "visible").hide().fadeIn();
      counter++;
    }, 180*i);
  }

  $(function() {
    $('.datepicker').datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd',
      minDate: "-2000Y",
      maxDate: "+1Y"
    });
  });
});
