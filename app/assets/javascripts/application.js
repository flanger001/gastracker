//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets

Turbolinks.enableProgressBar();

$(document).on('ready page:load', function(e) {
  $('.flash').fadeOut(2500);
});

$(document).one('click', '#add_station', function(e) {
  $(this).parents('.row').after($(this).data('fields'));
});
