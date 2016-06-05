$(document).ready(function() {

  $(".new-memo-button").on("click", ".show-new-memo-button", function(){
    $(this).toggleClass("show-new-memo-button hide-new-memo-button").text("Hide New Memo");
  });

  $(".new-memo-button").on("click", ".hide-new-memo-button", function(){
    $(this).toggleClass("show-new-memo-button hide-new-memo-button").text("New Memo");
  });

});
