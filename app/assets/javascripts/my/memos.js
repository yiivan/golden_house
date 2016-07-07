$(document).ready(function() {

  $(".new-memo-button").on("click", ".show-new-memo-button", function(){
    $(this).toggleClass("show-new-memo-button hide-new-memo-button").text("Hide New Memo");
    $("html, body").animate({ scrollTop: $(document).height() - 75 + ($(".nested-fields").length * 399) });
  });

  $(".new-memo-button").on("click", ".hide-new-memo-button", function(){
    $(this).toggleClass("show-new-memo-button hide-new-memo-button").text("New Memo");
  });

  $(".segments").on("click", ".add-new-segment", function() {
    $("html, body").animate({ scrollTop: $(document).height() - 259 });
  });


  $(function() {
      $('#fr-editor').froalaEditor({
        height: 480
      });
  });
});
