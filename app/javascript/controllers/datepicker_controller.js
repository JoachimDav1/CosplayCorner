import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      minDate: "today",
      enableTime: false,
      dateFormat: "Y-m-d",
      mode: "range"
    });
  }
}
