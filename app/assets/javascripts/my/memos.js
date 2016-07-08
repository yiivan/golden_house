$(document).ready(function() {

  $(".new-memo-button").on("click", ".show-new-memo-button", function(){
    $(this).toggleClass("show-new-memo-button hide-new-memo-button").text("Hide New Memo");
    $("html, body").animate({ scrollTop: $(document).height() - 24 });
  });

  $(".new-memo-button").on("click", ".hide-new-memo-button", function(){
    $(this).toggleClass("show-new-memo-button hide-new-memo-button").text("New Memo");
  });

  $(".memo-index").on("click", ".cancel-button", function(){
    var memoId = $(this).attr("id")
    $(".edit-" + memoId).hide();
    $(".show-" + memoId).show();
  });

  $(function() {
      $('.fr-editor').froalaEditor({
        height: 420
      });
  });
});
