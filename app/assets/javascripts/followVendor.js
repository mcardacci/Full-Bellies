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
    $('.follower-count').html(response.upvote);
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
    $('.follower-count').html(response.upvote);
  }).fail(function(error) {
    console.log("messed up");
  })
};
