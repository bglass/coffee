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
    window.coffee_choice or= {} 
    window.coffee_choice[name] = drink
    button.textContent = "#{button.name}: #{drink}"
    $.mobile.activePage.find('#products').panel("close")
    return

  $('#done').on 'click', (event) ->
    amount = {}
    for name, drink of window.coffee_choice
      amount[drink] = 0 unless amount[drink]
      amount[drink] += 1
    list = ""
    for drink, quantity of amount
      list += "<li>#{quantity} #{drink}</li>"

    $('#summaryList').html(list)

    location.hash = "summary"
    return
