class Progress extends React.Component{
  constructor(props) {
    super(props);
    this.chartProgress = this.chartProgress.bind(this);
    this.state = {workouts: this.props.workouts};
  }

  chartProgress(){
    chartData = {datasets: [], labels: []};
    $.ajax({
      url: 'get_exercise_progress',
      type: 'GET',
      data: {creator_id: this.refs.workout.value}
      }).success(data => {
        if (data.length) {
          for(x = 0; x < data.length; x++){
            chartData.labels.push(data[x]['date']);
            chartData.datasets.push({data: data[x]['workout_progress']['sum']});
          } options = { responsive: true, scaleShowGriLines: false, pointDotRadius: 3, bezierCurveTension: 0.8}

          $('#workout_progress').empty()
          new Chart($('#workout_progress').get(0).getContext('2d')).Line(chartData, {responsive: true})
        }

      }).error(data => {
        console.log(data);
      });
       
  
  }

  render(){
    let workouts = this.props.workouts.map(workout => {
      let key = `workout-${workout.id}`
      return(<option key={key} value={workout.creator_id}>{workout.name}</option>);
    }); 
    return(<div>
             <h3 className='center'>Progress</h3>
             <form onSubmit={this.chartProgress}>
               <select ref='workout'>{workouts}</select>
               <button type='submit'>Show Chart</button>
             </form>
             <canvas id='workout_progress' />

           </div>)
  }
}


