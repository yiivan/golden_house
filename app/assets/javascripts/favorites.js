$(document).ready(function() {

  $(".favorite-container").on("click", ".favorite", function(){
    $(".ajax-flash-display").removeClass("alert alert-danger").text("");
    $.ajax({
      method: "POST",
      url: "/books/" + $(this).attr("data-book-id") + "/favorites"
    })
    .done(function(dat){
      var favoriteCount = parseInt($(this).attr("data-favorite-count")) + 1;
      $(this).toggleClass("unfavorite favorite").text("Unfavorite").attr({"data-favorite-id": dat.id, "data-favorite-count": favoriteCount});
      $(".favorites-count").text("(" + $(this).attr("data-favorite-count") + ")");
    }.bind(this))
    .fail(function(){
      $(".ajax-flash-display").addClass("alert alert-danger").text("You've already made this into your favorite!");
    });
  });

  $(".favorite-container").on("click", ".unfavorite", function(){
    $(".ajax-flash-display").removeClass("alert alert-danger").text("");
    $.ajax({
      method: "DELETE",
      url: "/books/" + $(this).attr("data-book-id") + "/favorites/" + $(this).attr("data-favorite-id")
    })
    .done(function(){
      var favoriteCount = parseInt($(this).attr("data-favorite-count")) - 1;
      $(this).toggleClass("favorite unfavorite").text("Favorite").attr({"data-favorite-id": "", "data-favorite-count": favoriteCount});
      $(".favorites-count").text("(" + $(this).attr("data-favorite-count") + ")");
    }.bind(this))
    .fail(function(){
      $(".ajax-flash-display").addClass("alert alert-danger").text("You've already unfavorited this book!");
    });
  });

});
