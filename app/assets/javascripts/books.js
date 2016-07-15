$(document).ready(function() {
  var counter = 0;
  for (var i=0; i < $(".book").length; i++) {
    setTimeout(function(){
      $("#book-" + counter).css("visibility", "visible").hide().fadeIn();
      counter++;
    }, 180*i);
  }

  $(".table-column-2").on("click", ".show-book-info-button", function(){
    $(this).toggleClass("show-book-info-button hide-book-info-button").text("Hide Book Info");
    $(".table-responsive").animate({ scrollLeft: 205 });
  });

  $(".table-column-2").on("click", ".hide-book-info-button", function(){
    $(this).toggleClass("show-book-info-button hide-book-info-button").text("Show Book Info");
  });

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
