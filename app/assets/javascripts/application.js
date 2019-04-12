//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(function(e) {
    $(".flash__message-fade").delay(2500).fadeOut(1000);

    $(document).one("click", "#add_station", function(e) {
        $(this).parents(".row").after($(this).data("fields"));
    });
});
