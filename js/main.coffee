---
---
document.addEventListener 'DOMContentLoaded', ->
  navExpander = document.getElementById 'nav-expander'

  toggleExpander = (e) ->
    e.currentTarget.parentElement.classList.toggle("open");
    return false

  navExpander.addEventListener 'click', toggleExpander, false
  return
