class Progress extends React.Component{
  constructor(props) {
    super(props);
    this.chartProgress = this.chartProgress.bind(this);
    this.chartBiometrics = this.chartBiometrics.bind(this);
    this.buildChart = this.buildChart.bind(this);
    this.state = {workouts: this.props.workouts };
  }
  chartProgress(e){
    e.preventDefault();
    chartData = {datasets: [], labels: []};
    $.ajax({
      url: 'get_exercise_progress',
      type: 'GET',
      data: {creator_id: this.refs.workout.value}
      }).success(data => {
        if (data.length) {
          for(x = 0; x < data[1].length; x++){
            chartData.labels.push(moment(new Date(data[1][x])).format("DD/MM/YYYY"));
          } 
          for(x= 0; x < data[0].length; x++){
            let label = Object.keys(data[0][x])
            let colors = this.setColor();
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
          this.setState({chartData: chartData});
        }
      }).error(data => {
        console.log(data);
      });   
  
  }
  chartBiometrics(e){
    e.preventDefault();
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
            let label = Object.keys(data['data'])[x]
            let colors = this.setColor();
            chartData.datasets.push({
              label: data['data'][label], 
              data: data['data'][label],
              fillColor: colors.fillColor,
              strokeColor: colors.color,
              pointColor: colors.color,
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: colors.color});
          }
          this.setState({chartData: chartData});
        }
      }).error(data => {
        console.log(data);
      });   
  }
  chartCategories(e){

  }
  buildChart(){
    if(this.state.chartData){
      $('#workout_progress').empty();
      let options = { responsive: true, 
                      scaleShowGridLines: false, 
                      pointDotRadius: 3, 
                      bezierCurveTension: 0.8, 
                      multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"};
      new Chart($('#workout_progress').get(0).getContext('2d')).Line(this.state.chartData, options);
    }
  }
  rgb(r, g, b){
    return "rgba("+r+","+g+","+b+", 1)";
  }
  rgba(r,g,b) {
    return "rgba("+r+","+g+","+b+", 0.1)";
  }
  randNumber() {
    return Math.floor(Math.random() * 255);
  }
  setColor(){
    let r = this.randNumber();
    let g = this.randNumber();
    let b = this.randNumber();
    let color = this.rgb(r,g,b);
    let fillColor = this.rgba(r,g,b);
    return {fillColor: fillColor, color: color}
  }
  render(){
    // TODO only completed workouts, only once
    let workouts = this.props.workouts.map(workout => {
      let key = `workout-${workout.id}`
      return(<option key={key} value={workout.creator_id}>{workout.name}</option>);
    }); 
    return(<div>
             <h3 className='center'>Progress</h3>
             <div className="row">
               <div className="col s1">
                 <button onClick={this.chartBiometrics} className="btn">Biometrics</button>
               </div>
               <div className="col s1 offset-s3">
                 <button onClick={this.chartCategories} className="btn">Categories</button>
               </div>
               <div className="col s3 offset-s3">
                <form onSubmit={this.chartProgress}>
                  <select ref='workout'>{workouts}</select>
                  <button type='submit' className="btn">Show Chart</button>
                </form>
                </div>
              </div>
              <div className="row">
                <canvas id='workout_progress' />
                { this.buildChart() };
              </div>
           </div>);
  }
}


