---
---
document.addEventListener 'DOMContentLoaded', ->
  contactForm = document.getElementById 'contact-form'
  inputs = contactForm.querySelectorAll '.contact-form__inputs'
  cancel = document.getElementById 'contact-form__cancel'

  toggleInputs = (disabled = true) ->
    inputs.forEach (input) ->
      input.disabled = disabled
      return

  submitListener = (e) ->
    toggleInputs()
    return false

  cancelListener = (e) ->
    console.log('cancel')
    toggleInputs(false)

  contactForm.addEventListener 'submit', submitListener, false
  cancel.addEventListener 'click', cancelListener, false

  return
