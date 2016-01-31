class Progress extends React.Component{
  constructor(props) {
    super(props);
    this.chartProgress = this.chartProgress.bind(this);
    this.chartBiometrics = this.chartBiometrics.bind(this);
    this.chartCategories = this.chartCategories.bind(this);
    this.buildChart = this.buildChart.bind(this);
    this.state = {workouts: this.props.workouts };
  }
  chartProgress(e){
    e.preventDefault();
    console.log('Progress clicked')
    this.setState({ chartType: 'workoutProgress' });
  }
  chartBiometrics(e){
    e.preventDefault();
    console.log('biometrics clicked')
    this.setState({chartType: 'biometricsProgress'});
  }
  chartCategories(e){
    e.preventDefault();
    console.log('categories clicked')
    this.setState({chartType: 'categoriesChart'})
  }
  buildChart(){
    if(this.state.chartType == 'workoutProgress' ){
      return(< WorkoutChart setColor={this.setColor} randNumber={this.randNumber} rgb={this.rgb} rgba={this.rgba} creator_id={this.refs.workout.value}/>);
    } else if (this.state.chartType == 'biometricsProgress'){
      return(< BiometricsChart setColor={this.setColor} randNumber={this.randNumber} rgb={this.rgb} rgba={this.rgba} />);
    } else if (this.state.chartType == 'categoriesChart'){
      return(< CategoriesChart setColor={this.setColor} randNumber={this.randNumber} rgb={this.rgb} rgba={this.rgba} />);
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
                { this.buildChart() }
              </div>
           </div>);
  }
}


