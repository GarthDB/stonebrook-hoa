---
---
document.addEventListener 'DOMContentLoaded', ->
  # console.log(UIkit)
  # UIkit.notification('MyMessage', 'danger');
  contactForm = document.getElementById 'contact-form'
  inputs = contactForm.querySelectorAll '.uk-input, .uk-textarea, .uk-checkbox'
  cancel = document.getElementById 'contact-form__cancel'

  toggleInputs = (disabled = true) ->
    inputs.forEach (input) ->
      input.disabled = disabled
      return

  submitListener = (e) ->
    e.preventDefault()
    toggleInputs()
    modal = UIkit.modal('#form-modal')
    UIkit.util.on('#form-modal', 'hide', cancelListener)
    modal.show()
    return false

  cancelListener = (e) ->
    e.preventDefault()
    toggleInputs(false)

  contactForm.addEventListener 'submit', submitListener, false

  return
