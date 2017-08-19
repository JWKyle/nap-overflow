$(document).ready(function() {
  voteListener();
});

  var voteListener = function(){
    $(".upvote_form").on("click", function(){
    event.preventDefault();

    var $upvote_button = $(this);
    var $url = $(this).attr("action");
    var $method = $(this).attr("method");

     var $upvote = $(this).parents();

     var $points = $($upvote).next().next().next();

    var request = $.ajax({
      url: $url,
      method: $method
    })

    request.done(function(response){
      $points.html(response);
    })

    request.fail(function(response){
      console.log("you failed")
    })
  });
}
