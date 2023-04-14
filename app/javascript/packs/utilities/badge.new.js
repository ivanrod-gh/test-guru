document.addEventListener('turbolinks:load', function() {
  if (!document.querySelector('.badge-new-js')) return
  badge_requirement_id.addEventListener('change', selectChangeHandler)
  showAssociatedDataSelector()
  showRequiredDataSelectorIfEdit()
})

function selectChangeHandler() {
  $('.select-requirement').hide()
  showAssociatedDataSelector()
  selectsChoiceNullify()
}

function showAssociatedDataSelector() {
  index = badge_requirement_id.options.selectedIndex
  if (index === 0 || index === 1) {
    $('#required_test').show()
  } else if (index === 2) {
    $('#required_category').show()
  } else if (index === 3) {
    $('#required_percent').show()
  }
}

function selectsChoiceNullify() {
  select_divs = document.querySelectorAll('.select-requirement')
  for (var i = 0; i < select_divs.length; i++) {
    select_divs[i].lastElementChild.lastElementChild.options.selectedIndex = 0
  }
}

function showRequiredDataSelectorIfEdit() {
  var control = document.querySelector('.info-required-id')
  if (!control) return
  $('.select-requirement').hide()
  var index = badge_requirement_id.options.selectedIndex
  if (index == 0 || index == 1) {
    $('#required_test').show()
    badge_required_test_id.options.selectedIndex = control.dataset.requiredId
  } else if (index == 2) {
    $('#required_category').show()
    badge_required_category_id.options.selectedIndex = control.dataset.requiredId
  } else if (index == 3) {
    $('#required_percent').show()
    badge_required_percent.options.selectedIndex = control.dataset.requiredId
  }
}
