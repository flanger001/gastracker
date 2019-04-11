//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(function(e) {
    $('.flash').fadeOut(2500);

    $(document).one('click', '#add_station', function(e) {
        $(this).parents('.row').after($(this).data('fields'));
    });
});
