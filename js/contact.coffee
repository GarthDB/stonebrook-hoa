---
---
document.addEventListener 'DOMContentLoaded', ->

  contactForm = document.getElementById 'contact-form'
  inputs = contactForm.querySelectorAll '.uk-input, .uk-textarea, .uk-checkbox, [type="submit"]'

  toggleInputs = (disabled = true) ->
    inputs.forEach (input) ->
      input.disabled = disabled
      return

  submitListener = (e) ->
    e.preventDefault()
    UIkit.modal('#form-modal').show()
    return false

  UIkit.util.on('#form-modal', 'show', (e)-> toggleInputs())
  UIkit.util.on('#form-modal', 'hide', (e)-> toggleInputs(false))

  contactForm.addEventListener 'submit', submitListener, false

  return
