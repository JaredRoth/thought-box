function changeStatus() {
  var linkId = $(this).data('id');
  var statusMessage = $(this);
  var status = statusMessage.parent().data('status');

  $.ajax({
    method: 'PATCH',
    url: '/api/v1/links/' + linkId,
    dataType: "JSON",
    success: function(){
      var newStatus = status ? false : true;
      statusMessage.parent().data('status', newStatus);
      var text = statusMessage.html() === "Unread" ? "Read" : "Unread";
      statusMessage.html(text);
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

function resetStatusFilter() {
  $(".link").each(function(){
    $(this).show();
  });
}
