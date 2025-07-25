import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      minDate: this.element.dataset.datepickerMinDate || "today"
    })
  }
}