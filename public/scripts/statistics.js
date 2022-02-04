$(document).ready(function () {
    //Bar chart

    initDate();
    
    // var attendanceBar = new Chart(document.getElementById("bar-chart"), {
    //     type: 'bar',
    //     data: {
    //       labels: ["Members", "Non-members"],
    //       datasets: [
    //         {
    //           backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
    //           data: [43,12]
    //         }
    //       ]
    //     },
    //     options: {
    //       legend: { display: false  },
    //       title: {
    //         display: true,
    //         text: 'Predicted world population (millions) in 2050'
    //       },
    //       plugins: {
    //         legend: false,
    //      },
    //      responsive: false
    //     }
    // });
    var memberTypePie = new Chart(document.getElementById("pie-chart-member-type"), {
      type: 'pie',
      data: {
        labels: ["Regular Member (Resident)", "Regular Member (Non Resident)", "Associate Member", "Affiliate Member", "Preparatory Member", "Honorary Member"],
        datasets: [{
          label: "Member Type",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#5373c2"],
          data: [0, 0, 0, 0, 0, 0]
        }]
      },
      options: {
        plugins: {
          legend: {
             position: "top",align: "start"
           }
        },
        title: {
          display: false,
        }
      }
    });

    var memberStatusBar = new Chart(document.getElementById("bar-chart-member-status"), {
        type: 'bar',
        data: {
          labels: ["Active", "Inacitve", "Deceased"],
          datasets: [{
            label: "Member Status",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
            data: [0, 0, 0]
          }]
        },
        options: {
          legend: { display: false  },
          title: {
            display: false,
          },
          plugins: {
            legend: false,
          },
        }
    });

    var eventPie = new Chart(document.getElementById("pie-chart-events"), {
      type: 'pie',
      data: {        
        labels: ["Baptisms", "Dedications", "Prenups", "Weddings"],
        datasets: [{
          label: "Count of events",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [0, 0, 0, 0]
        }],
      },
      options: {
        title: {
          display: false,
        }
      }
    });

    // TEST ONLY
    var attendanceChart = new Chart(document.getElementById("line-chart"), {
      type: 'line',
      data: {
        labels: ["January","February","March","April","May","June","July","August","September","October","November","December"],
        datasets: [{ 
          data: [0,0,0],
          label: '# of Attendees',
          backgroundColor: "#3e95cd"
        }
        ]
      },
      options: {
        title: {
          display: true,
          text: 'World population per region (in millions)'
        }
      },
    });

    

    // console.log(`eventPie` + attendancePie)
    // console.dir(attendancePie)
    getCountPerEventData(eventPie)
    getMemberStatusData(memberStatusBar)
    getMemberTypeData(memberTypePie)
    getAttendanceData(attendanceChart)
    $('#change-date-btn').click(function(){
      //compareDate
      if(!checkValidDate())
        return

      if(!checkValidDateRange())
        return
      // Update graphs
      getCountPerEventData(eventPie)
      getMemberStatusData(memberStatusBar)
      getMemberTypeData(memberTypePie)
      getAttendanceData(attendanceChart)
      
      // Update date label
      changeDate();
    })

    function initDate(){
      var date = new Date();

      var firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
      var lastDate = new Date(date.getFullYear(), date.getMonth() + 1, 0);

      var firstDay = firstDate.getDate();
      var lastDay = lastDate.getDate();
      var year = firstDate.getFullYear();
      
      var monthName = firstDate.toLocaleString('default', { month: 'long' })
      
      // Date Label
      $("#date-range").text(`${monthName} ${firstDay}, ${year} - ${monthName} ${lastDay}, ${year}`)

      // Update input fields
      $('#starting-date').val(firstDate.getFullYear() + '-' + (firstDate.getMonth() + 1).toString().padStart(2, '0') + '-' + firstDate.getDate().toString().padStart(2, '0'))
      $('#ending-date').val(lastDate.getFullYear() + '-' + (lastDate.getMonth() + 1).toString().padStart(2, '0') + '-' + lastDate.getDate().toString().padStart(2, '0'))
    }

    function changeDate(){
      // YYYY-MM-DD
      var startDate = new Date($("#starting-date").val())
      var endDate =  new Date($("#ending-date").val())

      var startMonth = startDate.toLocaleString('default', { month : 'long'} )
      var endMonth = endDate.toLocaleString('default', { month : 'long'} )

      // Date Label
      $("#date-range").text(`${startMonth} ${startDate.getDate()}, ${startDate.getFullYear()} - ${endMonth} ${endDate.getDate()}, ${endDate.getFullYear()}`)  
    }

    function checkValidDate(){
      var startDate = new Date($("#starting-date").val())
      var endDate =  new Date($("#ending-date").val())
      if(!dateCompare(startDate,endDate)){
   
        $("#error-msg").text('Starting date must precede ending date')
        $("#error-msg").css('display','block')
        return false
      }
      else{
        $("#error-msg").text('')
        $("#error-msg").css('display','none')
        return true
      }
   }

   function checkValidDateRange(){
    var startDate = new Date($("#starting-date").val())
    var endDate =  new Date($("#ending-date").val())

    var startYear = startDate.getFullYear()
    var endYear = endDate.getFullYear()

    if((endYear - startYear) > 5){
      $("#error-msg").text('The date range should not exceed 5 years')
      $("#error-msg").css('display','block')
      return false
    }
    else{
      $("#error-msg").text('')
      $("#error-msg").css('display','none')
      return true
    }
      
   }

    function dateCompare(date1, date2){
      return new Date(date2) > new Date(date1);
    }

  $(function () {
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();

    if (month < 10)
      month = '0' + month.toString();
    if (day < 10)
      day = '0' + day.toString();

    var maxDate = year + '-' + month + '-' + day;
    $('#starting-date').attr('max', maxDate);
   

 
  });

  $('#starting-date').change(function () {

    var dtToday = new Date();
    var yearToday = dtToday.getFullYear();
    var dateChosen = new Date($('#starting-date').val());
    var dayChosen = dateChosen.getDate();
    var monthChosen = dateChosen.getMonth() + 1;
    var yearChosen = dateChosen.getFullYear();

    if (monthChosen < 10)
      monthChosen = '0' + monthChosen.toString();
    if (dayChosen < 10)
      dayChosen = '0' + dayChosen.toString();

    var htmlDate = '#starting-date'

    dateExceeds(yearToday,yearChosen,monthChosen,dayChosen,htmlDate);    
  });

  $('#ending-date').change(function () {

    var dtToday = new Date();
    var yearToday = dtToday.getFullYear();
    var dateChosen = new Date($('#ending-date').val());
    var dayChosen = dateChosen.getDate();
    var monthChosen = dateChosen.getMonth() + 1;
    var yearChosen = dateChosen.getFullYear();

    if (monthChosen < 10)
      monthChosen = '0' + monthChosen.toString();
    if (dayChosen < 10)
      dayChosen = '0' + dayChosen.toString();

    var htmlDate = '#ending-date'

    dateExceeds(yearToday, yearChosen, monthChosen, dayChosen,htmlDate);
  });

  function dateExceeds(yearToday,yearChosen,monthChosen,dayChosen,htmlDate){

    var dateExceeded = false;

    if (yearToday < yearChosen) {
      dateExceeded = true;
    }

    if (dateExceeded == true) {
      var acceptedDate = `${yearToday}-${monthChosen}-${dayChosen}`;
      let result = acceptedDate.replace(/^\s+|\s+$/gm, '');
     
      $(htmlDate).val(result)
    }
  }
});

