document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('#user_password')
  var confirmation = document.querySelector('#user_password_confirmation')
  if (password && confirmation) { 
    password.addEventListener('input', checkPasswordConfirmationCoincidence)
    confirmation.addEventListener('input', checkPasswordConfirmationCoincidence)
  }
})

function checkPasswordConfirmationCoincidence() {
  var password = document.querySelector('#user_password')
  var confirmation = document.querySelector('#user_password_confirmation')
  var alertIcon = document.querySelector('.octicon-alert')
  var tooltipPassedText = document.querySelector('.info-password-passed').textContent
  var tooltipFailedText = document.querySelector('.info-password-failed').textContent

  if (!password.value || !confirmation.value) {
    alertIcon.classList.add('hide')
    confirmation.setAttribute('title', '')
    confirmation.style.borderColor = ''
    return
  }

  if (password.value === confirmation.value) {
    alertIcon.classList.remove('hide')
    alertIcon.classList.remove('red')
    alertIcon.classList.add('green')
    confirmation.setAttribute('title', tooltipPassedText)
    confirmation.style.borderColor = 'green'
  } else {
    alertIcon.classList.remove('hide')
    alertIcon.classList.remove('green')
    alertIcon.classList.add('red')
    confirmation.setAttribute('title', tooltipFailedText)
    confirmation.style.borderColor = 'red'
  }
}
