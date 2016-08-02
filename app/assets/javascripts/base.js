$(document).ready(function(){
  $(".my-links").on('click', '.read-status', changeStatus);
  $("#read-filter").on('click', filterRead);
  $("#unread-filter").on('click', filterUnread);
  $("#reset-status-filter").on('click', resetStatusFilter);
  $("#sort").on('click', sortByTitle);
  $("#search").on('keyup', searchThoughts);
});
