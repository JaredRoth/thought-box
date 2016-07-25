$(document).ready(function(){
  $(".my-links").on('click', '.read-status', changeStatus);
});

function changeStatus() {
  var linkId = $(this).data('id');
  var status = $(this);

  $.ajax({
    method: 'PATCH',
    url: '/api/v1/links/' + linkId,
    dataType: "JSON",
    success: function(){
      var text = status.html() === "Mark as Unread" ? "Mark as Read" : "Mark as Unread";
      status.html(text);
    }
  });
}
