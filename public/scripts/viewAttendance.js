

$(document).ready(function() {
    $.fn.dataTable.moment('MM/DD/YYYY')

  var table = $('#dataTable').DataTable({
    dom: 'Blfrtip',
    columnDefs: [
      {
        "targets": '_all',
        "createdCell": function (td, cellData, rowData, row, col) {
          $(td).css('padding', '14px')
        }
      }
    ],
    buttons: [
      'copy', 'excel', 'csv', 'pdf', 'colvis'
    ],
    "lengthMenu": [10, 15, 25]
  })

  $('th').css('border-bottom', '3px black double')
  $('#dataTable').on('click', 'tbody tr', function() {
    if ($(this).data('href') !== undefined)
      window.location.href = $(this).data('href')
  })

  var url = window.location.href
  var dateToday = url.split('view_attendance/')[1]
  var year = "",month = "",day = ""

  for(i = 0 ; i < 8 ; i ++){
    if(i < 4)
      year += dateToday[i]
    else if (i < 6)
      month += dateToday[i]
    else  
      day += dateToday[i]
  }


function getMonth (mm)
  {
    switch(mm) {
      case '1':
          month = 'January';
          break;
      case '2':
          month = 'February';
          break;
      case '3':
          month = 'March';
          break;
      case '4':
          month = 'April';
          break;
      case '5':
          month = 'May';
          break;
      case '6':
          month = 'June';
          break;
      case '7':
          month = 'July';
          break;
      case '8':
          month = 'August';
          break;
      case '9':
          month = 'September';
          break;
      case '10':
          month = 'October';
          break;
      case '11':
          month = 'November';
          break;
      case '12':
          month = 'December';
          break;
   }
 }
  getMonth(month)
  var formattedDate = month + " " + day + ", " + year
  $("#curr_date").text(formattedDate)
 
})