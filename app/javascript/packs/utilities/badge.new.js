document.addEventListener('turbolinks:load', function() {
  if (!document.querySelector('#badge_new_js')) return
  badge_requirement_id.addEventListener('change', selectChangeHandler)
  badge_requirement_id.options.selectedIndex = 1
  $('#required_test').show()
  var control = document.querySelector('.info-required-id')
  if (!control) return
  var index = badge_requirement_id.options.selectedIndex
  if (index == 0 || index == 1) {
    $('#required_test').show()
    badge_test_id.options.selectedIndex = control.dataset.requiredId
  } else if (index == 2) {
    $('#required_category').show()
    badge_category_id.options.selectedIndex = control.dataset.requiredId
  } else if (index == 3 && control.dataset.requiredId === '50') {
    $('#required_percent').show()
    badge_percent_half.checked = true
  } else if (index == 3 && control.dataset.requiredId === '100') {
    $('#required_percent').show()
    badge_percent_completely.checked = true
  }
})

function selectChangeHandler() {
  index = this.options.selectedIndex
  if (index === 0 || index === 1) {
    $('#required_test').show()
    $('#required_category').hide()
    $('#required_percent').hide()
  } else if (index === 2) {
    $('#required_test').hide()
    $('#required_category').show()
    $('#required_percent').hide()
  } else if (index === 3) {
    $('#required_test').hide()
    $('#required_category').hide()
    $('#required_percent').show()
  }
}
