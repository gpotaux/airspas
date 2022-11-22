import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["test", "days"]

  connect() {
    console.log("trololo")
  }

  handleChange() {
    console.log(this.testTarget.value)
    let currentDate = Date.now();
    let result = Date.parse(this.testTarget.value) - currentDate;
    let numberOfDays = Math.round(result / 86400000);
    this.daysTarget.innerText = numberOfDays;
  }
}