async function getCountPerEventData(eventPie) {
  var data = {}
  data.startDate = $("#starting-date").val();
  data.endDate = $("#ending-date").val();



  $.ajax({
    type: 'POST',
    data: data,
    url: '/get_count_event_data',
    success: function (result) {
      //console.log('entered here')
      //console.log(`result is ` + JSON.stringify(result))
      var isEmpty = false
      const counts = Object.keys(result).map(function(val){
        return result[val]
      })



      var res = Object.values(counts).every(o => o === 0); //check if all values returned are 0 
      
      if(res == true){

          $("#no-data-events").css('display','block')
          $("#pie-chart-events").css('display','none')
          $("#filler-div-4").css('display','block')
      }
      else{
          $("#no-data-events").css('display','none')
          $("#pie-chart-events").css('display','block')
          $("#filler-div-4").css('display','none')
      }


      //console.log(`val of counts ${counts}`)
      removeData(eventPie)    
      addData(eventPie,counts)
    }
  });
}

async function getMemberStatusData(memberStatusBar) {
  var data = {}
  data.startDate = $("#starting-date").val();
  data.endDate = $("#ending-date").val();

  $.ajax({
    type: 'POST',
    data: data,
    url: '/get_count_member_status_data',
    success: function (result) {
      // console.log('entered here')
      // console.log(`result is ` + JSON.stringify(result))
      
      const counts = Object.keys(result).map(function(val){
        return result[val]
      })

      var res = Object.values(counts).every(o => o === 0);

      if(res == true){
          // $("#bar-chart-member-status").css('display','none')
          $("#no-data-member-status").css('display','block')
          $("#bar-chart-member-status").css('display','none')
          $("#filler-div-2").css('display','block')
      }
      else{
          $("#bar-chart-member-status").css('display','block')
          $("#no-data-member-status").css('display','none')
          $("#filler-div-2").css('display','none')
      }

      // console.log(`val of counts ${counts}`)
      removeData(memberStatusBar)    
      addData(memberStatusBar, counts)
    }
  });
}

