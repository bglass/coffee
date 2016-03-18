$ ->
  $('#peopleButtons').on 'click', 'button', (event) ->
    group[@name] = !group[@name]

    if group[@name]
      @.setAttribute('highlight', '')
      button = $("<button id='group' name='#{@name}'>#{@textContent}</button>")
      $('div#groupButtons').append(button).trigger('create')
    else
      @.removeAttribute('highlight')
      $("[id='group'][name='#{@name}']").remove()
    checkAllDone()
    return

  $('#remove').on 'click', (event) ->
    actor = $('#actor')
    button = actor.data('button')
    nextActor(button)
    button.remove()
    checkAllDone()

  $('#unknown').on 'click', (event) ->
    actor  = $('#actor')
    button = actor.data('button')
    button.text(button[0].name)
    button[0].removeAttribute('confirm')
    button[0].removeAttribute('choice')
    checkAllDone()
    nextActor(button)

  $('#groupButtons').on 'click', 'button', (event) ->
    $.mobile.activePage.find('#products').panel("open")
    setActor($(@))
    return

  setActor = (button) ->
    actor = $('#actor')
    actor.text(button[0].name)
    actor.data('button', button)
    return actor

  nextActor = (button) ->
    nextButton = button[0].nextSibling
    if nextButton
      setActor($(nextButton))
      nextButton.focus()
    else
      $.mobile.activePage.find('#products').panel("close")

  checkAllDone = -> 
    # alert "checking"
    doneButton = $("#done")
    people     = $("button#group")
    done = !!(people.length > 0)

    for person in people
      choice = person.getAttribute('choice')
      done = false unless choice

    # if done
    #   doneButton[0].removeAttribute('disabled')
    # else
    #   doneButton[0].setAttribute('disabled', 'disabled')

    if done
      doneButton[0].removeAttribute('disabled')
    else
      doneButton[0].setAttribute('disabled', 'disabled')




  $('#productButtons').on 'click', 'button', (event) ->
    drink  = @textContent
    actor  = $('#actor')
    button = actor.data('button')
    button.text("#{button[0].name}: #{drink}")
    button[0].setAttribute('choice', drink)
    button[0].setAttribute('confirm', '')
    checkAllDone()
    nextActor(button)

$ ->
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
    $.post("/orders", data);

    return
