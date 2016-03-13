$('#peopleButtons').on('click', 'button', function(event) {
  var name = this.textContent
  var r = $('<input type="button" value="' + name + '">');
    console.log ( '#someButton was clicked ' + name );
  $("div#groupButtons").append(r);
});
