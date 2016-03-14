$ ->
  $('div#peopleButtons').on 'click', 'button', (event) ->
    r = $("<input type='button' value='#{@textContent}'>")
    $('div#groupButtons').append r
    return