async function getMemberTypeData(memberTypePie) {
  var data = {}
  data.startDate = $("#starting-date").val();
  data.endDate = $("#ending-date").val();

  $.ajax({
    type: 'POST',
    data: data,
    url: '/get_count_member_type_data',
    success: function (result) {
      const counts = Object.keys(result).map(function(val){
        return result[val]
      })

      var res = Object.values(counts).every(o => o === 0); //check if all values returned are 0 

      if(res == true){
          // $("#pie-chart-member-type").css('display','none')
          $("#no-data-member-type").css('display','block')
          $("#pie-chart-member-type").css('display','none')
          $("#filler-div-1").css('display','block')
      }
      else{
          $("#pie-chart-member-type").css('display','block')
          $("#no-data-member-type").css('display','none')
          $("#filler-div-1").css('display','none')
      }
      
      removeData(memberTypePie)    
      addData(memberTypePie, counts)
    }
  });
}

async function getAttendanceData(attendanceLine) {
  var data = {}
  data.startDate = $("#starting-date").val();
  data.endDate = $("#ending-date").val();

  $.ajax({
    type: 'POST',
    data: data,
    url: '/get_count_attendance_data',
    success: function (result) {
      if (!result.error) {
        const counts = Object.keys(result).map(function(val){
          return result[val]
        })


        var res = Object.values(counts).every(o => o === 0); //check if all values returned are 0 

        if(res == true){
          
            // $("#pie-chart-member-type").css('display','none')
            $("#no-data-attendance").css('display','block')
            $("#line-chart").css('display','none')
            $("#filler-div-3").css('display','block')
        }
        else{
            $("#no-data-attendance").css('display','none')
            $("#line-chart").css('display','block')
            $("#filler-div-3").css('display','none')
        }

        removeDataSet(attendanceLine)
        addDataSet(attendanceLine, Object.keys(result), counts)
      }
      else{
            $("#no-data-attendance").css('display','block')
            $("#line-chart").css('display','none')
            $("#filler-div-3").css('display','block')
      }
    }
  });
}

function addData(chart, data) {
  chart.data.datasets[0].data = data;
  chart.update();
}

function addDataSet(chart, labels, data) {
  chart.data.datasets[0].data = data;
  chart.data.labels = labels;
  chart.update();
}

function removeDataSet(chart) {
  chart.data.datasets[0].data = [];
  chart.data.labels = [];
  chart.update();
}

function removeData(chart) {
  chart.data.datasets[0].data = [];
  chart.update();
}

function displayEmptyChart(chart){

}