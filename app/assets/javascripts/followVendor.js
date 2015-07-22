$(document).ready(function(){
  $('.follow-button').on('click', follow);
  $('.unfollow-button').on('click', unfollow);
});

var follow = function(event) {
  event.preventDefault();
  event.stopPropagation();
  var $target = $(event.target);
  var route = $target.attr('href');
  $.ajax({
    url : route,
    method : 'PUT',
    dataType : 'json'
  }).done(function(response) {
    var index = $target.attr("id").replace('idx', '')
    $(".follower-count." + index).html(response.upvote)
    $target.parent().children('.follow-button').hide();
    //fix the hide glyph and make a hover button
    $(".glyphicon.glyphicon-thumbs-up").hide();
    $target.parent().children('.unfollow-button').show();
  }).fail(function(error) {
    console.log("messed up");
  })
};

var unfollow = function(event) {
  event.preventDefault();
  event.stopPropagation();
  var $target = $(event.target);
  var route = $target.attr('href');
  $.ajax({
    url : route,
    method : 'DELETE',
    dataType : 'json'
  }).done(function(response) {
     var index = $target.attr("id").replace('idx', '')
    $(".follower-count." + index).html(response.downvote)
    $target.parent().children('.unfollow-button').hide();
    $target.parent().children('.follow-button').show();
  }).fail(function(error) {
    console.log("messed up");
  })
};
