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
    let options = {'colors' :["#7C0902", "#FFA000", "#C46210", "#F94D00", "#FF7538", "#FF0800", "#CC7F3B"],
                  'width':800,
                  'height':600};
    console.log(options)

    let chart = new google.visualization.PieChart(this.chartTarget);

    chart.draw(data, options);
  }
}
