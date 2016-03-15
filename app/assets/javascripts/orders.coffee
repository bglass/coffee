$ ->
  $('#peopleButtons').on 'click', 'button', (event) ->
    button = $("<button name='#{@textContent}'>#{@textContent}</button>")
    $('div#groupButtons').append(button).trigger('create')
    return

  $('#remove').on 'click', (event) ->
    window.choosing_button.remove()
    $.mobile.activePage.find('#products').panel("close")
    return

  $('#groupButtons').on 'click', 'button', (event) ->
    $.mobile.activePage.find('#products').panel("open")
    window.choosing_button = this
    return

  $('#productButtons').on 'click', 'button', (event) ->
    button = window.choosing_button
    drink  = @textContent
    window.coffee_choice or= {} 
    window.coffee_choice[button.name] = drink
    button.textContent = "#{button.name}: #{drink}"
    $.mobile.activePage.find('#products').panel("close")
    return

# id="p#{i}" name="#{name}"


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
