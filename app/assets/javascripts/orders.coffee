$ ->
  $('#peopleButtons').on 'click', 'button', (event) ->
    button = $("<button>#{@textContent}</button>")
    $('div#groupButtons').append(button).trigger('create')
    return

  $('#groupButtons').on 'click', 'button', (event) ->
    if confirm "Remove #{@textContent}"
      @remove()
    return

  $('#choiceButtons').on 'click', 'button', (event) ->
    $.mobile.activePage.find('#products').panel("open")
    window.choosing_button = this
    return

  $('#productButtons').on 'click', 'button', (event) ->
    button = window.choosing_button
    drink  = @textContent
    name   = button.textContent
    window.coffee_choice = {} unless window.coffee_choice
    window.coffee_choice[name] = drink

    button.textContent = "#{button.name}: #{drink}"
    $.mobile.activePage.find('#products').panel("close")
    return
