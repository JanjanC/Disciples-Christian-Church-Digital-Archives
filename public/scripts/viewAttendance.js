

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


  var url = window.location.href
  var dateTodayUnformatted = url.split('view_attendance/')[1]
  var dateToday = dateTodayUnformatted.replace(/-/g, "");
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
      case '01':
          month = 'January';
          break;
      case '02':
          month = 'February';
          break;
      case '03':
          month = 'March';
          break;
      case '04':
          month = 'April';
          break;
      case '05':
          month = 'May';
          break;
      case '06':
          month = 'June';
          break;
      case '07':
          month = 'July';
          break;
      case '08':
          month = 'August';
          break;
      case '09':
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
 
  var status = document.getElementsByClassName("membership-status");
  for(var i = 0; i < status.length; i++)
  {
    if(status[i].textContent == '' || status[i].textContent == null){
      status[i].innerHTML = "Non-Member";
      status[i].parentNode.classList.add("non-member");
    }
    else{
      status[i].textContent = 'Member';
      status[i].parentNode.classList.add("member");
    }
  }

  $(".calendar-icon").click(function(){
    $('#exampleModal').modal('toggle');
    var today = new Date(dateTodayUnformatted);
    $('#date').val(today.getFullYear() + '-' + (today.getMonth() + 1).toString().padStart(2, '0') + '-' + today.getDate().toString().padStart(2, '0'))
  })

  $('#view-date-btn').on('click', function(){
    var date = new Date($('#date').val());
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    var viewDate = year + "-" + month.toString().padStart(2,'0') + "-" + day.toString().padStart(2,'0')

    location.href = './view_attendance/' + viewDate
  });

})