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
        if (data.length > 0) {
          for(x = 0; x < data.length; x++){
            let label = Object.keys(data[x])[0]
            let value = data[x][label]
            let colors = [{fillColor: "rgba(183,28,28,0.1)", color: "rgba(183,28,28,1)"}, 
                          {fillColor: "rgba(13, 71, 161, 0.1)", color: "rgba(13, 71, 161, 1)"},
                          {fillColor: "rgba(46, 125, 50, 0.1)", color: "rgba(46, 125, 50, 1)"},
                          {fillColor: "rgba(0, 131, 143, 0.1)", color: "rgba(0, 131, 143, 1)"},
                          {fillColor: "rgba(94, 53, 177, 0.1)", color: "rgba(94, 53, 177, 1)"},
                          {fillColor: "rgba(255, 143, 0, 0.1)", color: "rgba(255, 143, 0, 1)"}
                          ];
            chartData.push({
              label: label,
              value: value,
              color: colors[x].color,
              highlight: colors[x].fillColor
            })
          }
          $("#no_data_message").empty();
          $('#workout_progress').empty();
          let options = { responsive: true, 
                          animateRotate : true};
          new Chart($('#workout_progress').get(0).getContext('2d')).PolarArea(chartData, options);
        } else {
          $("#no_data_message").html("No Data");
        }
      }).error(data => {
        $("#no_data_message").html("No Data");
        console.log(data);
      }); 
  }
  render(){
    return(<div>
             <canvas id="workout_progress" />
           </div>);
  }
}