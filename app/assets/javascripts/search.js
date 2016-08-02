function searchThoughts() {
  var filter = $(this).val();

  $(".link").each(function(){
    if ($(this).clone().children('a').remove().end()
                       .children('.read-status').remove().end()
                       .text().search(new RegExp(filter, "i")) < 0) {
      $(this).hide();
    } else {
      $(this).show();
    }
  });
}
