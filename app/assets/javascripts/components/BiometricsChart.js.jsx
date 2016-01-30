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
        if (data['date_labels'].length) {
          for(x = 0; x < data['date_labels'].length; x++){
            chartData.labels.push(moment(new Date(data['date_labels'][x])).format("DD/MM/YYYY"));
          } 
          for(x= 0; x < Object.keys(data['data']).length; x++){
            let label = Object.keys(data['data'])[x];
            let colors = this.props.setColor();
            chartData.datasets.push({
              label: label, 
              data: data['data'][label],
              fillColor: colors.fillColor,
              strokeColor: colors.color,
              pointColor: colors.color,
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: colors.color});
          }
          $('#workout_progress').empty();
          let options = { responsive: true, 
                          scaleShowGridLines: false, 
                          pointDotRadius: 3, 
                          bezierCurveTension: 0.8, 
                          multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"};
          new Chart($('#workout_progress').get(0).getContext('2d')).Line(chartData, options);
        }
      }).error(data => {
        console.log(data);
      }); 
  }
  render(){
    return(<div>
             <canvas id="workout_progress" />
           </div>);
  }
}