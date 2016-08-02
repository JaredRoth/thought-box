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
