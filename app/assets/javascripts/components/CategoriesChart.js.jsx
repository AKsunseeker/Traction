class CategoriesChart extends React.Component{
  constructor(props){
    super(props);
  }
  componentDidMount(){
    chartData = [];
    $.ajax({
      url: 'get_categories_progress',
      type: 'GET',
      }).success(data => {
        if (data.length) {
          for(x = 0; x < data.length; x++){
            let label = Object.keys(data[x])[0]
            let value = data[x][label]
            let colors = this.props.setColor();
            chartData.push({
              label: label,
              value: value,
              color: colors.color,
              highlight: colors.fillColor
            })
          }
          $("#no_data_message").empty();
          $('#workout_progress').empty();
          let options = { responsive: true, 
                          animateRotate : true};
          new Chart($('#workout_progress').get(0).getContext('2d')).PolarArea(chartData, options);
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