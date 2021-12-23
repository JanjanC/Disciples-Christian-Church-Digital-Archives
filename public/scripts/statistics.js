$(document).ready(function () {
    //Bar chart
    new Chart(document.getElementById("bar-chart"), {
        type: 'bar',
        data: {
          labels: ["Members", "Non-members"],
          datasets: [
            {
              backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
              data: [43,12]
            }
          ]
        },
        options: {
          legend: { display: false   },
          title: {
            display: true,
            text: 'Predicted world population (millions) in 2050'
          },
          plugins: {
            legend: false,
         },
         responsive: false
        }
    });

    //pie chart
    new Chart(document.getElementById("pie-chart"), {
        type: 'pie',
        data: {
          labels: ["Members", "Non-members"],
          datasets: [{
            label: "Population (millions)",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
            data: [43,12]
          }]
        },
        options: {
          title: {
            display: false,
          }
        }
    });
})

async function getCountPerEventData() {
  data.startDate = $("#startDateField").value();
  data.endDate = $("#endDateField").value();

  $.ajax({
    type: 'POST',
    data: data,
    url: '/get_count_event_data',
    success: function (result) {
      const counts = result.values();
      const chart = new Chart(document.getElementById("pie-chart"), {
        data: {
          type: 'pie',
          labels: ["Baptisms", "Dedications", "Prenups", "Weddings"],
          datasets: [{
            label: "Count of events",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
            data: counts
          }],
          options: {
            title: {
              display: false,
            }
          }
        }
      });
    }
  });
}