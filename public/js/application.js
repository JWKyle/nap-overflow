$(document).ready(function() {
  voteListener();
});

   // var upvoteListener = function(){

  var voteListener = function(){ $(".questions-container").on("click", ".upvote", function(){
    event.preventDefault();

    var $upvote_button = $(this);
    var $url = $(this).attr("action");
    var $method = $(this).attr("method");

    var request = $.ajax({
      url: $url,
      method: $method
    })

    request.done(function(response){
      console.log(response);
      $upvote_button.closest(".questions-container").find("p.votes").html()

    })

    request.fail(function(response){
      console.log("you failed")
    })
  });
}
