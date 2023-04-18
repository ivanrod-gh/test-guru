document.addEventListener('turbolinks:load', function() {
  if (!document.querySelector('.timer-js')) return
  timer_controller()
})

function timer_controller() {
  var time = document.querySelector('.info-time-left').dataset.timeLeft
  if (!time) return
  $('.test-timer').show()

  setTimer(time)

  var timer = setInterval(function() {
    time--
    setTimer(time)
    if (time <= -2) {
      clearInterval(timer)
      document.querySelector('#input_form').lastElementChild.submit()
    }
  }, 1000)
}

function setTimer(time) {
  if (time < 1) {
    document.querySelector('.test-timer').style.color = 'red'
    document.querySelector('#test_timer_string').textContent = generateTimerString(0)
  } else {
    document.querySelector('#test_timer_string').textContent = generateTimerString(time)
  }
}

function generateTimerString(time) {
  var min = Math.floor(time / 60)
  var sec = time - Math.floor(time / 60) * 60

  if (min < 10) { min = '0'+min }
  if (sec < 10) { sec = '0'+sec }

  return min+':'+sec
}
