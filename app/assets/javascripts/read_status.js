$(document).ready(function(){
  $(".my-links").on('click', '.read-status', changeStatus);
  $("#read-filter").on('click', filterRead);
  $("#unread-filter").on('click', filterUnread);
  $("#reset-status-filter").on('click', resetStatusFilter);
  $("#search").on('keyup', filterThoughts);
});

function changeStatus() {
  var linkId = $(this).data('id');
  var statusMessage = $(this);
  var status = statusMessage.parent().data('status');

  $.ajax({
    method: 'PATCH',
    url: '/api/v1/links/' + linkId,
    dataType: "JSON",
    success: function(){
      var newStatus = status === 'true' ? 'false' : 'true';
      statusMessage.parent().attr('data-status', newStatus);
      var text = statusMessage.html() === "Unread" ? "Read" : "Unread";
      statusMessage.html(text);
    }
  });
}

function filterThoughts() {
  var filter = $(this).val();

  $(".link").each(function(){
    if ($(this).clone().children('form').remove().end()
                       .children('span').remove().end()
                       .text().search(new RegExp(filter, "i")) < 0) {
      $(this).hide();
    } else {
      $(this).show();
    }
  });
}

function filterRead() {
  $(".link").each(function(){
    if ($(this).data('status') === true) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function filterUnread() {
  $(".link").each(function(){
    if ($(this).data('status') === true) {
      $(this).hide();
    } else {
      $(this).show();
    }
  });
}
