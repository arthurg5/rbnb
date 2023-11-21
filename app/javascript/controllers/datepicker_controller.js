import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: 'Y-m-d', // Format of the selected date
      // Add more configuration options as needed
    });
  }
}
