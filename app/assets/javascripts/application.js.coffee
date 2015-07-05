#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets

Turbolinks.enableProgressBar()

$(document).on 'ready page:load', (e) ->
  $('.flash').fadeOut 2500

$(document).one 'click', '#add_station', (e) ->
  $(@).parents('.row').after($(@).data('fields'))
