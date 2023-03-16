import { Controller } from "@hotwired/stimulus"
import { GoogleCharts } from "google-charts"

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ['chart']

  static values = {
    sweetness: Number,
    sourness: Number,
    saltiness: Number,
    savoriness: Number,
    bitterness: Number,
    spiciness: Number,
    fattiness: Number
  }

  connect() {
    console.log(this.sweetnessValue)
    console.log(this.sournessValue)
    console.log(this.saltinessValue)
    console.log(this.savorinessValue)
    GoogleCharts.load(this.drawChart.bind(this))
  }

  drawChart() {
    let data = new google.visualization.DataTable();
    data.addColumn('string', 'Flavor');
    data.addColumn('number', 'Percentage');
    data.addRows([
      ['Sweetness', this.sweetnessValue],
      ['Sourness', this.sournessValue],
      ['Saltiness', this.saltinessValue],
      ['Savoriness', this.savorinessValue],
      ['Bitterness', this.bitternessValue],
      ['Spiciness', this.spicinessValue],
      ['Fattiness', this.fattinessValue]
    ]);
    let options = {'colors' :["#7C0902", "#FFA000", "#FFD700", "#F94D00", "#D2691E", "#FFBF00"],
                  'width':800,
                  'height':400};
    console.log(options)

    let chart = new google.visualization.PieChart(this.chartTarget);

    chart.draw(data, options);
  }
}
