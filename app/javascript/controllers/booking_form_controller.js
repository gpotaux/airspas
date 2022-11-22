import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["inputStartDate", "days"]
  connect() {
  }


  handleChange() {
    let currentDate = Date.now();
    let result = Date.parse(this.inputStartDateTarget.value) - currentDate;
    let numberOfDays = Math.round(result / 86400000);
    this.daysTarget.innerText = numberOfDays;
  }
}
