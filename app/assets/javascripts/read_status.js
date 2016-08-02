$(document).ready(function(){
  $(".my-links").on('click', '.read-status', changeStatus);
  $("#read-filter").on('click', filterRead);
  $("#unread-filter").on('click', filterUnread);
  $("#reset-status-filter").on('click', resetStatusFilter);
  $("#sort").on('click', sortByTitle);
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
      var newStatus = status ? false : true;
      statusMessage.parent().data('status', newStatus);
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
    if ($(this).children('span').text() === "Read") {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function filterUnread() {
  $(".link").each(function(){
    if ($(this).children('span').text() === "Read") {
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

function sortByTitle() {
  var thoughts = $(".my-links").children(".link");
  var sorted = $(this).data('sorted');

  thoughts.sort(function(a,b){
    var an = a.getAttribute('data-title').toLowerCase();
    var bn = b.getAttribute('data-title').toLowerCase();

    if(an > bn) {
      return sorted ? -1 : 1;
    }
    if(an < bn) {
      return sorted ? 1 : -1;
    }
    return 0;
  });

  $(this).data('sorted', !sorted);
  thoughts.detach().appendTo(".my-links");
}
