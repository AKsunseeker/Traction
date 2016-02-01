class WorkoutChart extends React.Component {
  constructor(props){
    super(props);
  }
  componentDidMount(){
    chartData = {datasets: [], labels: []};
    $.ajax({
      url: 'get_exercise_progress',
      type: 'GET',
      data: {creator_id: this.props.creator_id}
      }).success(data => {
        if (data.length) {
          for(x = 0; x < data[1].length; x++){
            chartData.labels.push(moment(new Date(data[1][x])).format("DD/MM/YYYY"));
          } 
          for(x= 0; x < data[0].length; x++){
            let label = Object.keys(data[0][x]);
            let colors = this.props.setColor();
            chartData.datasets.push({
              label: label[0], 
              data: data[0][x][label],
              fillColor: colors.fillColor,
              strokeColor: colors.color,
              pointColor: colors.color,
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: colors.color});
          }
          $("#no_data_message").empty();
          $('#workout_progress').empty();
          let options = { responsive: true, 
                          scaleShowGridLines: false, 
                          pointDotRadius: 3, 
                          bezierCurveTension: 0.8, 
                          multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"};
          new Chart($('#workout_progress').get(0).getContext('2d')).Line(chartData, options);
        } else {
          $("#no_data_message").html("No Data");
        }
        }).error(data => {
          debugger
          $("#no_data_message").html("No Data");
          console.log(data);
        }); 
  }
  render(){
    return(<div id="chart">
             <canvas id="workout_progress" />
           </div>);
  }
}