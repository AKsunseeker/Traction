class ExerciseLog extends React.Component{
  constructor(props) {
    super(props);
  }
  render(){
    let exercises = this.props.workouts.exercises.all.map(exercise => {
      let key = `exercise-${exercise.id}`
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