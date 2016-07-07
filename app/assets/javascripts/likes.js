$(document).ready(function() {

  $(".like-container").on("click", ".like", function(){
    $(".ajax-flash-display").removeClass("alert alert-danger").text("");
    $.ajax({
      method: "POST",
      url: "/books/" + $(this).attr("data-book-id") + "/memos/" + $(this).attr("data-memo-id") + "/likes"
    })
    .done(function(dat){
      var likeCount = parseInt($(this).attr("data-like-count")) + 1;
      var likeIcon = ".like-icon-" + $(this).attr("data-memo-id");
      var likesCountID = "#likes-count-" + $(this).attr("data-memo-id");
      $(this).toggleClass("unlike like").attr({"data-like-id": dat.id, "data-like-count": likeCount});
      $(likeIcon).toggleClass("blue-thumb gray-thumb");
      $(likesCountID).text("(" + $(this).attr("data-like-count") + ")");
    }.bind(this))
    .fail(function(){
      $(".ajax-flash-display").addClass("alert alert-danger").text("You've already liked this memo!");
    });
  });

  $(".like-container").on("click", ".unlike", function(){
    $(".ajax-flash-display").removeClass("alert alert-danger").text("");
    $.ajax({
      method: "DELETE",
      url: "/books/" + $(this).attr("data-book-id") + "/memos/" + $(this).attr("data-memo-id") + "/likes/" + $(this).attr("data-like-id")
    })
    .done(function(){
      var likeCount = parseInt($(this).attr("data-like-count")) - 1;
      var likeIcon = ".like-icon-" + $(this).attr("data-memo-id");
      var likesCountID = "#likes-count-" + $(this).attr("data-memo-id");
      $(this).toggleClass("like unlike").attr({"data-like-id": "", "data-like-count": likeCount});
      $(likeIcon).toggleClass("blue-thumb gray-thumb");
      $(likesCountID).text("(" + $(this).attr("data-like-count") + ")");
    }.bind(this))
    .fail(function(){
      $(".ajax-flash-display").addClass("alert alert-danger").text("You've already unliked this memo!");
    });
  });

});
