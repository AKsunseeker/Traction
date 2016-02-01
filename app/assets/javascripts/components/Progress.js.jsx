class Progress extends React.Component{
  constructor(props) {
    super(props);
    this.chartProgress = this.chartProgress.bind(this);
    this.chartBiometrics = this.chartBiometrics.bind(this);
    this.chartCategories = this.chartCategories.bind(this);
    this.showMotivation = this.showMotivation.bind(this);
    this.buildChart = this.buildChart.bind(this);
    this.state = {workouts: this.props.workouts, chartType: 'motivation'};
  }
  showMotivation(e){
    e.preventDefault();
    console.log('motivation clicked')
    this.setState({chartType: 'motivation'});
  }
  chartProgress(e){
    e.preventDefault();
    console.log('Progress clicked')
    this.setState({ chartType: 'workoutProgress' + this.refs.workout.value});
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
    if(this.state.chartType == 'motivation'){
      return(< Motivation />);
    }else if(this.state.chartType == 'workoutProgress' + this.refs.workout.value){
      return(< WorkoutChart key={this.refs.workout.value} setColor={this.setColor} randNumber={this.randNumber} rgb={this.rgb} rgba={this.rgba} creator_id={this.refs.workout.value}/>);
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
    if (this.props.workouts != null ){
      let workouts = this.props.workouts.map(workout => {
        let key = `workout-${workout.id}`
        return(<option key={key} value={workout.creator_id}>{workout.name}</option>);
      });
    } else {
      let workouts = []
    }
    return(<div>
             <div className="row">
                <h4 className='center red-text text-darken-4'>Progress</h4>
             </div>
             <hr/>
             <div className="">
               <div className="row">
                <div className="col s3 m3 l3">
                  <button onClick={this.showMotivation} className="progress-button btn red col s12">Motivates</button>
                </div> 
                <div className="col s3 m3 l3">
                  <button onClick={this.chartBiometrics} className="progress-button btn red col s12">Biometrics</button>
                </div> 
                <div className="col s3 m3 l3">
                 <button onClick={this.chartCategories} className="progress-button btn red col s12">Categories</button>
                </div> 
                <div className="col s3 m3 l3">
                 <form onSubmit={this.chartProgress} className="">
                   <button type='submit' className="progress-button btn red col s12" >Workouts</button>
                   <select ref='workout' onChange={this.chartProgress} className="col s12">{workouts}</select>
                 </form>
                </div>
               </div>
             </div>
              <div className="row">
                <h5 id="no_data_message" className="center red-text"></h5>
                { this.buildChart() }
              </div>
           </div>);
  }
}


