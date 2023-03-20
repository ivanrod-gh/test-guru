document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.form-inline-link')

  if (controls) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
      // Prevents Rails/UJS from GET HTTP action
      controls[i].removeAttribute('data-method')
    }
  }

  // $('.form-inline-link').each(function() {
  //   $(this).on('click', formInlineLinkHandler)
  //   $(this).removeAttr('data-method')
  // })

  var error = document.querySelector('.instance-errors')
  if (error) {
    var instanceId = error.dataset.instanceId
    formInlineHandler(instanceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()
  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  var row = document.querySelector('.row[data-test-id="' + testId + '"]')
  // var $link = $('.form-inline-link[data-test-id="' + testId + '"]')
  // var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  // var $row = $('.row[data-test-id="' + testId + '"]')

  // $testTitle.toggle()
  // $row.toggle()

  if (row.classList.contains('hide')) {
  // if ($row.is(':visible')) {
    testTitle.classList.add('hide')
    row.classList.remove('hide')
    link.textContent = document.querySelector('.admin-author-actions-cancel').textContent
    // $link.textContent = 'Cancel'
  } else {
    testTitle.classList.remove('hide')
    row.classList.add('hide')
    link.textContent = document.querySelector('.admin-author-actions-edit').textContent
    // $link.textContent = 'Edit'
  }
}
