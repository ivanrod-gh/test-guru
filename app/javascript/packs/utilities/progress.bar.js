document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.info-progress')

  if (!control) { return }

  var currentProgress = control.dataset.currentProgress
  var maximumProgress = control.dataset.maximumProgress

  if (currentProgress && maximumProgress) {
    var progressBarCurrent = document.querySelector('.js-progress-bar-current')
    var progressBarOveral = document.querySelector('.js-progress-bar-overal')

    progressBarOveral.style.width = String((currentProgress / maximumProgress) * 100) + '%'
    progressBarCurrent.style.width = String(((currentProgress - 1) / currentProgress) * 100) + '%'
  }
})
