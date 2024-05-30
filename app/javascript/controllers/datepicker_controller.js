
import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const bookedDates = this.getBookedDates();


    flatpickr(this.element, {
      minDate: "today",
      enableTime: false,
      dateFormat: "Y-m-d",
      disable: bookedDates.map(date => ({ from: date.from, to: date.to })),
      onClose: selectedDates => {
        if (this.element.id === "start_date" && selectedDates.length > 0) {

          const endDateField = document.getElementById("end_date");

          const selectedStartDate = selectedDates[0];

          endDateField._flatpickr.set("minDate", selectedStartDate);
          const selectedEndDate = endDateField._flatpickr.selectedDates[0];

          if (selectedEndDate && selectedEndDate < selectedStartDate) {
            endDateField._flatpickr.setDate(selectedStartDate);
          }
        }
      }
    });
  }


  getBookedDates() {
    const bookingForm = this.element.closest("#booking-form");
    return JSON.parse(bookingForm.dataset.bookingsDates);
  }
}
