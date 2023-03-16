import { Controller } from "@hotwired/stimulus"
import { GoogleCharts } from "google-charts"

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ['chart']

  connect() {
    console.log(this.chartTarget)
    // GoogleCharts.load(this.drawChart.bind(this))
  }

  drawChart() {
    let data = new google.visualization.DataTable();
    data.addColumn('string', 'Topping');
    data.addColumn('number', 'Slices');
    data.addRows([
      ['Mushrooms', 3],
      ['Onions', 1],
      ['Olives', 1],
      ['Zucchini', 1],
      ['Pepperoni', 2]
    ]);

    let options = {'title':'How Much Pizza I Ate Last Night',
                 'width':400,
                 'height':300};

    let chart = new google.visualization.PieChart(document.getElementById('chart_div'));
  }
}
<script type="text/javascript">

// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {

  // Create the data table.


  // Set chart options


  // Instantiate and draw our chart, passing in some options.

  chart.draw(data, options);
}
</script>
