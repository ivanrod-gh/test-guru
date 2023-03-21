document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('#table-with-values')
  var rows = [].slice.call(table.querySelectorAll('#table-row'))

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    rows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    rows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTable = document.createElement('div')
  sortedTable.setAttribute('id', 'table-with-values')
  for (var i = 0; i < rows.length; i++) {
    sortedTable.appendChild(rows[i])
  }
  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector("[class*='col']").textContent
  var testTitle2 = row2.querySelector("[class*='col']").textContent
  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector("[class*='col']").textContent
  var testTitle2 = row2.querySelector("[class*='col']").textContent
  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
