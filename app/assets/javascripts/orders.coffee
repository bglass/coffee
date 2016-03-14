$ ->
  $('#peopleButtons').on 'click', 'button', (event) ->
    button = $("<button>#{@textContent}</button>")
    $('div#groupButtons').append(button).trigger('create')
    return

  $('#groupButtons').on 'click', 'button', (event) ->
    event.preventDefault()
    if confirm "Remove #{@textContent}"
      @remove()
    return

  return
