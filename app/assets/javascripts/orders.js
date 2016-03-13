addAnother = function() {
    var group = document.getElementById("grouplist");
    var button = document.createElement("button");
    var children = group.children.length + 1
    button.setAttribute("id", "element"+children)
    button.setAttribute("class", "ui-btn ui-corner-all")

    button.appendChild(document.createTextNode("Element "+children));
    group.appendChild(button)
}
