$(document).ready ->
  if window.location.pathname == '/'
    labels = []
    dataPoints = []
    $.ajax 'get_workouts',
      type: 'GET'
      success: (data) ->
        debugger
        labels = Object.keys(data.records)
        for key of data.records
          dataPoints.push(data.records[key])
        data = {
          labels: labels
          datasets: [
            {
              label: "My first dataset",
              fillColor: "rgba(220,220,220,0.2)",
              strokeColor: "rgba(220,220,220,1)",
              pointColor: "rgba(220,220,220,1)",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(220,220,220,1)",
              data: dataPoints

            }
          ]
        }
      error: (data) ->
        debugger
    
        options = { respinsive: true, scaleShowGriLines: false, pointDotRadius: 3, bezierCurveTension: 0.8}

        $('#workout_progress').empty()
        new Chart($('#workout_progress').get(0).getContext('2d')).Line(data, {responsive: true})

  

