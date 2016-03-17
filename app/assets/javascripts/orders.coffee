$ ->
  $('#peopleButtons').on 'click', 'button', (event) ->
    window.actual_group or= {}
    group = window.actual_group
    group[@name] = !group[@name]

    if group[@name]
      @.setAttribute('highlight', '')
      button = $("<button id='group' name='#{@name}'>#{@textContent}</button>")
      $('div#groupButtons').append(button).trigger('create')
    else
      @.removeAttribute('highlight')
      $("[id='group'][name='#{@name}']").remove()

    return

  $('#remove').on 'click', (event) ->
    window.active_person_button.remove()
    $.mobile.activePage.find('#products').panel("close")
    return

  $('#groupButtons').on 'click', 'button', (event) ->
    $.mobile.activePage.find('#products').panel("open")
    window.active_person_button = this
    return

  $('#productButtons').on 'click', 'button', (event) ->
    button = window.active_person_button
    drink  = @textContent
    button.setAttribute('choice', drink)
    button.setAttribute('ok', '')
    button.textContent = "#{button.name}: #{drink}"

    window.active_person_button = button.nextSibling
    if window.active_person_button
      window.active_person_button.focus()
    else
      $.mobile.activePage.find('#products').panel("close")
    return

  $('#done').on 'click', (event) ->

    amount  = {}
    choice  = {}

    people = $("button#group")
    for person in people
      drink = person.getAttribute('choice')
      choice[person.name] = drink
      amount[drink] or= 0
      amount[drink] += 1

    list = ""
    for drink, quantity of amount
      list += "<li>#{quantity} #{drink}</li>"

    $('#summaryList').html(list)

    location.hash = "summary"

    data = {}
    data['order'] = choice
    $.post("/static_pages/datadrop", data);

    return
