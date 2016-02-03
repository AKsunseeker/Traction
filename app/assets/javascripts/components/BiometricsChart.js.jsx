class BiometricsChart extends React.Component{
  constructor(props){
    super(props);
  }
  componentDidMount(){
    chartData = {datasets: [], labels: []};
    $.ajax({
      url: 'get_biometrics_progress',
      type: 'GET',
      }).success(data => {
        if (data['date_labels']) {
          for(x = 0; x < data['date_labels'].length; x++){
            chartData.labels.push(moment(new Date(data['date_labels'][x])).format("DD/MM/YYYY"));
          } 
          for(x= 0; x < Object.keys(data['data']).length; x++){
            let label = Object.keys(data['data'])[x];
            let colors = [{fillColor: "rgba(183,28,28,0.1)", color: "rgba(183,28,28,1)"}, {fillColor: "rgba(13, 71, 161, 0.1)", color: "rgba(13, 71, 161, 1)"}];
            chartData.datasets.push({
              label: label, 
              data: data['data'][label],
              fillColor: colors[x].fillColor,
              strokeColor: colors[x].color,
              pointColor: colors[x].color,
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: colors[x].color});
          }
          $("#no_data_message").empty();
          $('#workout_progress').empty();
          let options = { responsive: true, 
                          scaleShowGridLines: false, 
                          pointDotRadius: 3, 
                          bezierCurveTension: 0.3, 
                          multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"};
          new Chart($('#workout_progress').get(0).getContext('2d')).Line(chartData, options);
        } else {
          $("#no_data_message").html(data);
        }
      }).error(data => {
        $("#no_data_message").html(data);
        console.log(data);
      }); 
  }
  render(){
    return(<div>
             <canvas id="workout_progress" />
           </div>);
  }
}