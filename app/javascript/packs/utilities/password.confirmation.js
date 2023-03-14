document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#user_password_confirmation')
  if (control) { 
    control.addEventListener('input', checkConfirmationCoincidence)
    var control = document.querySelector('#user_password')
    if (control) { control.addEventListener('input', checkConfirmationCoincidence) }
  }
})

function checkConfirmationCoincidence() {
  var confirmation = document.querySelector('#user_password_confirmation')
  var password = document.querySelector('#user_password')
  var alertIcon = document.querySelector('.octicon-alert')
  var tooltipPassed = document.querySelector('#tooltip-password-passed').textContent
  var tooltipFailed = document.querySelector('#tooltip-password-failed').textContent

  if (password.value && confirmation.value) {
    if (password.value == confirmation.value) {
      alertIcon.classList.remove('hide')
      alertIcon.classList.remove('red')
      alertIcon.classList.add('green')
      confirmation.setAttribute('title', tooltipPassed)
      confirmation.style.borderColor = 'green'
    } else {
      alertIcon.classList.remove('hide')
      alertIcon.classList.remove('green')
      alertIcon.classList.add('red')
      confirmation.setAttribute('title', tooltipFailed)
      confirmation.style.borderColor = 'red'
    }
  } else if (!password.value || !confirmation.value) {
    alertIcon.classList.add('hide')
    confirmation.setAttribute('title', '')
    confirmation.style.borderColor = ''
  }
}
