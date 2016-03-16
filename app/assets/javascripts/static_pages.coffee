# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
#
# $ ->
#   $("#surrounding div").click ->
#     alert "You clicked on the sub-div with id = " + this.id
#     alert "See you next time!"
#
#
#
# $('div#peopleButtons').on 'click', 'button', (event) ->
#   r = $("<input type='button' value='#{@textContent}'>")
#   $('div#groupButtons').append r
#   return

$ ->
  $('#text-1').on 'input propertychange paste', ->
    # xhttp = new XMLHttpRequest
    # xhttp.open 'POST', "datadrop", true
    # xhttp.send(@value)
    data = {}
    data['title'] = @value
    data['subtitle'] = "be happy"
    $.post("datadrop", data);
    return
