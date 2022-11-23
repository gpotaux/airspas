import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["inputStartDate", "inputEndDate", "days", "bookingForm"]

  connect() {
    this.handleFlatpickr();
  }

  handleChange() {
    this.handleFlatpickr();
  }

  /**
   * Initialize the flatpickr from the range start
   * Min date is to avoid selecting a date that already passed
   * And diable bookings is to prevent selecting unavailable dates
   */
  handleFlatpickr = () => {
    console.log(this.bookingFormTarget);
    if (this.bookingFormTarget) {
      const bookings = JSON.parse(this.bookingFormTarget.dataset.bookings);
      flatpickr("#range_start", {
        minDate: "today",
        inline: true,
        mode: "range",
        dateFormat: "Y-m-d",
        "disable": bookings,
      })
    }
    this.handleNumberOfDays();
  }

  /**
   * Compare the endDate and the startDate
   * And insert the number of days into the HTML
   */
  handleNumberOfDays() {
    let startDate = Date.parse(this.inputStartDateTarget.value.split(' to ')[0])
    let endDate = Date.parse(this.inputStartDateTarget.value.split(' to ')[1])
    let result = endDate - startDate;
    let numberOfDays = Math.round(result / 86400000);
    if(!isNaN(endDate)) {
      this.daysTarget.innerText = numberOfDays;
    }
  }
}
