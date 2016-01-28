class Progress extends React.Component{
  constructor(props) {
    super(props);
    this.chartProgress = this.chartProgress.bind(this);
    this.state = {workouts: this.props.workouts};
  }

  chartProgress(){
    labels = [];
    datasets = [];
    $.ajax({
      url: 'get_exercise_progress',
      type: 'GET',
      data: {creator_id: this.refs.workout.value}
      }).success(data => {
        for(x = 0; x < data.length; x++){
          labels.push(data[x]['date']);
          dataPoints.push(data[x]['workout_progress']['sum']);
          debugger
        } 
      }).error(data => {
        console.log(data);
      });
       
  
    options = { responsive: true, scaleShowGriLines: false, pointDotRadius: 3, bezierCurveTension: 0.8}

    $('#workout_progress').empty()
    new Chart($('#workout_progress').get(0).getContext('2d')).Line(data, {responsive: true})
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


