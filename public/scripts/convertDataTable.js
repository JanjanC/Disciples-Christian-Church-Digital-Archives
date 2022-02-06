$(document).ready(function() {
  $.fn.dataTable.moment('MM/DD/YYYY')

  jQuery.extend( jQuery.fn.dataTableExt.oSort, {
    "formatted-num-pre": function ( a ) {
        a = (a === "-" || a === "") ? 0 : a.replace( /[^\d\-\.]/g, "" );
        return parseFloat( a );
    },
 
    "formatted-num-asc": function ( a, b ) {
        return a - b;
    },
 
    "formatted-num-desc": function ( a, b ) {
        return b - a;
    }
  });


  var table = $('#dataTable').DataTable({
    responsive: true,
    dom: 'Blfrtip',
    columnDefs: [
      { type: 'formatted-num', targets: 0 },
      { type: 'formatted-num', targets: 2 },
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
})

